



// import 'package:flutter/material.dart';

// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8c6eaf);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

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
//   final _formKey = GlobalKey<FormState>();

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
//       firstDate: DateTime.now(),
//       lastDate: DateTime.now().add(const Duration(days: 365)),
//     );

//     if (pickedDate != null) {
//       setState(() {
//         selectedDate = pickedDate;
//       });
//     }
//   }

//   InputDecoration buildInputDecoration(String label) {
//     return InputDecoration(
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       filled: true,
//       fillColor: Colors.white,
//       label: RichText(
//         text: TextSpan(
//           text: label,
//           style: const TextStyle(color: Colors.black, fontSize: 16),
//           children: const [
//             TextSpan(
//               text: ' *',
//               style: TextStyle(color: Colors.red),
//             ),
//           ],
//         ),
//       ),
//       border: const OutlineInputBorder(),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 18),
//     );
//   }

//   Future<void> _submitForm() async {
//     if (_formKey.currentState!.validate()) {
//       // ✅ No backend call here, simulate success
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("HalfDay Request Submitted"),
//           backgroundColor: Color.fromARGB(255, 22, 24, 22),
//         ),
//       );
//       if (widget.isPopup) Navigator.pop(context);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final pageContent = SingleChildScrollView(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             GestureDetector(
//               onTap: () => _selectDate(context),
//               child: AbsorbPointer(
//                 child: TextFormField(
//                   decoration: buildInputDecoration("Leave Date"),
//                   controller: TextEditingController(
//                     text: selectedDate == null
//                         ? ''
//                         : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
//                   ),
//                   validator: (_) =>
//                       selectedDate == null ? 'Please select a leave date' : null,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             DropdownButtonFormField<String>(
//               decoration: buildInputDecoration("Select Session"),
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
//               validator: (value) =>
//                   value == null ? 'Please select a session' : null,
//             ),
//             const SizedBox(height: 10),
//             if (selectedSession != null)
//               Padding(
//                 padding: const EdgeInsets.only(bottom: 12),
//                 child: Text(
//                   sessionTime,
//                   style: const TextStyle(
//                     fontSize: 14,
//                     fontWeight: FontWeight.w500,
//                     color: Colors.blueGrey,
//                   ),
//                 ),
//               ),
//             TextFormField(
//               controller: reasonController,
//               maxLines: 3,
//               decoration: buildInputDecoration("Reason"),
//               validator: (value) =>
//                   value == null || value.trim().isEmpty
//                       ? 'Please enter a reason'
//                       : null,
//             ),
//             const SizedBox(height: 24),
//             SizedBox(
//               width: double.infinity,
//               child: ElevatedButton(
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: kButtonColor,
//                   foregroundColor: kTextColor,
//                   padding: const EdgeInsets.symmetric(vertical: 14),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                 ),
//                 onPressed: _submitForm,
//                 child: const Text("Submit"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );

//     final gradientBackground = Container(
//       decoration: const BoxDecoration(
//         gradient: LinearGradient(
//           colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//           begin: Alignment.topCenter,
//           end: Alignment.bottomCenter,
//         ),
//       ),
//       child: SafeArea(
//         child: widget.isPopup
//             ? SizedBox(width: 350, child: pageContent)
//             : Column(
//                 children: [
//                   Expanded(child: pageContent),
//                 ],
//               ),
//       ),
//     );

//     return Scaffold(
//       backgroundColor: Colors.transparent,
//       appBar: widget.isPopup
//           ? null
//           : AppBar(
//               title: const Text('Apply Half Day'),
//               backgroundColor: kAppBarColor,
//               foregroundColor: kTextColor,
//             ),
//       body: gradientBackground,
//     );
//   }
// }



import 'package:flutter/material.dart';

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
      filled: true,
      fillColor: Colors.white,
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

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      // ✅ No backend call here, simulate success
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("HalfDay Request Submitted"),
          backgroundColor: Color.fromARGB(255, 22, 24, 22),
        ),
      );
      if (widget.isPopup) Navigator.pop(context);
    }
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
                onPressed: _submitForm,
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