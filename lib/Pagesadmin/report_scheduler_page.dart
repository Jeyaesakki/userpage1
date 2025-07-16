import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;



class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Report Scheduler',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ReportSchedulerPage(),
      debugShowCheckedModeBanner: false,
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
    final isWeb = MediaQuery.of(context).size.width > 800;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: Container(
            width: isWeb ? 800 : MediaQuery.of(context).size.width * 0.9,
            height: isWeb
                ? MediaQuery.of(context).size.height * 0.8
                : MediaQuery.of(context).size.height * 0.85,
            child: CreateScheduledReportModal(
              onReportCreated: _addReport,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 800;
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(isWeb ? 24 : 16),
          child: Column(
            children: [
              // 🔙 Only Back Button + Title
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: isWeb ? 24 : 16,
                  vertical: isWeb ? 20 : 16,
                ),
                decoration: BoxDecoration(
                  color: Color(0xFF8BB5D1),
                  borderRadius: BorderRadius.circular(isWeb ? 30 : 25),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back, color: Colors.black),
                      onPressed: () => Navigator.of(context).maybePop(),
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Report Scheduler',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: isWeb ? 18 : 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: isWeb ? 24 : 20),

              // 🧾 Action Buttons
              Wrap(
                spacing: 12,
                runSpacing: 12,
                children: [
                  _buildActionButton('Download Report', Icons.download,
                      isWeb: isWeb),
                  _buildActionButton('Create Schedule', Icons.add,
                      isPrimary: true, isWeb: isWeb, onTap: _showCreateScheduleModal),
                ],
              ),

              SizedBox(height: isWeb ? 24 : 20),

              // 📊 Report List Table
              Container(
                width: double.infinity,
                height: isWeb ? 500 : 400,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.grey[300]!),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      decoration: BoxDecoration(
                        color: Colors.grey[50],
                        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                      ),
                      child: isWeb ? _buildWebTableHeader() : _buildMobileTableHeader(),
                    ),
                    Expanded(
                      child: scheduledReports.isEmpty
                          ? Center(
                              child: Text(
                                'No scheduled reports',
                                style: TextStyle(color: Colors.grey[500], fontSize: 16),
                              ),
                            )
                          : ListView.builder(
                              itemCount: scheduledReports.length,
                              itemBuilder: (context, index) {
                                final report = scheduledReports[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(color: Colors.grey[200]!),
                                    ),
                                  ),
                                  child: isWeb
                                      ? _buildWebTableRow(report)
                                      : _buildMobileTableRow(report),
                                );
                              },
                            ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildWebTableHeader() {
    return Row(
      children: [
        Expanded(flex: 3, child: Text('Schedule Name')),
        Expanded(flex: 2, child: Text('Created Date')),
        Expanded(flex: 2, child: Text('Scheduled Time')),
        Expanded(flex: 1, child: Text('Delete')),
      ],
    );
  }

  Widget _buildMobileTableHeader() {
    return Row(
      children: [
        Expanded(flex: 2, child: Text('Schedule Name', style: TextStyle(fontSize: 10))),
        Expanded(flex: 2, child: Text('Created Date', style: TextStyle(fontSize: 10))),
        Expanded(flex: 2, child: Text('Scheduled Time', style: TextStyle(fontSize: 10))),
        Expanded(flex: 1, child: Text('Delete', style: TextStyle(fontSize: 10))),
      ],
    );
  }

  Widget _buildWebTableRow(ScheduledReport report) {
    return Row(
      children: [
        Expanded(flex: 3, child: Text(report.scheduleName)),
        Expanded(flex: 2, child: Text(report.createdDate)),
        Expanded(flex: 2, child: Text(report.schedulerTime)),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red[400]),
            onPressed: () => _deleteReport(report.id),
          ),
        ),
      ],
    );
  }

  Widget _buildMobileTableRow(ScheduledReport report) {
    return Row(
      children: [
        Expanded(flex: 2, child: Text(report.scheduleName, style: TextStyle(fontSize: 10))),
        Expanded(flex: 2, child: Text(report.createdDate, style: TextStyle(fontSize: 10))),
        Expanded(flex: 2, child: Text(report.schedulerTime, style: TextStyle(fontSize: 10))),
        Expanded(
          flex: 1,
          child: IconButton(
            icon: Icon(Icons.delete_outline, color: Colors.red[400], size: 18),
            onPressed: () => _deleteReport(report.id),
            padding: EdgeInsets.all(4),
            constraints: BoxConstraints(minWidth: 32, minHeight: 32),
          ),
        ),
      ],
    );
  }

  Widget _buildActionButton(String text, IconData icon,
      {bool isPrimary = false, bool isWeb = false, VoidCallback? onTap}) {
    final buttonWidth =
        isWeb ? 180.0 : (MediaQuery.of(context).size.width - 56) / 2;
    return SizedBox(
      width: buttonWidth,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: isWeb ? 14 : 12, horizontal: 8),
          decoration: BoxDecoration(
            color: isPrimary ? Color(0xFF5A9BD4) : Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: isPrimary ? Color(0xFF5A9BD4) : Colors.grey[300]!),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon,
                  size: isWeb ? 18 : 16,
                  color: isPrimary ? Colors.white : Colors.grey[600]),
              SizedBox(width: 6),
              Flexible(
                child: Text(
                  text,
                  style: TextStyle(
                    color: isPrimary ? Colors.white : Colors.grey[700],
                    fontSize: isWeb ? 14 : 12,
                    fontWeight: FontWeight.w500,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class CreateScheduledReportModal extends StatefulWidget {
  final Function(ScheduledReport) onReportCreated;

  CreateScheduledReportModal({required this.onReportCreated});

  @override
  _CreateScheduledReportModalState createState() => _CreateScheduledReportModalState();
}

class _CreateScheduledReportModalState extends State<CreateScheduledReportModal> {
  final _formKey = GlobalKey<FormState>();
  final _scheduleNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _mobileController = TextEditingController();

  String? _selectedReport;
  String? _selectedTime;

  final List<String> _reportOptions = [
    'Daily Report',
    'Weekly Report',
    'Monthly Report',
    'Quarterly Report',
    'Custom Report',
  ];

  final List<String> _timeOptions = [
    '06:00 AM', '07:00 AM', '08:00 AM', '09:00 AM',
    '10:00 AM', '11:00 AM', '12:00 PM', '01:00 PM',
    '02:00 PM', '03:00 PM', '04:00 PM', '05:00 PM',
    '06:00 PM', '07:00 PM', '08:00 PM', '09:00 PM',
  ];

  void _createScheduler() {
    if (_formKey.currentState!.validate() && _selectedReport != null && _selectedTime != null) {
      final newReport = ScheduledReport(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        scheduleName: _scheduleNameController.text,
        createdDate: _formatDate(DateTime.now()),
        schedulerTime: _selectedTime!,
      );

      widget.onReportCreated(newReport);
      Navigator.pop(context);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Schedule created successfully!'),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day.toString().padLeft(2, '0')}-${date.month.toString().padLeft(2, '0')}-${date.year}';
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isWeb = screenWidth > 800;

    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 20, offset: Offset(0, 10))],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Column(
          children: [
            // 🔙 Header with Back and Title only
            Container(
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: isWeb ? 24 : 16, vertical: isWeb ? 20 : 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(bottom: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Report Scheduler',
                    style: TextStyle(
                      fontSize: isWeb ? 18 : 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                ],
              ),
            ),

            // 📄 Form
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(isWeb ? 24 : 16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildFormField(
                        'Schedule Name',
                        TextFormField(
                          controller: _scheduleNameController,
                          decoration: InputDecoration(
                            hintText: 'Enter Schedule Name',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter schedule name';
                            }
                            return null;
                          },
                        ),
                        isRequired: true,
                        isWeb: isWeb,
                      ),
                      _buildFormField(
                        'Choose Report List',
                        DropdownButtonFormField<String>(
                          value: _selectedReport,
                          decoration: InputDecoration(
                            hintText: 'Choose Report',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                          items: _reportOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) => setState(() => _selectedReport = newValue),
                          validator: (value) => value == null ? 'Please choose a report' : null,
                        ),
                        isRequired: true,
                        isWeb: isWeb,
                      ),
                      _buildFormField(
                        'Email (Optional)',
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(
                            hintText: 'Enter Email',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                          validator: (value) {
                            if (value != null && value.isNotEmpty &&
                                !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                        isWeb: isWeb,
                      ),
                      _buildFormField(
                        'Mobile (Optional)',
                        TextFormField(
                          controller: _mobileController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          decoration: InputDecoration(
                            hintText: 'Enter Mobile Number',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                          validator: (value) {
                            if (value != null && value.isNotEmpty &&
                                !RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                              return 'Enter valid 10-digit mobile number';
                            }
                            return null;
                          },
                        ),
                        isWeb: isWeb,
                      ),
                      _buildFormField(
                        'Scheduler Time',
                        DropdownButtonFormField<String>(
                          value: _selectedTime,
                          decoration: InputDecoration(
                            hintText: 'Choose Time',
                            border: OutlineInputBorder(),
                            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                          ),
                          items: _timeOptions.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                          onChanged: (newValue) => setState(() => _selectedTime = newValue),
                          validator: (value) => value == null ? 'Please choose a time' : null,
                        ),
                        isRequired: true,
                        isWeb: isWeb,
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Footer buttons
            Container(
              padding: EdgeInsets.all(isWeb ? 24 : 16),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border(top: BorderSide(color: Colors.grey[300]!)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.pop(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        foregroundColor: Colors.grey[700],
                        side: BorderSide(color: Colors.grey[300]!),
                        padding: EdgeInsets.symmetric(vertical: isWeb ? 16 : 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      child: Text('Cancel', style: TextStyle(fontSize: isWeb ? 16 : 14)),
                    ),
                  ),
                  SizedBox(width: 12),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _createScheduler,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF5A9BD4),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(vertical: isWeb ? 16 : 12),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
                      ),
                      // child: Text('Create Scheduler', style: TextStyle(fontSize: isWeb ? 16 : 14)),
                      child: Center(child: Text('Create Scheduler',textAlign: TextAlign.center,style: TextStyle(fontSize: isWeb ? 16 : 14))),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFormField(String label, Widget field, {bool isRequired = false, bool isWeb = false}) {
    return Padding(
      padding: EdgeInsets.only(bottom: isWeb ? 20.0 : 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Flexible(
                child: Text(
                  label,
                  style: TextStyle(
                    fontSize: isWeb ? 16 : 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
              if (isRequired)
                Text(' *', style: TextStyle(color: Colors.red)),
            ],
          ),
          SizedBox(height: isWeb ? 10 : 8),
          field,
        ],
      ),
    );
  }
}


