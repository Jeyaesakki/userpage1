

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// // 🎨 Custom Colors
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class PermissionTimePage extends StatefulWidget {
//   const PermissionTimePage({Key? key, required this.isPopup}) : super(key: key);
//   final bool isPopup;

//   @override
//   State<PermissionTimePage> createState() => _PermissionTimePageState();
// }

// class _PermissionTimePageState extends State<PermissionTimePage> {
//   final _formKey = GlobalKey<FormState>();

//   final List<String> shifts = ['Shift 1', 'Shift 2', 'Shift 3'];
//   final List<String> reasons = ['Emergency', 'Personal Reason'];

//   String? selectedShift;
//   String? selectedReason;
//   DateTime? selectedDate;
//   TimeOfDay? startTime;
//   TimeOfDay? endTime;

//   final TextEditingController startTimeController = TextEditingController();
//   final TextEditingController endTimeController = TextEditingController();
//   final TextEditingController dateController = TextEditingController();

//   final Map<String, TimeRange> shiftTimeRanges = {
//     'Shift 1': TimeRange(start: TimeOfDay(hour: 6, minute: 0), end: TimeOfDay(hour: 14, minute: 0)),
//     'Shift 2': TimeRange(start: TimeOfDay(hour: 8, minute: 30), end: TimeOfDay(hour: 16, minute: 30)),
//     'Shift 3': TimeRange(start: TimeOfDay(hour: 9, minute: 0), end: TimeOfDay(hour: 17, minute: 0)),
//   };

//   Future<void> _selectDate(BuildContext context) async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//         dateController.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }

//   Future<void> _selectTime(BuildContext context, bool isStart) async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );

//     if (picked != null) {
//       final shiftRange = shiftTimeRanges[selectedShift];
//       if (shiftRange != null && !shiftRange.contains(picked)) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text('Selected time is outside ${selectedShift!} range')),
//         );
//         return;
//       }

//       setState(() {
//         final formatted = formatTimeOfDay(picked);
//         if (isStart) {
//           startTime = picked;
//           startTimeController.text = formatted;
//           endTimeController.clear();
//           endTime = null;
//         } else {
//           endTime = picked;
//           endTimeController.text = formatted;
//         }
//       });
//     }
//   }

//   String formatTimeOfDay(TimeOfDay? time) {
//     if (time == null) return '';
//     final now = DateTime.now();
//     final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     return DateFormat.jm().format(dt);
//   }

//   void _handleSubmit() {
//     if (_formKey.currentState!.validate()) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Permission Request Submitted Successfully!')),
//       );
//     }
//   }

//   InputDecoration inputBoxDecoration(String label) {
//     return InputDecoration(
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       label: RichText(
//         text: TextSpan(
//           style: const TextStyle(fontSize: 16, color: Colors.black),
//           children: [
//             TextSpan(text: label),
//             const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
//           ],
//         ),
//       ),
//       filled: true,
//       fillColor: Colors.white,
//       border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
//       enabledBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: kAppBarColor),
//       ),
//       focusedBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: kButtonColor, width: 2),
//       ),
//       errorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Colors.red),
//       ),
//       focusedErrorBorder: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(10),
//         borderSide: const BorderSide(color: Colors.red, width: 2),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final formCard = Container(
//       padding: const EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white.withOpacity(0.9),
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 4)],
//       ),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           children: [
//             DropdownButtonFormField<String>(
//               value: selectedShift,
//               decoration: inputBoxDecoration('Shift'),
//               items: shifts.map((shift) {
//                 return DropdownMenuItem<String>(
//                   value: shift,
//                   child: Text(shift),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedShift = value;
//                   startTime = null;
//                   endTime = null;
//                   startTimeController.clear();
//                   endTimeController.clear();
//                 });
//               },
//               validator: (value) => value == null ? 'Please select a shift' : null,
//             ),
//             const SizedBox(height: 16),

//             GestureDetector(
//               onTap: () => _selectTime(context, true),
//               child: AbsorbPointer(
//                 child: TextFormField(
//                   controller: startTimeController,
//                   decoration: inputBoxDecoration('Start Time'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return 'Please select start time';
//                     final range = shiftTimeRanges[selectedShift];
//                     if (selectedShift != null && startTime != null && range != null) {
//                       if (!range.contains(startTime!)) {
//                         return 'Must be in ${formatTimeOfDay(range.start)} - ${formatTimeOfDay(range.end)}';
//                       }
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             GestureDetector(
//               onTap: () => _selectTime(context, false),
//               child: AbsorbPointer(
//                 child: TextFormField(
//                   controller: endTimeController,
//                   decoration: inputBoxDecoration('End Time'),
//                   validator: (value) {
//                     if (value == null || value.isEmpty) return 'Please select end time';
//                     final range = shiftTimeRanges[selectedShift];
//                     if (selectedShift != null && endTime != null && range != null) {
//                       if (!range.contains(endTime!)) {
//                         return 'Must be in ${formatTimeOfDay(range.start)} - ${formatTimeOfDay(range.end)}';
//                       }
//                       if (startTime != null) {
//                         final startMinutes = startTime!.hour * 60 + startTime!.minute;
//                         final endMinutes = endTime!.hour * 60 + endTime!.minute;
//                         if (endMinutes <= startMinutes) {
//                           return 'End time must be after start time';
//                         }
//                       }
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),

//             DropdownButtonFormField<String>(
//               value: selectedReason,
//               decoration: inputBoxDecoration('Reason'),
//               items: reasons.map((reason) {
//                 return DropdownMenuItem<String>(
//                   value: reason,
//                   child: Text(reason),
//                 );
//               }).toList(),
//               onChanged: (value) => setState(() => selectedReason = value),
//               validator: (value) => value == null ? 'Please select a reason' : null,
//             ),
//             const SizedBox(height: 16),

//             GestureDetector(
//               onTap: () => _selectDate(context),
//               child: AbsorbPointer(
//                 child: TextFormField(
//                   controller: dateController,
//                   decoration: inputBoxDecoration('Date'),
//                   validator: (value) => value == null || value.isEmpty ? 'Please select a date' : null,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     final bodyContent = SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: [
//           formCard,
//           const SizedBox(height: 24),
//           ElevatedButton(
//             onPressed: _handleSubmit,
//             style: ElevatedButton.styleFrom(
//               backgroundColor: kButtonColor,
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(8),
//               ),
//             ),
//             child: const Text(
//               'Submit',
//               style: TextStyle(color: kTextColor, fontSize: 16),
//             ),
//           ),
//         ],
//       ),
//     );

//     final gradientBackground = Container(
//       width: double.infinity,
//       height: double.infinity,
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//           colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//         ),
//       ),
//       child: bodyContent,
//     );

//     return widget.isPopup
//         ? SizedBox(width: 350, child: gradientBackground)
//         : Scaffold(
//             backgroundColor: Colors.transparent,
//             appBar: AppBar(
//               backgroundColor: kAppBarColor,
//               title: const Text(
//                 'Apply Permission Time',
//                 style: TextStyle(color: kTextColor),
//               ),
//             ),
//             body: SafeArea(child: gradientBackground),
//           );
//   }
// }

// // 🔁 Helper: Time Range for each shift
// class TimeRange {
//   final TimeOfDay start;
//   final TimeOfDay end;

//   TimeRange({required this.start, required this.end});

//   bool contains(TimeOfDay time) {
//     final startMinutes = start.hour * 60 + start.minute;
//     final endMinutes = end.hour * 60 + end.minute;
//     final checkMinutes = time.hour * 60 + time.minute;
//     return checkMinutes >= startMinutes && checkMinutes <= endMinutes;
//   }
// }



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class PermissionTimePage extends StatefulWidget {
  const PermissionTimePage({Key? key, required this.isPopup}) : super(key: key);
  final bool isPopup;

  @override
  State<PermissionTimePage> createState() => _PermissionTimePageState();
}

class _PermissionTimePageState extends State<PermissionTimePage> {
  final _formKey = GlobalKey<FormState>();
  final List<String> shifts = ['Shift 1', 'Shift 2', 'Shift 3'];
  final List<String> reasons = ['Emergency', 'Personal Reason'];

  String? selectedShift;
  String? selectedReason;
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  final TextEditingController startTimeController = TextEditingController();
  final TextEditingController endTimeController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

  final Map<String, TimeRange> shiftTimeRanges = {
    'Shift 1': TimeRange(start: TimeOfDay(hour: 6, minute: 0), end: TimeOfDay(hour: 14, minute: 0)),
    'Shift 2': TimeRange(start: TimeOfDay(hour: 8, minute: 30), end: TimeOfDay(hour: 16, minute: 30)),
    'Shift 3': TimeRange(start: TimeOfDay(hour: 9, minute: 0), end: TimeOfDay(hour: 17, minute: 0)),
  };

  Future<void> _selectDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
        dateController.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Future<void> _selectTime(BuildContext context, bool isStart) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      final shiftRange = shiftTimeRanges[selectedShift];
      if (shiftRange != null && !shiftRange.contains(picked)) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Selected time is outside ${selectedShift!} range')),
        );
        return;
      }

      setState(() {
        final formatted = formatTimeOfDay(picked);
        if (isStart) {
          startTime = picked;
          startTimeController.text = formatted;
          endTimeController.clear();
          endTime = null;
        } else {
          endTime = picked;
          endTimeController.text = formatted;
        }
      });
    }
  }

  String formatTimeOfDay(TimeOfDay? time) {
    if (time == null) return '';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return DateFormat.jm().format(dt);
  }

  Future<void> _handleSubmit() async {
    if (_formKey.currentState!.validate()) {
      // 🧹 Backend call removed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Permission Request Submiited')),
      );
      _formKey.currentState?.reset();
      setState(() {
        selectedShift = null;
        selectedReason = null;
        startTime = null;
        endTime = null;
        selectedDate = null;
        startTimeController.clear();
        endTimeController.clear();
        dateController.clear();
      });
    }
  }

  InputDecoration inputBoxDecoration(String label, {bool isRequired = true}) {
    return InputDecoration(
      label: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: isRequired
              ? const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))]
              : [],
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kAppBarColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kButtonColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(color: Colors.red, width: 2),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Container(
              color: kAppBarColor,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
              width: double.infinity,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: Colors.white),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Apply Permission Time",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: selectedShift,
                        decoration: inputBoxDecoration('Shift'),
                        items: shifts.map((shift) {
                          return DropdownMenuItem(value: shift, child: Text(shift));
                        }).toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedShift = value;
                            startTime = null;
                            endTime = null;
                            startTimeController.clear();
                            endTimeController.clear();
                          });
                        },
                        validator: (value) => value == null ? 'Please select a shift' : null,
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => _selectTime(context, true),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: startTimeController,
                            decoration: inputBoxDecoration('Start Time'),
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Please select start time' : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => _selectTime(context, false),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: endTimeController,
                            decoration: inputBoxDecoration('End Time'),
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Please select end time' : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 16),
                      DropdownButtonFormField<String>(
                        value: selectedReason,
                        decoration: inputBoxDecoration('Reason'),
                        items: reasons.map((reason) {
                          return DropdownMenuItem(value: reason, child: Text(reason));
                        }).toList(),
                        onChanged: (value) => setState(() => selectedReason = value),
                        validator: (value) => value == null ? 'Please select a reason' : null,
                      ),
                      const SizedBox(height: 16),
                      GestureDetector(
                        onTap: () => _selectDate(context),
                        child: AbsorbPointer(
                          child: TextFormField(
                            controller: dateController,
                            decoration: inputBoxDecoration('Date'),
                            validator: (value) =>
                                value == null || value.isEmpty ? 'Please select a date' : null,
                          ),
                        ),
                      ),
                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: _handleSubmit,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: kButtonColor,
                            padding: const EdgeInsets.symmetric(vertical: 14),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          child: const Text(
                            'Submit',
                            style: TextStyle(color: kTextColor, fontSize: 16),
                          ),
                        ),
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

class TimeRange {
  final TimeOfDay start;
  final TimeOfDay end;

  TimeRange({required this.start, required this.end});

  bool contains(TimeOfDay time) {
    final startMinutes = start.hour * 60 + start.minute;
    final endMinutes = end.hour * 60 + end.minute;
    final checkMinutes = time.hour * 60 + time.minute;
    return checkMinutes >= startMinutes && checkMinutes <= endMinutes;
  }
}