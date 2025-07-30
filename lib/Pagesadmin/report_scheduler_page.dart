



// import 'package:flutter/material.dart';

// // Colors
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Report Scheduler',
//       theme: ThemeData(primarySwatch: Colors.deepPurple),
//       home: ReportSchedulerPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class ScheduledReport {
//   final String id;
//   final String scheduleName;
//   final String createdDate;
//   final String schedulerTime;

//   ScheduledReport({
//     required this.id,
//     required this.scheduleName,
//     required this.createdDate,
//     required this.schedulerTime,
//   });
// }

// class ReportSchedulerPage extends StatefulWidget {
//   @override
//   _ReportSchedulerPageState createState() => _ReportSchedulerPageState();
// }

// class _ReportSchedulerPageState extends State<ReportSchedulerPage> {
//   List<ScheduledReport> scheduledReports = [];

//   void _deleteReport(String id) {
//     setState(() {
//       scheduledReports.removeWhere((report) => report.id == id);
//     });
//   }

//   void _addReport(ScheduledReport report) {
//     setState(() {
//       scheduledReports.add(report);
//     });
//   }

//   void _showCreateScheduleModal() {
//     final isWeb = MediaQuery.of(context).size.width > 800;
//     showDialog(
//       context: context,
//       barrierDismissible: false,
//       builder: (BuildContext context) {
//         return Dialog(
//           backgroundColor: Colors.transparent,
//           child: Container(
//             width: isWeb ? 800 : MediaQuery.of(context).size.width * 0.95,
//             height: isWeb ? MediaQuery.of(context).size.height * 0.85 : MediaQuery.of(context).size.height * 0.9,
//             child: CreateScheduledReportModal(onReportCreated: _addReport),
//           ),
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isWeb = MediaQuery.of(context).size.width > 800;
//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundTop,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(isWeb ? 24 : 16),
//           child: Column(
//             children: [
//               Container(
//                 width: double.infinity,
//                 padding: EdgeInsets.symmetric(horizontal: isWeb ? 24 : 16, vertical: isWeb ? 20 : 16),
//                 decoration: BoxDecoration(
//                   color: kAppBarColor,
//                   borderRadius: BorderRadius.circular(isWeb ? 30 : 25),
//                 ),
//                 child: Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back, color: Colors.white),
//                       onPressed: () => Navigator.of(context).maybePop(),
//                     ),
//                     SizedBox(width: 8),
//                     Text(
//                       'Report Scheduler',
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: isWeb ? 20 : 18,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(height: isWeb ? 24 : 20),
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 12,
//                 children: [
//                   _buildActionButton('Create Schedule', Icons.add, isWeb: isWeb, isPrimary: true, onTap: _showCreateScheduleModal),
//                 ],
//               ),
//               SizedBox(height: isWeb ? 24 : 20),
//               Container(
//                 width: double.infinity,
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   border: Border.all(color: Colors.grey[300]!),
//                 ),
//                 child: Column(
//                   children: [
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                       decoration: BoxDecoration(
//                         color: kPrimaryBackgroundBottom.withOpacity(0.4),
//                         borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
//                       ),
//                       child: Row(
//                         children: [
//                           Expanded(flex: 3, child: Text('Schedule Name', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))),
//                           Expanded(flex: 2, child: Text('Created Date', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))),
//                           Expanded(flex: 2, child: Text('Scheduled Time', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))),
//                           Expanded(flex: 1, child: Text('Delete', style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12))),
//                         ],
//                       ),
//                     ),
//                     if (scheduledReports.isEmpty)
//                       Padding(
//                         padding: const EdgeInsets.all(24.0),
//                         child: Text('No scheduled reports yet', style: TextStyle(color: Colors.grey[600])),
//                       )
//                     else
//                       ListView.builder(
//                         shrinkWrap: true,
//                         physics: NeverScrollableScrollPhysics(),
//                         itemCount: scheduledReports.length,
//                         itemBuilder: (_, i) {
//                           final report = scheduledReports[i];
//                           return Container(
//                             padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                             decoration: BoxDecoration(
//                               border: Border(bottom: BorderSide(color: Colors.grey[200]!)),
//                             ),
//                             child: Row(
//                               children: [
//                                 Expanded(flex: 3, child: Text(report.scheduleName, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13))),
//                                 Expanded(flex: 2, child: Text(report.createdDate, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13))),
//                                 Expanded(flex: 2, child: Text(report.schedulerTime, style: TextStyle(fontWeight: FontWeight.w500, fontSize: 13))),
//                                 Expanded(
//                                   flex: 1,
//                                   child: IconButton(
//                                     icon: Icon(Icons.delete_outline, color: Colors.red[400]),
//                                     onPressed: () => _deleteReport(report.id),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           );
//                         },
//                       )
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildActionButton(String text, IconData icon,
//       {bool isPrimary = false, bool isWeb = false, VoidCallback? onTap}) {
//     return SizedBox(
//       width: isWeb ? 180 : double.infinity,
//       child: GestureDetector(
//         onTap: onTap,
//         child: Container(
//           padding: EdgeInsets.symmetric(vertical: isWeb ? 14 : 12),
//           decoration: BoxDecoration(
//             color: isPrimary ? kButtonColor : Colors.white,
//             borderRadius: BorderRadius.circular(8),
//             border: Border.all(color: isPrimary ? kButtonColor : Colors.grey[300]!),
//           ),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(icon, size: isWeb ? 18 : 16, color: isPrimary ? Colors.white : Colors.grey[600]),
//               SizedBox(width: 6),
//               Flexible(
//                 child: Text(
//                   text,
//                   style: TextStyle(
//                     color: isPrimary ? Colors.white : Colors.grey[700],
//                     fontSize: isWeb ? 14 : 12,
//                     fontWeight: FontWeight.w500,
//                   ),
//                   overflow: TextOverflow.ellipsis,
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// // 🔽 CREATE SCHEDULE MODAL (WITH VALIDATION)

// class CreateScheduledReportModal extends StatefulWidget {
//   final Function(ScheduledReport) onReportCreated;

//   const CreateScheduledReportModal({super.key, required this.onReportCreated});

//   @override
//   _CreateScheduledReportModalState createState() => _CreateScheduledReportModalState();
// }

// class _CreateScheduledReportModalState extends State<CreateScheduledReportModal> {
//   final TextEditingController _nameController = TextEditingController();
//   final TextEditingController _emailController = TextEditingController();
//   final TextEditingController _mobileController = TextEditingController();

//   String? selectedReportType;
//   String? selectedTime;

//   final _formKey = GlobalKey<FormState>();

//   bool isValidEmail(String email) {
//     final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
//     return emailRegex.hasMatch(email);
//   }

//   bool isValidMobile(String mobile) {
//     final mobileRegex = RegExp(r'^[0-9]{10,}$');
//     return mobileRegex.hasMatch(mobile);
//   }

//   void _createSchedule() {
//     if (_formKey.currentState!.validate()) {
//       if (selectedTime == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("Please select schedule time")),
//         );
//         return;
//       }

//       final newReport = ScheduledReport(
//         id: DateTime.now().millisecondsSinceEpoch.toString(),
//         scheduleName: _nameController.text.trim(),
//         createdDate: DateTime.now().toString().split(" ")[0],
//         schedulerTime: selectedTime!,
//       );

//       widget.onReportCreated(newReport);
//       Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20.0),
//           child: Form(
//             key: _formKey,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   children: [
//                     IconButton(
//                       icon: Icon(Icons.arrow_back),
//                       onPressed: () => Navigator.pop(context),
//                     ),
//                     SizedBox(width: 8),
//                     Text('Create Schedule', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600))
//                   ],
//                 ),
//                 SizedBox(height: 24),
//                 TextFormField(
//                   controller: _nameController,
//                   decoration: InputDecoration(
//                     labelText: 'Schedule Name',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value == null || value.trim().isEmpty) {
//                       return 'Please enter schedule name';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 18),
//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     labelText: 'Choose Report List',
//                     border: OutlineInputBorder(),
//                   ),
//                   items: ['Check-in', 'Check-out', 'Late check-in','On leave','Absent']
//                       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                       .toList(),
//                   onChanged: (val) => setState(() => selectedReportType = val),
//                 ),
//                 SizedBox(height: 18),
//                 TextFormField(
//                   controller: _emailController,
//                   decoration: InputDecoration(
//                     labelText: 'Email (Optional)',
//                     border: OutlineInputBorder(),
//                   ),
//                   validator: (value) {
//                     if (value != null && value.trim().isNotEmpty && !isValidEmail(value.trim())) {
//                       return 'Enter a valid email';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 18),
//                 TextFormField(
//                   controller: _mobileController,
//                   decoration: InputDecoration(
//                     labelText: 'Mobile (Optional)',
//                     border: OutlineInputBorder(),
//                   ),
//                   keyboardType: TextInputType.phone,
//                   validator: (value) {
//                     if (value != null && value.trim().isNotEmpty && !isValidMobile(value.trim())) {
//                       return 'Enter a valid 10 digit mobile number';
//                     }
//                     return null;
//                   },
//                 ),
//                 SizedBox(height: 18),
//                 DropdownButtonFormField<String>(
//                   decoration: InputDecoration(
//                     labelText: 'Schedule Time',
//                     border: OutlineInputBorder(),
//                   ),
//                   items: ['07:00 PM', '08:00 PM', '09:00 PM','10:00 PM']
//                       .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                       .toList(),
//                   onChanged: (val) => setState(() => selectedTime = val),
//                 ),
//                 SizedBox(height: 24),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: OutlinedButton(
//                         onPressed: () => Navigator.pop(context),
//                         child: Text('Cancel', style: TextStyle(fontSize: 14)),
//                       ),
//                     ),
//                     SizedBox(width: 12),
//                     Expanded(
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(backgroundColor: kButtonColor),
//                         onPressed: _createSchedule,
//                         child: Text('Create', style: TextStyle(color: Colors.white)),
//                       ),
//                     ),
//                   ],
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

// Gradient colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
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
          child: Container(
            width: MediaQuery.of(context).size.width * 0.95,
            height: MediaQuery.of(context).size.height * 0.9,
            child: CreateScheduledReportModal(onReportCreated: _addReport),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  // AppBar style header
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: kAppBarColor),
                        onPressed: () => Navigator.of(context).maybePop(),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Report Scheduler',
                        style: TextStyle(
                          color: kAppBarColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),

                  // Create Schedule button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor,
                        foregroundColor: kTextColor,
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      icon: const Icon(Icons.add),
                      label: const Text("Create Schedule"),
                      onPressed: _showCreateScheduleModal,
                    ),
                  ),

                  const SizedBox(height: 30),

                  // Table Header
                  Row(
                    children: const [
                      Expanded(flex: 3, child: Text('Schedule Name', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 2, child: Text('Created Date', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 2, child: Text('Scheduled Time', style: TextStyle(fontWeight: FontWeight.bold))),
                      Expanded(flex: 1, child: Text('Delete', style: TextStyle(fontWeight: FontWeight.bold))),
                    ],
                  ),
                  const SizedBox(height: 10),

                  // Report list
                  if (scheduledReports.isEmpty)
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 24.0),
                      child: Center(
                        child: Text('No scheduled reports yet', style: TextStyle(color: Colors.black54)),
                      ),
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

  bool isValidEmail(String email) {
    final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$');
    return emailRegex.hasMatch(email);
  }

  bool isValidMobile(String mobile) {
    final mobileRegex = RegExp(r'^[0-9]{10,}$');
    return mobileRegex.hasMatch(mobile);
  }

  void _createSchedule() {
    if (_formKey.currentState!.validate()) {
      if (selectedTime == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please select schedule time")),
        );
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
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
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.arrow_back, color: kAppBarColor),
                          onPressed: () => Navigator.pop(context),
                        ),
                        const SizedBox(width: 8),
                        const Text('Create Schedule',
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: kAppBarColor)),
                      ],
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: _nameController,
                      decoration: const InputDecoration(
                        labelText: 'Schedule Name',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) =>
                          value == null || value.trim().isEmpty ? 'Please enter schedule name' : null,
                    ),
                    const SizedBox(height: 18),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Choose Report List',
                        border: OutlineInputBorder(),
                      ),
                      items: ['Check-in', 'Check-out', 'Late check-in', 'On leave', 'Absent']
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => setState(() => selectedReportType = val),
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(
                        labelText: 'Email (Optional)',
                        border: OutlineInputBorder(),
                      ),
                      validator: (value) {
                        if (value != null &&
                            value.trim().isNotEmpty &&
                            !isValidEmail(value.trim())) {
                          return 'Enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    TextFormField(
                      controller: _mobileController,
                      decoration: const InputDecoration(
                        labelText: 'Mobile (Optional)',
                        border: OutlineInputBorder(),
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (value) {
                        if (value != null &&
                            value.trim().isNotEmpty &&
                            !isValidMobile(value.trim())) {
                          return 'Enter a valid 10 digit mobile number';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 18),
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Schedule Time',
                        border: OutlineInputBorder(),
                      ),
                      items: ['07:00 PM', '08:00 PM', '09:00 PM', '10:00 PM']
                          .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                          .toList(),
                      onChanged: (val) => setState(() => selectedTime = val),
                    ),
                    const SizedBox(height: 24),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text('Cancel'),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(backgroundColor: kButtonColor),
                            onPressed: _createSchedule,
                            child: const Text('Create', style: TextStyle(color: Colors.white)),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}