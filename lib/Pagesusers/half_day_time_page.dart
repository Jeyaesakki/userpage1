



// import 'package:flutter/material.dart';

// class HalfDayTimePage extends StatefulWidget {
//   final bool isPopup;
//   final int totalHalfDays;
//   final int takenHalfDays;
//   final String status;

//   const HalfDayTimePage({
//     super.key,
//     required this.isPopup,
//     required this.totalHalfDays,
//     required this.takenHalfDays,
//     required this.status,
//   });

//   @override
//   State<HalfDayTimePage> createState() => _HalfDayTimePageState();
// }

// class _HalfDayTimePageState extends State<HalfDayTimePage> {
//   DateTime? selectedDate;
//   String? selectedSession;
//   final TextEditingController reasonController = TextEditingController();

//   final List<String> sessions = ['Morning Half', 'Afternoon Half'];

//   String get sessionTime {
//     if (selectedSession == 'Morning Half') {
//       return '9:00 AM - 1:00 PM';
//     } else if (selectedSession == 'Afternoon Half') {
//       return '2:00 PM - 6:00 PM';
//     }
//     return '';
//   }

//   Future<void> _selectDate(BuildContext context) async {
//     final DateTime? pickedDate = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now().subtract(const Duration(days: 0)),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: widget.isPopup
//           ? null
//           : AppBar(
//               title: const Text('Apply Half Day'),
//               backgroundColor: Colors.deepPurple,
//               foregroundColor: Colors.white,
//             ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             const Text(
//               "Apply Half Day Leave",
//               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//             ),
//             const SizedBox(height: 16),

//             // Leave Date Picker
//             Row(
//               children: [
//                 const Icon(Icons.calendar_today),
//                 const SizedBox(width: 8),
//                 const Text("Leave Date: "),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: () => _selectDate(context),
//                   child: Text(selectedDate == null
//                       ? 'Choose Date'
//                       : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}"),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),

//             // Session Dropdown
//             DropdownButtonFormField<String>(
//               decoration: const InputDecoration(
//                 labelText: "Select Session",
//                 border: OutlineInputBorder(),
//               ),
//               value: selectedSession,
//               items: sessions.map((String session) {
//                 return DropdownMenuItem<String>(
//                   value: session,
//                   child: Text(session),
//                 );
//               }).toList(),
//               onChanged: (value) {
//                 setState(() {
//                   selectedSession = value;
//                 });
//               },
//             ),
//             const SizedBox(height: 8),

//             // Show session time
//             if (selectedSession != null)
//               Text(
//                 sessionTime,
//                 style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.blueGrey),
//               ),

//             const SizedBox(height: 16),

//             // Reason field
//             TextField(
//               controller: reasonController,
//               maxLines: 3,
//               decoration: const InputDecoration(
//                 labelText: "Reason",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 24),

//             // Submit Button
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 foregroundColor: Colors.white,
//               ),
//               onPressed: () {
//                 if (selectedDate != null &&
//                     selectedSession != null &&
//                     reasonController.text.isNotEmpty) {
//                   // You can send this data to backend or Firebase
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Submitted Successfully")),
//                   );
//                   if (widget.isPopup) Navigator.pop(context);
//                 } else {
//                   ScaffoldMessenger.of(context).showSnackBar(
//                     const SnackBar(content: Text("Please fill all fields")),
//                   );
//                 }
//               },
//               child: const Text("Submit"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

// ✅ Custom Colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8c6eaf);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class HalfDayTimePage extends StatefulWidget {
  final bool isPopup;
  final int totalHalfDays;
  final int takenHalfDays;
  final String status;

  const HalfDayTimePage({
    super.key,
    required this.isPopup,
    required this.totalHalfDays,
    required this.takenHalfDays,
    required this.status,
  });

  @override
  State<HalfDayTimePage> createState() => _HalfDayTimePageState();
}

class _HalfDayTimePageState extends State<HalfDayTimePage> {
  final _formKey = GlobalKey<FormState>();

  DateTime? selectedDate;
  String? selectedSession;
  final TextEditingController reasonController = TextEditingController();

  final List<String> sessions = ['Morning Half', 'Afternoon Half'];

  String get sessionTime {
    if (selectedSession == 'Morning Half') {
      return '9:00 AM - 1:00 PM';
    } else if (selectedSession == 'Afternoon Half') {
      return '2:00 PM - 6:00 PM';
    }
    return '';
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );

    if (pickedDate != null) {
      setState(() {
        selectedDate = pickedDate;
      });
    }
  }

  InputDecoration buildInputDecoration(String label) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      label: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(color: Colors.black, fontSize: 16),
          children: const [
            TextSpan(
              text: ' *',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      border: const OutlineInputBorder(),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
    );
  }

  @override
  Widget build(BuildContext context) {
    final pageContent = SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Apply Half Day Leave",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),

            /// 📅 Leave Date
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: buildInputDecoration("Leave Date"),
                  controller: TextEditingController(
                    text: selectedDate == null
                        ? ''
                        : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
                  ),
                  validator: (_) =>
                      selectedDate == null ? 'Please select a leave date' : null,
                ),
              ),
            ),
            const SizedBox(height: 16),

            /// 🕒 Session Dropdown
            DropdownButtonFormField<String>(
              decoration: buildInputDecoration("Select Session"),
              value: selectedSession,
              items: sessions.map((String session) {
                return DropdownMenuItem<String>(
                  value: session,
                  child: Text(session),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedSession = value;
                });
              },
              validator: (value) =>
                  value == null ? 'Please select a session' : null,
            ),
            const SizedBox(height: 10),

            /// ⏰ Session Time Info
            if (selectedSession != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  sessionTime,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Colors.blueGrey,
                  ),
                ),
              ),

            /// 📝 Reason
            TextFormField(
              controller: reasonController,
              maxLines: 3,
              decoration: buildInputDecoration("Reason"),
              validator: (value) =>
                  value == null || value.trim().isEmpty
                      ? 'Please enter a reason'
                      : null,
            ),
            const SizedBox(height: 24),

            /// ✅ Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  foregroundColor: kTextColor,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text(" HalfDay  Request Submitted Successfully")),
                    );
                    if (widget.isPopup) Navigator.pop(context);
                  }
                },
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );

    final gradientBackground = Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SafeArea(
        child: widget.isPopup
            ? SizedBox(width: 350, child: pageContent)
            : Column(
                children: [
                  Expanded(child: pageContent),
                ],
              ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: widget.isPopup
          ? null
          : AppBar(
              title: const Text('Apply Half Day'),
              backgroundColor: kAppBarColor,
              foregroundColor: kTextColor,
            ),
      body: gradientBackground,
    );
  }
}