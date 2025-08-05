

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// // 🎨 Your Color Constants
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class ApplyHalfDayForm extends StatefulWidget {
//   const ApplyHalfDayForm({super.key});

//   @override
//   State<ApplyHalfDayForm> createState() => _ApplyHalfDayFormState();
// }

// class _ApplyHalfDayFormState extends State<ApplyHalfDayForm> {
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   String? selectedShift;
//   DateTime? fromDate;
//   DateTime? replaceWorkDate;
//   final TextEditingController reasonController = TextEditingController();

//   final List<String> shifts = ['Shift 1', 'Shift 2', 'Shift 3'];

//   Future<void> _pickDate(bool isFromDate) async {
//     final picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime.now(),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isFromDate) {
//           fromDate = picked;
//         } else {
//           replaceWorkDate = picked;
//         }
//       });
//     }
//   }

//   void _submitForm() {
//     if (_formKey.currentState?.validate() != true) return;

//     if (fromDate == null || replaceWorkDate == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('⚠️ Please select both dates')),
//       );
//       return;
//     }

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('CompOff Request Submitted Successfully')),
//     );

//     setState(() {
//       selectedShift = null;
//       fromDate = null;
//       replaceWorkDate = null;
//       reasonController.clear();
//     });
//   }

//   InputDecoration buildInputDecoration(String label, {bool isRequired = false}) {
//     return InputDecoration(
//       label: RichText(
//         text: TextSpan(
//           text: label,
//           style: const TextStyle(
//             color: Colors.black,
//             fontSize: 16,
//           ),
//           children: isRequired
//               ? const [
//                   TextSpan(
//                     text: ' *',
//                     style: TextStyle(color: Colors.red),
//                   )
//                 ]
//               : [],
//         ),
//       ),
//       floatingLabelBehavior: FloatingLabelBehavior.auto,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Apply CompOff"),
//         backgroundColor: kAppBarColor,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//           ),
//         ),
//         child: Form(
//           key: _formKey,
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               children: [
//                 /// 🔽 Shift Dropdown
//                 DropdownButtonFormField<String>(
//                   decoration: buildInputDecoration("Shift", isRequired: true),
//                   value: selectedShift,
//                   items: shifts.map((shift) {
//                     return DropdownMenuItem(value: shift, child: Text(shift));
//                   }).toList(),
//                   validator: (value) =>
//                       value == null ? 'Please select a shift' : null,
//                   onChanged: (value) => setState(() => selectedShift = value),
//                 ),
//                 const SizedBox(height: 16),

//                 /// 📅 From Date
//                 TextFormField(
//                   readOnly: true,
//                   onTap: () => _pickDate(true),
//                   controller: TextEditingController(
//                     text: fromDate != null
//                         ? DateFormat('dd MMM yyyy').format(fromDate!)
//                         : '',
//                   ),
//                   validator: (_) =>
//                       fromDate == null ? 'Please select from date' : null,
//                   decoration:
//                       buildInputDecoration("From Date", isRequired: true),
//                 ),
//                 const SizedBox(height: 16),

//                 /// 🔁 Replace Work Date
//                 TextFormField(
//                   readOnly: true,
//                   onTap: () => _pickDate(false),
//                   controller: TextEditingController(
//                     text: replaceWorkDate != null
//                         ? DateFormat('dd MMM yyyy').format(replaceWorkDate!)
//                         : '',
//                   ),
//                   validator: (_) => replaceWorkDate == null
//                       ? 'Please select replace work date'
//                       : null,
//                   decoration:
//                       buildInputDecoration("Replace Work Date", isRequired: true),
//                 ),
//                 const SizedBox(height: 16),

//                 /// 📝 Reason
//                 TextFormField(
//                   controller: reasonController,
//                   maxLines: 3,
//                   validator: (value) =>
//                       value == null || value.trim().isEmpty
//                           ? 'Please enter a reason'
//                           : null,
//                   decoration: buildInputDecoration("Reason", isRequired: true),
//                 ),
//                 const SizedBox(height: 32),

//                 /// ✅ Submit Button
//                 SizedBox(
//                   width: double.infinity,
//                   child: ElevatedButton(
//                     onPressed: _submitForm,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kButtonColor,
//                       padding: const EdgeInsets.symmetric(vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(12),
//                       ),
//                     ),
//                     child: const Text("Submit",
//                         style: TextStyle(color: kTextColor)),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class ApplyHalfDayForm extends StatefulWidget {
  const ApplyHalfDayForm({super.key});

  @override
  State<ApplyHalfDayForm> createState() => _ApplyHalfDayFormState();
}

class _ApplyHalfDayFormState extends State<ApplyHalfDayForm> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedShift;
  DateTime? fromDate;
  DateTime? replaceWorkDate;
  final TextEditingController reasonController = TextEditingController();

  final List<String> shifts = ['Shift 1', 'Shift 2', 'Shift 3'];

  Future<void> _pickDate(bool isFromDate) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          fromDate = picked;
        } else {
          replaceWorkDate = picked;
        }
      });
    }
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState?.validate() != true) return;

    if (fromDate == null || replaceWorkDate == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('⚠️ Please select both dates')),
      );
      return;
    }

    // ❌ Removed backend API call
    // ✅ Show local success message
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('CompOff Request Submitted '),
        backgroundColor: Color.fromARGB(255, 7, 10, 7),
      ),
    );

    setState(() {
      selectedShift = null;
      fromDate = null;
      replaceWorkDate = null;
      reasonController.clear();
    });
  }

  InputDecoration buildInputDecoration(String label, {bool isRequired = false}) {
    return InputDecoration(
      filled: true,
      fillColor: Colors.white,
      label: RichText(
        text: TextSpan(
          text: label,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
          children: isRequired
              ? const [TextSpan(text: ' *', style: TextStyle(color: Colors.red))]
              : [],
        ),
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply CompOff"),
        backgroundColor: kAppBarColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
          ),
        ),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                /// 🔽 Shift Dropdown
                DropdownButtonFormField<String>(
                  decoration: buildInputDecoration("Shift", isRequired: true),
                  value: selectedShift,
                  items: shifts.map((shift) {
                    return DropdownMenuItem(value: shift, child: Text(shift));
                  }).toList(),
                  validator: (value) =>
                      value == null ? 'Please select a shift' : null,
                  onChanged: (value) => setState(() => selectedShift = value),
                ),
                const SizedBox(height: 16),

                /// 📅 From Date
                TextFormField(
                  readOnly: true,
                  onTap: () => _pickDate(true),
                  controller: TextEditingController(
                    text: fromDate != null
                        ? DateFormat('dd MMM yyyy').format(fromDate!)
                        : '',
                  ),
                  validator: (_) =>
                      fromDate == null ? 'Please select from date' : null,
                  decoration:
                      buildInputDecoration("From Date", isRequired: true),
                ),
                const SizedBox(height: 16),

                /// 🔁 Replace Work Date
                TextFormField(
                  readOnly: true,
                  onTap: () => _pickDate(false),
                  controller: TextEditingController(
                    text: replaceWorkDate != null
                        ? DateFormat('dd MMM yyyy').format(replaceWorkDate!)
                        : '',
                  ),
                  validator: (_) => replaceWorkDate == null
                      ? 'Please select replace work date'
                      : null,
                  decoration:
                      buildInputDecoration("Compensate Date", isRequired: true),
                ),
                const SizedBox(height: 16),

                /// 📝 Reason
                TextFormField(
                  controller: reasonController,
                  maxLines: 3,
                  validator: (value) =>
                      value == null || value.trim().isEmpty
                          ? 'Please enter a reason'
                          : null,
                  decoration: buildInputDecoration("Reason", isRequired: true),
                ),
                const SizedBox(height: 32),

                /// ✅ Submit Button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonColor,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Submit",
                        style: TextStyle(color: kTextColor)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}