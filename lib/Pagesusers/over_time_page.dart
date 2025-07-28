


// import 'package:flutter/material.dart';

// // ✅ Custom colors
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class OverTimePage extends StatefulWidget {
//   final bool isPopup;
//   const OverTimePage({super.key, this.isPopup = false});

//   @override
//   State<OverTimePage> createState() => _OverTimePageState();
// }

// class _OverTimePageState extends State<OverTimePage> {
//   final _formKey = GlobalKey<FormState>();

//   String? selectedShift;
//   DateTime? selectedDate;
//   TimeOfDay? startTime;
//   TimeOfDay? endTime;

//   final List<String> shifts = ['Shift 1', 'Shift 2', 'Shift 3'];

//   Future<void> pickTime(BuildContext context, bool isStartTime) async {
//     final TimeOfDay? picked = await showTimePicker(
//       context: context,
//       initialTime: isStartTime
//           ? (startTime ?? TimeOfDay(hour: 9, minute: 0))
//           : (endTime ?? TimeOfDay(hour: 17, minute: 0)),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStartTime) {
//           startTime = picked;
//           // Clear end time if it's earlier than new start time
//           if (endTime != null && !_isAfter(startTime!, endTime!)) {
//             endTime = null;
//           }
//         } else {
//           endTime = picked;
//         }
//       });
//     }
//   }

//   bool _isAfter(TimeOfDay start, TimeOfDay end) {
//     return end.hour > start.hour ||
//         (end.hour == start.hour && end.minute > start.minute);
//   }

//   String _formatTime(TimeOfDay? time) {
//     if (time == null) return '';
//     final now = DateTime.now();
//     final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
//     return TimeOfDay.fromDateTime(dt).format(context);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final content = SingleChildScrollView(
//       padding: const EdgeInsets.all(16),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // 📅 Date Picker
//             TextFormField(
//               readOnly: true,
//               decoration: const InputDecoration(labelText: "Select Date"),
//               onTap: () async {
//                 DateTime? date = await showDatePicker(
//                   context: context,
//                   firstDate: DateTime.now().subtract(const Duration(days: 30)),
//                   lastDate: DateTime.now().add(const Duration(days: 30)),
//                   initialDate: DateTime.now(),
//                 );
//                 if (date != null) {
//                   setState(() => selectedDate = date);
//                 }
//               },
//               validator: (_) => selectedDate == null ? 'Select a date' : null,
//               controller: TextEditingController(
//                 text: selectedDate != null
//                     ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
//                     : "",
//               ),
//             ),
//             const SizedBox(height: 12),

//             // 🕒 Shift Dropdown
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(labelText: "Select Shift"),
//               value: selectedShift,
//               items: shifts.map((shift) {
//                 return DropdownMenuItem(value: shift, child: Text(shift));
//               }).toList(),
//               validator: (val) => val == null ? 'Select a shift' : null,
//               onChanged: (value) {
//                 setState(() {
//                   selectedShift = value;
//                 });
//               },
//             ),
//             const SizedBox(height: 12),

//             // 🕓 Start Time
//             GestureDetector(
//               onTap: () => pickTime(context, true),
//               child: AbsorbPointer(
//                 child: TextFormField(
//                   readOnly: true,
//                   decoration: const InputDecoration(labelText: "Start Time"),
//                   controller: TextEditingController(text: _formatTime(startTime)),
//                   validator: (_) => startTime == null ? 'Select start time' : null,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 12),

//             // 🕔 End Time
//             GestureDetector(
//               onTap: () => pickTime(context, false),
//               child: AbsorbPointer(
//                 child: TextFormField(
//                   readOnly: true,
//                   decoration: const InputDecoration(labelText: "End Time"),
//                   controller: TextEditingController(text: _formatTime(endTime)),
//                   validator: (_) {
//                     if (endTime == null) return 'Select end time';
//                     if (startTime != null && !_isAfter(startTime!, endTime!)) {
//                       return 'End time must be after start time';
//                     }
//                     return null;
//                   },
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),

//             // ✅ Submit Button
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 onPressed: () {
//                   if (_formKey.currentState!.validate()) {
//                     final snackText =
//                         "OT Applied on ${selectedDate!.day}/${selectedDate!.month} from ${_formatTime(startTime)} to ${_formatTime(endTime)}";
//                     ScaffoldMessenger.of(context).showSnackBar(
//                       SnackBar(content: Text(snackText)),
//                     );
//                     Navigator.of(context).maybePop();
//                   }
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: kButtonColor,
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(12)),
//                 ),
//                 child: const Text("Submit", style: TextStyle(color: kTextColor)),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     return widget.isPopup
//         ? SizedBox(width: 350, child: content)
//         : Scaffold(
//             appBar: AppBar(
//               title: const Text("Apply Over Time"),
//               backgroundColor: kAppBarColor,
//             ),
//             body: content,
//           );
//   }
// }


import 'package:flutter/material.dart';

// ✅ Custom colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class OverTimePage extends StatefulWidget {
  final bool isPopup;
  const OverTimePage({super.key, this.isPopup = false});

  @override
  State<OverTimePage> createState() => _OverTimePageState();
}

class _OverTimePageState extends State<OverTimePage> {
  final _formKey = GlobalKey<FormState>();

  String? selectedShift;
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  final List<String> shifts = ['Shift 1', 'Shift 2', 'Shift 3'];

  Future<void> pickTime(BuildContext context, bool isStartTime) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: isStartTime
          ? (startTime ?? const TimeOfDay(hour: 9, minute: 0))
          : (endTime ?? const TimeOfDay(hour: 17, minute: 0)),
    );
    if (picked != null) {
      setState(() {
        if (isStartTime) {
          startTime = picked;
          if (endTime != null && !_isAfter(startTime!, endTime!)) {
            endTime = null;
          }
        } else {
          endTime = picked;
        }
      });
    }
  }

  bool _isAfter(TimeOfDay start, TimeOfDay end) {
    return end.hour > start.hour ||
        (end.hour == start.hour && end.minute > start.minute);
  }

  String _formatTime(TimeOfDay? time) {
    if (time == null) return '';
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, time.hour, time.minute);
    return TimeOfDay.fromDateTime(dt).format(context);
  }

  InputDecoration inputBoxDecoration(String label) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      label: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 16, color: Colors.black),
          children: [
            TextSpan(text: label),
            const TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
    );
  }

  @override
  Widget build(BuildContext context) {
    final formContent = Form(
      key: _formKey,
      child: Column(
        children: [
          // 📅 Date Picker — ✅ restrict to today and future
          GestureDetector(
            onTap: () async {
              DateTime now = DateTime.now();
              DateTime? date = await showDatePicker(
                context: context,
                firstDate: DateTime(now.year, now.month, now.day),
                lastDate: DateTime.now().add(const Duration(days: 30)),
                initialDate: now,
              );
              if (date != null) {
                setState(() => selectedDate = date);
              }
            },
            child: AbsorbPointer(
              child: TextFormField(
                decoration: inputBoxDecoration("Select Date"),
                controller: TextEditingController(
                  text: selectedDate != null
                      ? "${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}"
                      : "",
                ),
                validator: (_) => selectedDate == null ? 'Select a date' : null,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 🕒 Shift Dropdown
          DropdownButtonFormField<String>(
            decoration: inputBoxDecoration("Select Shift"),
            value: selectedShift,
            items: shifts.map((shift) {
              return DropdownMenuItem(value: shift, child: Text(shift));
            }).toList(),
            validator: (val) => val == null ? 'Select a shift' : null,
            onChanged: (value) {
              setState(() {
                selectedShift = value;
              });
            },
          ),
          const SizedBox(height: 12),

          // 🕓 Start Time
          GestureDetector(
            onTap: () => pickTime(context, true),
            child: AbsorbPointer(
              child: TextFormField(
                readOnly: true,
                decoration: inputBoxDecoration("Start Time"),
                controller:
                    TextEditingController(text: _formatTime(startTime)),
                validator: (_) =>
                    startTime == null ? 'Select start time' : null,
              ),
            ),
          ),
          const SizedBox(height: 12),

          // 🕔 End Time
          GestureDetector(
            onTap: () => pickTime(context, false),
            child: AbsorbPointer(
              child: TextFormField(
                readOnly: true,
                decoration: inputBoxDecoration("End Time"),
                controller: TextEditingController(text: _formatTime(endTime)),
                validator: (_) {
                  if (endTime == null) return 'Select end time';
                  if (startTime != null && !_isAfter(startTime!, endTime!)) {
                    return 'End time must be after start time';
                  }
                  return null;
                },
              ),
            ),
          ),
        ],
      ),
    );

    final submitButton = SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            final snackText =
                "OT Applied on ${selectedDate!.day}/${selectedDate!.month} from ${_formatTime(startTime)} to ${_formatTime(endTime)}";
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(snackText)),
            );
            Navigator.of(context).maybePop();
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: kButtonColor,
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        child: const Text("Submit", style: TextStyle(color: kTextColor)),
      ),
    );

    final pageContent = Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: formContent,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
          child: submitButton,
        ),
      ],
    );

    final gradientBackground = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
        ),
      ),
      child: SafeArea(child: pageContent),
    );

    return widget.isPopup
        ? SizedBox(width: 350, child: gradientBackground)
        : Scaffold(
            appBar: AppBar(
              title: const Text("Apply Over Time"),
              backgroundColor: kAppBarColor,
            ),
            body: gradientBackground,
          );
  }
}