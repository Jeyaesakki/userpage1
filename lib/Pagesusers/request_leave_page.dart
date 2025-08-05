

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// // Theme Colors
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class RequestLeavePage extends StatefulWidget {
//   const RequestLeavePage({super.key});

//   @override
//   State<RequestLeavePage> createState() => _RequestLeavePageState();
// }

// class _RequestLeavePageState extends State<RequestLeavePage> {
//   final _formKey = GlobalKey<FormState>();

//   String? selectedLeaveType;
//   String? selectedShift;
//   String? selectedLeaveDuration;
//   String? customLeaveDays;
//   DateTime? fromDate;
//   DateTime? toDate;
//   String? errorMessage;

//   final TextEditingController reasonController = TextEditingController();
//   final TextEditingController customLeaveController = TextEditingController();

//   final List<String> leaveTypes = [
//     'Sick Leave',
//     'Casual Leave',
//     'Planned Leave',
//     'Emergency Leave'
//   ];
//   final List<String> shifts = ['Shift 1', 'Shift 2', 'Shift 3'];

//   final Map<String, String> shiftTimes = {
//     'Shift 1': '6:00 AM - 2:00 PM',
//     'Shift 2': '8:30 AM - 4:30 PM',
//     'Shift 3': '9:00 AM - 5:00 PM',
//   };

//   final List<DateTime> appliedCasualLeaves = [
//     DateTime(2025, 7, 10),
//   ];

//   List<String> getLeaveDurationOptions(String? type) {
//     switch (type) {
//       case 'Sick Leave':
//       case 'Planned Leave':
//       case 'Emergency Leave':
//         return ['1 day', '2 days', '3 days', 'Others'];
//       case 'Casual Leave':
//         return ['1 day'];
//       default:
//         return [];
//     }
//   }

//   bool hasCasualLeaveInSameMonth() {
//     if (selectedLeaveType != 'Casual Leave' || fromDate == null) return false;
//     return appliedCasualLeaves.any(
//       (leave) => leave.month == fromDate!.month && leave.year == fromDate!.year,
//     );
//   }

//   Future<void> pickDate(BuildContext context, bool isFrom) async {
//     DateTime initialDate = isFrom ? DateTime.now() : (fromDate ?? DateTime.now());
//     DateTime firstDate = isFrom ? DateTime.now() : (fromDate ?? DateTime.now());

//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: firstDate,
//       lastDate: DateTime(2100),
//       builder: (context, child) {
//         return Theme(
//           data: Theme.of(context).copyWith(
//             colorScheme: const ColorScheme.light(
//               primary: kAppBarColor,
//               onPrimary: Colors.white,
//               onSurface: Colors.black,
//             ),
//           ),
//           child: child!,
//         );
//       },
//     );

//     if (picked != null) {
//       setState(() {
//         if (isFrom) {
//           fromDate = picked;
//           if (toDate != null && toDate!.isBefore(fromDate!)) {
//             errorMessage = "To Date cannot be before From Date";
//             toDate = null;
//           } else {
//             errorMessage = null;
//           }
//         } else {
//           if (fromDate != null && picked.isBefore(fromDate!)) {
//             errorMessage = "To Date cannot be before From Date";
//           } else {
//             toDate = picked;
//             errorMessage = null;
//           }
//         }
//       });
//     }
//   }

//   String formatDate(DateTime? date) {
//     if (date == null) return '';
//     try {
//       return DateFormat('yyyy-MM-dd').format(date);
//     } catch (e) {
//       return 'Invalid Date';
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final durationOptions = getLeaveDurationOptions(selectedLeaveType);
//     final casualLeaveTaken = hasCasualLeaveInSameMonth();

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // App Bar Section
//                   Row(
//                     children: [
//                       GestureDetector(
//                         onTap: () => Navigator.pop(context),
//                         child: const Icon(Icons.arrow_back, color: kAppBarColor),
//                       ),
//                       const SizedBox(width: 12),
//                       const Text(
//                         "Apply Leave",
//                         style: TextStyle(
//                           fontSize: 18,
//                           fontWeight: FontWeight.bold,
//                           color: kAppBarColor,
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 24),

//                   // Leave Type Dropdown
//                   DropdownButtonFormField<String>(
//                     value: selectedLeaveType,
//                     decoration: _inputDecorationWithLabel("Leave Type"),
//                     items: leaveTypes.map((type) {
//                       return DropdownMenuItem(value: type, child: Text(type));
//                     }).toList(),
//                     onChanged: (val) {
//                       setState(() {
//                         selectedLeaveType = val;
//                         selectedLeaveDuration = null;
//                         customLeaveController.clear();
//                       });
//                     },
//                     validator: (val) => val == null ? "Please select leave type" : null,
//                   ),
//                   const SizedBox(height: 16),

//                   // Duration Dropdown
//                   if (selectedLeaveType != null)
//                     DropdownButtonFormField<String>(
//                       value: selectedLeaveDuration,
//                       decoration: _inputDecorationWithLabel("Leave Duration"),
//                       items: durationOptions.map((d) {
//                         return DropdownMenuItem(value: d, child: Text(d));
//                       }).toList(),
//                       onChanged: (val) {
//                         setState(() {
//                           selectedLeaveDuration = val;
//                           if (val != 'Others') {
//                             customLeaveController.clear();
//                           }
//                         });
//                       },
//                       validator: (val) => val == null ? "Select duration" : null,
//                     ),

//                   // Custom Days Text Field
//                   if (selectedLeaveDuration == 'Others')
//                     Padding(
//                       padding: const EdgeInsets.only(top: 12),
//                       child: TextFormField(
//                         controller: customLeaveController,
//                         keyboardType: TextInputType.number,
//                         decoration: _inputDecorationWithLabel("Enter number of days"),
//                         validator: (val) =>
//                             val == null || val.isEmpty ? "Enter custom days" : null,
//                       ),
//                     ),
//                   const SizedBox(height: 16),

//                   // Shift Dropdown
//                   DropdownButtonFormField<String>(
//                     value: selectedShift,
//                     decoration: _inputDecorationWithLabel("Shift"),
//                     items: shifts.map((shift) {
//                       return DropdownMenuItem(value: shift, child: Text(shift));
//                     }).toList(),
//                     onChanged: (val) => setState(() => selectedShift = val),
//                     validator: (val) => val == null ? "Select shift" : null,
//                   ),
//                   if (selectedShift != null)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: Text(
//                         "Time: ${shiftTimes[selectedShift]!}",
//                         style: const TextStyle(fontSize: 14),
//                       ),
//                     ),
//                   const SizedBox(height: 16),

//                   // From Date
//                   GestureDetector(
//                     onTap: () => pickDate(context, true),
//                     child: AbsorbPointer(
//                       child: TextFormField(
//                         decoration: _inputDecorationWithLabel("From Date"),
//                         controller: TextEditingController(text: formatDate(fromDate)),
//                         validator: (val) =>
//                             val == null || val.isEmpty ? "Select From Date" : null,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // To Date
//                   GestureDetector(
//                     onTap: () => pickDate(context, false),
//                     child: AbsorbPointer(
//                       child: TextFormField(
//                         decoration: _inputDecorationWithLabel("To Date"),
//                         controller: TextEditingController(text: formatDate(toDate)),
//                         validator: (val) {
//                           if (val == null || val.isEmpty) return "Select To Date";
//                           if (errorMessage != null) return errorMessage;
//                           return null;
//                         },
//                       ),
//                     ),
//                   ),
//                   if (errorMessage != null)
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8),
//                       child: Text(errorMessage!, style: const TextStyle(color: Colors.red)),
//                     ),
//                   const SizedBox(height: 16),

//                   // Reason
//                   TextFormField(
//                     controller: reasonController,
//                     maxLines: 2,
//                     decoration: _inputDecorationWithLabel("Reason").copyWith(hintText: "Enter your reason"),
//                     validator: (val) => val == null || val.isEmpty ? "Enter reason" : null,
//                   ),
//                   const SizedBox(height: 24),

//                   // Casual Leave Notice
//                   if (casualLeaveTaken && selectedLeaveType == 'Casual Leave')
//                     Container(
//                       padding: const EdgeInsets.all(12),
//                       margin: const EdgeInsets.only(bottom: 16),
//                       decoration: BoxDecoration(
//                         color: Colors.red.shade50,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: Colors.red),
//                       ),
//                       child: const Text(
//                         "You have already applied for Casual Leave this month.",
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),

//                   // Submit Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 44,
//                     child: ElevatedButton(
//                       onPressed: () {
//                         if (_formKey.currentState!.validate()) {
//                           if (selectedLeaveType == 'Casual Leave' && casualLeaveTaken) {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               const SnackBar(
//                                 content: Text("You already applied Casual Leave this month."),
//                                 backgroundColor: Colors.red,
//                               ),
//                             );
//                             return;
//                           }

//                           ScaffoldMessenger.of(context).showSnackBar(
//                             const SnackBar(
//                               content: Text("Leave Request Submitted Successfully"),
//                               backgroundColor: Colors.black,
//                             ),
//                           );
//                         }
//                       },
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: kButtonColor,
//                         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                       ),
//                       child: const Text("Submit", style: TextStyle(color: kTextColor)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   InputDecoration _inputDecorationWithLabel(String labelText) {
//     return InputDecoration(
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       label: RichText(
//         text: TextSpan(
//           text: labelText,
//           style: const TextStyle(color: Colors.black87, fontSize: 14),
//           children: const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
//         ),
//       ),
//       filled: true,
//       fillColor: Colors.white,
//       contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: kButtonColor, width: 1.5),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(12),
//         borderSide: const BorderSide(color: kAppBarColor, width: 2),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// Theme Colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class RequestLeavePage extends StatefulWidget {
  const RequestLeavePage({super.key});

  @override
  State<RequestLeavePage> createState() => _RequestLeavePageState();
}

class _RequestLeavePageState extends State<RequestLeavePage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedLeaveType;
  String? selectedShift;
  String? selectedLeaveDuration;
  DateTime? fromDate;
  DateTime? toDate;
  String? errorMessage;

  final TextEditingController reasonController = TextEditingController();
  final TextEditingController customLeaveController = TextEditingController();

  final List<String> leaveTypes = [
    'Sick Leave',
    'Casual Leave',
    'Planned Leave',
    'Emergency Leave'
  ];
  final List<String> shifts = ['Shift 1', 'Shift 2', 'Shift 3'];

  final Map<String, String> shiftTimes = {
    'Shift 1': '6:00 AM - 2:00 PM',
    'Shift 2': '8:30 AM - 4:30 PM',
    'Shift 3': '9:00 AM - 5:00 PM',
  };

  final List<DateTime> appliedCasualLeaves = [
    DateTime(2025, 7, 10),
  ];

  List<String> getLeaveDurationOptions(String? type) {
    switch (type) {
      case 'Sick Leave':
      case 'Planned Leave':
      case 'Emergency Leave':
        return ['1 day', '2 days', '3 days', 'Others'];
      case 'Casual Leave':
        return ['1 day'];
      default:
        return [];
    }
  }

  bool hasCasualLeaveInSameMonth() {
    if (selectedLeaveType != 'Casual Leave' || fromDate == null) return false;
    return appliedCasualLeaves.any(
      (leave) => leave.month == fromDate!.month && leave.year == fromDate!.year,
    );
  }

  Future<void> pickDate(BuildContext context, bool isFrom) async {
    DateTime initialDate = isFrom ? DateTime.now() : (fromDate ?? DateTime.now());
    DateTime firstDate = isFrom ? DateTime.now() : (fromDate ?? DateTime.now());

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: kAppBarColor,
              onPrimary: Colors.white,
              onSurface: Colors.black,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      setState(() {
        if (isFrom) {
          fromDate = picked;
          if (toDate != null && toDate!.isBefore(fromDate!)) {
            errorMessage = "To Date cannot be before From Date";
            toDate = null;
          } else {
            errorMessage = null;
          }
        } else {
          if (fromDate != null && picked.isBefore(fromDate!)) {
            errorMessage = "To Date cannot be before From Date";
          } else {
            toDate = picked;
            errorMessage = null;
          }
        }
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date == null) return '';
    try {
      return DateFormat('yyyy-MM-dd').format(date);
    } catch (e) {
      return 'Invalid Date';
    }
  }

  void onSubmit() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Leave request submitted "),
        backgroundColor: Color.fromARGB(255, 15, 15, 15),
      ),
    );

    // Reset form
    _formKey.currentState!.reset();
    setState(() {
      selectedLeaveType = null;
      selectedShift = null;
      selectedLeaveDuration = null;
      fromDate = null;
      toDate = null;
      errorMessage = null;
      reasonController.clear();
      customLeaveController.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final durationOptions = getLeaveDurationOptions(selectedLeaveType);
    final casualLeaveTaken = hasCasualLeaveInSameMonth();

    return Scaffold(
      body: Container(
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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    color: kAppBarColor,
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        GestureDetector(
                          onTap: () => Navigator.pop(context),
                          child: const Icon(Icons.arrow_back, color: Colors.white),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          "Apply Leave",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 24),

                  DropdownButtonFormField<String>(
                    value: selectedLeaveType,
                    decoration: _inputDecorationWithLabel("Leave Type"),
                    items: leaveTypes.map((type) {
                      return DropdownMenuItem(value: type, child: Text(type));
                    }).toList(),
                    onChanged: (val) {
                      setState(() {
                        selectedLeaveType = val;
                        selectedLeaveDuration = null;
                        customLeaveController.clear();
                      });
                    },
                    validator: (val) => val == null ? "Please select leave type" : null,
                  ),
                  const SizedBox(height: 16),

                  if (selectedLeaveType != null)
                    DropdownButtonFormField<String>(
                      value: selectedLeaveDuration,
                      decoration: _inputDecorationWithLabel("Leave Duration"),
                      items: durationOptions.map((d) {
                        return DropdownMenuItem(value: d, child: Text(d));
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          selectedLeaveDuration = val;
                          if (val != 'Others') {
                            customLeaveController.clear();
                          }
                        });
                      },
                      validator: (val) => val == null ? "Select duration" : null,
                    ),

                  if (selectedLeaveDuration == 'Others')
                    Padding(
                      padding: const EdgeInsets.only(top: 12),
                      child: TextFormField(
                        controller: customLeaveController,
                        keyboardType: TextInputType.number,
                        decoration: _inputDecorationWithLabel("Enter number of days"),
                        validator: (val) =>
                            val == null || val.isEmpty ? "Enter custom days" : null,
                      ),
                    ),
                  const SizedBox(height: 16),

                  DropdownButtonFormField<String>(
                    value: selectedShift,
                    decoration: _inputDecorationWithLabel("Shift"),
                    items: shifts.map((shift) {
                      return DropdownMenuItem(value: shift, child: Text(shift));
                    }).toList(),
                    onChanged: (val) => setState(() => selectedShift = val),
                    validator: (val) => val == null ? "Select shift" : null,
                  ),
                  if (selectedShift != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(
                        "Time: ${shiftTimes[selectedShift]!}",
                        style: const TextStyle(fontSize: 14),
                      ),
                    ),
                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () => pickDate(context, true),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: _inputDecorationWithLabel("From Date"),
                        controller: TextEditingController(text: formatDate(fromDate)),
                        validator: (val) =>
                            val == null || val.isEmpty ? "Select From Date" : null,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  GestureDetector(
                    onTap: () => pickDate(context, false),
                    child: AbsorbPointer(
                      child: TextFormField(
                        decoration: _inputDecorationWithLabel("To Date"),
                        controller: TextEditingController(text: formatDate(toDate)),
                        validator: (val) {
                          if (val == null || val.isEmpty) return "Select To Date";
                          if (errorMessage != null) return errorMessage;
                          return null;
                        },
                      ),
                    ),
                  ),
                  if (errorMessage != null)
                    Padding(
                      padding: const EdgeInsets.only(top: 8),
                      child: Text(errorMessage!, style: const TextStyle(color: Colors.red)),
                    ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: reasonController,
                    maxLines: 2,
                    decoration: _inputDecorationWithLabel("Reason")
                        .copyWith(hintText: "Enter your reason"),
                    validator: (val) => val == null || val.isEmpty ? "Enter reason" : null,
                  ),
                  const SizedBox(height: 24),

                  if (casualLeaveTaken && selectedLeaveType == 'Casual Leave')
                    Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                        color: Colors.red.shade50,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Text(
                        "You have already applied for Casual Leave this month.",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),

                  SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          if (selectedLeaveType == 'Casual Leave' && casualLeaveTaken) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("You already applied Casual Leave this month."),
                                backgroundColor: Colors.red,
                              ),
                            );
                            return;
                          }
                          onSubmit(); // 🔁 Submit without backend
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                      ),
                      child: const Text("Submit", style: TextStyle(color: kTextColor)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  InputDecoration _inputDecorationWithLabel(String labelText) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      label: RichText(
        text: TextSpan(
          text: labelText,
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))],
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kButtonColor),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kAppBarColor, width: 2),
      ),
    );
  }
}