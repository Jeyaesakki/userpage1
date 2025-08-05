

// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'package:serv_app/Pagesadmin/globals_page.dart';

// // ✅ Gradient + Color Constants
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF); // Light lavender
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9); // Deeper lavender
// const Color kAppBarColor = Color(0xFF8c6eaf);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class LeavePage extends StatefulWidget {
//   const LeavePage({super.key});

//   @override
//   State<LeavePage> createState() => _LeavePageState();
// }

// class _LeavePageState extends State<LeavePage> {
//   final nameController = TextEditingController();
//   final locationController = TextEditingController();
//   final fromDateController = TextEditingController();
//   final toDateController = TextEditingController();
//   final deptController = TextEditingController();
//   final _formKey = GlobalKey<FormState>();
//   bool showWeekOffForm = false;

//   // ✅ Updated showDatePicker with minDate support
//   Future<void> _selectDate(TextEditingController controller, {DateTime? minDate}) async {
//     DateTime initialDate = DateTime.now();

//     if (controller.text.isNotEmpty) {
//       initialDate = DateFormat('dd-MM-yyyy').parse(controller.text);
//     }

//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: initialDate,
//       firstDate: minDate ?? DateTime(2020),
//       lastDate: DateTime(2035),
//     );

//     if (picked != null) {
//       controller.text = DateFormat('dd-MM-yyyy').format(picked);
//     }
//   }

//   void _addWeekOff() {
//     if (_formKey.currentState!.validate()) {
//       final from = fromDateController.text;
//       final to = toDateController.text;
//       final fromDt = DateFormat('dd-MM-yyyy').parse(from);
//       final toDt = DateFormat('dd-MM-yyyy').parse(to);
//       final days = toDt.difference(fromDt).inDays + 1;

//       leaveList.add({
//         'type': "${nameController.text} (Week Off)",
//         'dept': deptController.text,
//         'from': from,
//         'to': to,
//         'days': days.toString(),
//       });

//       setState(() {
//         showWeekOffForm = false;
//         nameController.clear();
//         locationController.clear();
//         fromDateController.clear();
//         toDateController.clear();
//         deptController.clear();
//       });
//     }
//   }

//   InputDecoration _buildInputDecoration(String label) {
//     return InputDecoration(
//       labelText: label,
//       border: OutlineInputBorder(
//         borderRadius: BorderRadius.circular(8),
//       ),
//       contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//       filled: true,
//       fillColor: Colors.white,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Leave & WeekOff"),
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
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kButtonColor,
//                       foregroundColor: Colors.white,
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         showWeekOffForm = !showWeekOffForm;
//                       });
//                     },
//                     child: Text(showWeekOffForm ? "Close Week Off Form" : "Add Week Off"),
//                   ),
//                 ],
//               ),
//               if (showWeekOffForm) ...[
//                 const SizedBox(height: 12),
//                 Form(
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       _buildTextField("Name", nameController),
//                       _buildTextField("Location", locationController),
//                       _buildDateField("From Date", fromDateController),
//                       _buildDateField(
//                         "To Date",
//                         toDateController,
//                         minDate: fromDateController.text.isNotEmpty
//                             ? DateFormat('dd-MM-yyyy').parse(fromDateController.text)
//                             : null,
//                       ),
//                       _buildTextField("Department", deptController),
//                       const SizedBox(height: 10),
//                       ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: kButtonColor,
//                           foregroundColor: Colors.white,
//                         ),
//                         onPressed: _addWeekOff,
//                         child: const Text("Submit"),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),
//               ],
//               const Text("Leave", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
//               const SizedBox(height: 10),
//               leaveList.isEmpty
//                   ? const Center(child: Text("No leave data available"))
//                   : ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: leaveList.length,
//                       itemBuilder: (context, index) {
//                         final leave = leaveList[index];
//                         return Container(
//                           margin: const EdgeInsets.only(bottom: 15),
//                           padding: const EdgeInsets.all(15),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(15),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.purpleAccent.withOpacity(0.2),
//                                 spreadRadius: 2,
//                                 blurRadius: 5,
//                                 offset: const Offset(0, 3),
//                               ),
//                             ],
//                             border: Border.all(color: Colors.deepPurple.shade100),
//                           ),
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Row(
//                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text(
//                                     leave['type'] ?? '',
//                                     style: const TextStyle(
//                                       color: Colors.deepPurple,
//                                       fontSize: 16,
//                                       fontWeight: FontWeight.bold,
//                                     ),
//                                   ),
//                                   IconButton(
//                                     icon: const Icon(Icons.delete_outline, color: Colors.red),
//                                     onPressed: () {
//                                       setState(() {
//                                         leaveList.removeAt(index);
//                                       });
//                                     },
//                                   ),
//                                 ],
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 "Department: ${leave['dept']}",
//                                 style: const TextStyle(color: Colors.black87, fontSize: 14),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 "From: ${leave['from']}   To: ${leave['to']}",
//                                 style: const TextStyle(color: Colors.black54, fontSize: 13),
//                               ),
//                               const SizedBox(height: 5),
//                               Text(
//                                 "No. of Days: ${leave['days']}",
//                                 style: const TextStyle(
//                                   color: Colors.redAccent,
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w500,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },
//                     ),
//             ],
//           ),
//         ),
//       ),
//       floatingActionButton: FloatingActionButton.extended(
//         backgroundColor: kButtonColor,
//         onPressed: () async {
//           final updated = await Navigator.pushNamed(context, '/add-leave');
//           if (updated == true) {
//             setState(() {});
//           }
//         },
//         icon: const Icon(Icons.add),
//         label: const Text("Add Leave"),
//       ),
//     );
//   }

//   // ✅ Text Field
//   Widget _buildTextField(String label, TextEditingController controller) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: TextFormField(
//         controller: controller,
//         decoration: _buildInputDecoration(label),
//         validator: (val) => val == null || val.isEmpty ? 'Required' : null,
//       ),
//     );
//   }

//   // ✅ Date Field with optional minDate
//   Widget _buildDateField(String label, TextEditingController controller, {DateTime? minDate}) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 6),
//       child: TextFormField(
//         controller: controller,
//         readOnly: true,
//         onTap: () => _selectDate(controller, minDate: minDate),
//         decoration: _buildInputDecoration(label).copyWith(
//           suffixIcon: const Icon(Icons.calendar_today),
//         ),
//         validator: (val) => val == null || val.isEmpty ? 'Select a date' : null,
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
import 'package:serv_app/Pagesadmin/globals_page.dart';

// ✅ Gradient + Color Constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8c6eaf);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class LeavePage extends StatefulWidget {
  const LeavePage({super.key});

  @override
  State<LeavePage> createState() => _LeavePageState();
}

class _LeavePageState extends State<LeavePage> {
  final nameController = TextEditingController();
  final locationController = TextEditingController();
  final fromDateController = TextEditingController();
  final toDateController = TextEditingController();
  final deptController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool showWeekOffForm = false;

  DateTime? fromDate; // 🔹 track from date
  DateTime? toDate;   // 🔹 track to date

  // ✅ Updated showDatePicker with minDate support
  Future<void> _selectDate(TextEditingController controller, {DateTime? minDate, bool isFrom = false}) async {
    DateTime initialDate = DateTime.now();

    if (controller.text.isNotEmpty) {
      initialDate = DateFormat('dd-MM-yyyy').parse(controller.text);
    }

    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: minDate ?? DateTime(2020),
      lastDate: DateTime(2035),
    );

    if (picked != null) {
      setState(() {
        controller.text = DateFormat('dd-MM-yyyy').format(picked);

        if (isFrom) {
          fromDate = picked;

          // 🔹 if To Date exists and it's before From Date, clear it
          if (toDate != null && toDate!.isBefore(fromDate!)) {
            toDate = null;
            toDateController.clear();
          }
        } else {
          toDate = picked;
        }
      });
    }
  }

  void _addWeekOff() {
    if (_formKey.currentState!.validate()) {
      if (fromDate != null && toDate != null && toDate!.isBefore(fromDate!)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("To Date cannot be before From Date"), backgroundColor: Colors.red),
        );
        return;
      }

      final days = toDate!.difference(fromDate!).inDays + 1;

      leaveList.add({
        'type': "${nameController.text} (Week Off)",
        'dept': deptController.text,
        'from': fromDateController.text,
        'to': toDateController.text,
        'days': days.toString(),
      });

      setState(() {
        showWeekOffForm = false;
        nameController.clear();
        locationController.clear();
        fromDateController.clear();
        toDateController.clear();
        deptController.clear();
        fromDate = null;
        toDate = null;
      });
    }
  }

  InputDecoration _buildInputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      filled: true,
      fillColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Leave & Holiday"),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: kButtonColor, foregroundColor: Colors.white),
                    onPressed: () {
                      setState(() {
                        showWeekOffForm = !showWeekOffForm;
                      });
                    },
                    child: Text(showWeekOffForm ? "Close Week Off Form" : "Add Week Off"),
                  ),
                ],
              ),
              if (showWeekOffForm) ...[
                const SizedBox(height: 12),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      _buildTextField("Name", nameController),
                      _buildTextField("Location", locationController),

                      // From Date field
                      _buildDateField("From Date", fromDateController, isFrom: true),

                      // To Date field locked after From Date
                      _buildDateField(
                        "To Date",
                        toDateController,
                        minDate: fromDate, // 🔹 only after From Date
                      ),

                      _buildTextField("Department", deptController),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(backgroundColor: kButtonColor, foregroundColor: Colors.white),
                        onPressed: _addWeekOff,
                        child: const Text("Submit"),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
              const Text("Leave", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              leaveList.isEmpty
                  ? const Center(child: Text("No leave data available"))
                  : ListView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: leaveList.length,
                      itemBuilder: (context, index) {
                        final leave = leaveList[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.purpleAccent.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: const Offset(0, 3),
                              ),
                            ],
                            border: Border.all(color: Colors.deepPurple.shade100),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    leave['type'] ?? '',
                                    style: const TextStyle(
                                      color: Colors.deepPurple,
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.delete_outline, color: Colors.red),
                                    onPressed: () {
                                      setState(() {
                                        leaveList.removeAt(index);
                                      });
                                    },
                                  ),
                                ],
                              ),
                              const SizedBox(height: 5),
                              Text("Department: ${leave['dept']}", style: const TextStyle(color: Colors.black87)),
                              const SizedBox(height: 5),
                              Text("From: ${leave['from']}   To: ${leave['to']}",
                                  style: const TextStyle(color: Colors.black54)),
                              const SizedBox(height: 5),
                              Text("No. of Days: ${leave['days']}",
                                  style: const TextStyle(color: Colors.redAccent, fontWeight: FontWeight.w500)),
                            ],
                          ),
                        );
                      },
                    ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: kButtonColor,
        onPressed: () async {
          final updated = await Navigator.pushNamed(context, '/add-leave');
          if (updated == true) {
            setState(() {});
          }
        },
        icon: const Icon(Icons.add),
        label: const Text("Add Leave"),
      ),
    );
  }

  // Text Field
  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        decoration: _buildInputDecoration(label),
        validator: (val) => val == null || val.isEmpty ? 'Required' : null,
      ),
    );
  }

  // Date Field with optional minDate
  Widget _buildDateField(String label, TextEditingController controller, {DateTime? minDate, bool isFrom = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: TextFormField(
        controller: controller,
        readOnly: true,
        onTap: () => _selectDate(controller, minDate: minDate, isFrom: isFrom),
        decoration: _buildInputDecoration(label).copyWith(suffixIcon: const Icon(Icons.calendar_today)),
        validator: (val) => val == null || val.isEmpty ? 'Select a date' : null,
      ),
    );
  }
}