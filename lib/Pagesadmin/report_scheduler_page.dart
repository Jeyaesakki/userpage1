import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Scheduler',
      debugShowCheckedModeBanner: false,
      home: ReportSchedulerPage(),
    );
  }
}

class ScheduledReport {
  final String id;
  final String scheduleName;
  final String createdDate;
  final String schedulerTime;

  ScheduledReport({
    required this.id,
    required this.scheduleName,
    required this.createdDate,
    required this.schedulerTime,
  });
}

class ReportSchedulerPage extends StatefulWidget {
  const ReportSchedulerPage({super.key});

  @override
  _ReportSchedulerPageState createState() => _ReportSchedulerPageState();
}

class _ReportSchedulerPageState extends State<ReportSchedulerPage> {
  List<ScheduledReport> scheduledReports = [];

  void _deleteReport(String id) {
    setState(() {
      scheduledReports.removeWhere((report) => report.id == id);
    });
  }

  void _addReport(ScheduledReport report) {
    setState(() {
      scheduledReports.add(report);
    });
  }

  void _showCreateScheduleModal() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: FractionallySizedBox(
            alignment: Alignment.center,
            widthFactor: 0.85,
            heightFactor: 0.8,
            child: CreateScheduledReportModal(onReportCreated: _addReport),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: const Text('Report Scheduler', style: TextStyle(color: kTextColor)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: kTextColor),
          onPressed: () => Navigator.of(context).maybePop(),
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: SizedBox.expand(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor,
                        foregroundColor: kTextColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text("Create Report Scheduler"),
                      onPressed: _showCreateScheduleModal,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Expanded(flex: 3, child: Text('Report Schedule Name', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                      Expanded(flex: 2, child: Text('Created Date', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                      Expanded(flex: 2, child: Text('Scheduled Time', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                      Expanded(flex: 1, child: Text('Delete', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12))),
                    ],
                  ),
                  const SizedBox(height: 10),
                  if (scheduledReports.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(child: Text('No scheduled reports yet', style: TextStyle(color: Colors.black54))),
                    )
                  else
                    ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: scheduledReports.length,
                      itemBuilder: (context, index) {
                        final report = scheduledReports[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Row(
                            children: [
                              Expanded(flex: 3, child: Text(report.scheduleName, style: TextStyle(fontSize: 12))),
                              Expanded(flex: 2, child: Text(report.createdDate, style: TextStyle(fontSize: 12))),
                              Expanded(flex: 2, child: Text(report.schedulerTime, style: TextStyle(fontSize: 12))),
                              Expanded(
                                flex: 1,
                                child: IconButton(
                                  icon: Icon(Icons.delete_outline, color: Colors.red[400]),
                                  onPressed: () => _deleteReport(report.id),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CreateScheduledReportModal extends StatefulWidget {
  final Function(ScheduledReport) onReportCreated;

  const CreateScheduledReportModal({super.key, required this.onReportCreated});

  @override
  _CreateScheduledReportModalState createState() => _CreateScheduledReportModalState();
}

class _CreateScheduledReportModalState extends State<CreateScheduledReportModal> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  String? selectedReportType;
  String? selectedTime;

  bool isValidEmail(String email) => RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$').hasMatch(email);
  bool isValidMobile(String mobile) => RegExp(r'^[0-9]{10}$').hasMatch(mobile);

  void _createSchedule() {
    if (_formKey.currentState!.validate()) {
      if (selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Please select schedule time")));
        return;
      }

      final newReport = ScheduledReport(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        scheduleName: _nameController.text.trim(),
        createdDate: DateTime.now().toString().split(" ")[0],
        schedulerTime: selectedTime!,
      );

      widget.onReportCreated(newReport);
      Navigator.pop(context);
    }
  }

  InputDecoration denseInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 12),
      isDense: true,
      contentPadding: const EdgeInsets.symmetric(vertical: 7, horizontal: 9),
      border: const OutlineInputBorder(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
      backgroundColor: Colors.transparent,
      child: Container(
        constraints: const BoxConstraints(maxWidth: 700, maxHeight: 800),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 9),
              decoration: const BoxDecoration(
                color: kAppBarColor,
                borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: kTextColor),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'Report Scheduler',
                      style: TextStyle(color: kTextColor, fontSize: 15, fontWeight: FontWeight.bold),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _nameController,
                        style: const TextStyle(fontSize: 12),
                        decoration: denseInputDecoration('Report Schedule Name'),
                        validator: (value) => value == null || value.trim().isEmpty ? 'Please enter schedule name' : null,
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        decoration: denseInputDecoration('Choose Report List'),
                        style: const TextStyle(fontSize: 12),
                        items: ['Check-in', 'Check-out', 'Late check-in', 'On leave', 'Absent']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(() => selectedReportType = val),
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _emailController,
                        style: const TextStyle(fontSize: 12),
                        decoration: denseInputDecoration('Email (Optional)'),
                        validator: (value) {
                          if (value != null && value.trim().isNotEmpty && !isValidEmail(value.trim())) {
                            return 'Enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      TextFormField(
                        controller: _mobileController,
                        style: const TextStyle(fontSize: 12),
                        decoration: denseInputDecoration('Mobile (Optional)'),
                        keyboardType: TextInputType.phone,
                        inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                        validator: (value) {
                          if (value != null && value.trim().isNotEmpty && !isValidMobile(value.trim())) {
                            return 'Please enter a valid 10 digit mobile number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),
                      DropdownButtonFormField<String>(
                        decoration: denseInputDecoration('Schedule Time'),
                        style: const TextStyle(fontSize: 12),
                        items: ['07:00 PM', '08:00 PM', '09:00 PM', '10:00 PM']
                            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                            .toList(),
                        onChanged: (val) => setState(() => selectedTime = val),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SizedBox(
                            width: 70,
                            child: OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                textStyle: const TextStyle(fontSize: 12),
                              ),
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                          ),
                          SizedBox(
                            width: 70,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(vertical: 14),
                                backgroundColor: kButtonColor,
                                textStyle: const TextStyle(fontSize: 12),
                              ),
                              onPressed: _createSchedule,
                              child: const Text('Create', style: TextStyle(color: Colors.white)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}