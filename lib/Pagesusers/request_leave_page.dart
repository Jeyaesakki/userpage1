
// import 'package:flutter/material.dart';
// import 'apply_half_day_form_page.dart';

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
//   String selectedStatus = 'All';

//   final List<Map<String, dynamic>> leaveTypes = [
//     {'type': 'Casual Leave', 'used': 5, 'total': 5, 'status': 'closed'},
//     {'type': 'Planned Leave', 'used': 2, 'total': 2, 'status': 'closed'},
//     {'type': 'Sick Leave', 'used': 2, 'total': 2, 'status': 'closed'},
//     {'type': 'Casual Leave', 'used': 0, 'total': 5, 'status': 'available'},
//   ];

//   List<Map<String, dynamic>> get filteredLeaves {
//     if (selectedStatus == 'All') return leaveTypes;
//     return leaveTypes
//         .where((leave) => leave['status'] == selectedStatus.toLowerCase())
//         .toList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return DraggableScrollableSheet(
//       initialChildSize: 0.9,
//       maxChildSize: 0.95,
//       minChildSize: 0.6,
//       builder: (context, scrollController) {
//         return Container(
//           padding: const EdgeInsets.all(12),
//           decoration: const BoxDecoration(
//             gradient: LinearGradient(
//               colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomCenter,
//             ),
//             borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
//           ),
//           child: Column(
//             children: [
//               // Handle bar
//               Container(
//                 width: 40,
//                 height: 4,
//                 margin: const EdgeInsets.only(bottom: 10),
//                 decoration: BoxDecoration(
//                   color: Colors.grey,
//                   borderRadius: BorderRadius.circular(2),
//                 ),
//               ),

//               // Dropdown
//               DropdownButtonFormField<String>(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   filled: true,
//                   fillColor: Colors.white,
//                 ),
//                 value: selectedStatus,
//                 items: const [
//                   DropdownMenuItem(value: 'All', child: Text("Status")),
//                   DropdownMenuItem(value: 'closed', child: Text("Closed")),
//                   DropdownMenuItem(value: 'available', child: Text("Available")),
//                 ],
//                 onChanged: (value) {
//                   setState(() {
//                     selectedStatus = value!;
//                   });
//                 },
//               ),

//               const SizedBox(height: 10),

//               // ListView of leaves
//               Expanded(
//                 child: ListView.builder(
//                   controller: scrollController,
//                   itemCount: filteredLeaves.length,
//                   itemBuilder: (context, index) {
//                     final leave = filteredLeaves[index];
//                     final isClosed = leave['status'] == 'closed';

//                     return Container(
//                       margin: const EdgeInsets.symmetric(vertical: 6),
//                       padding: const EdgeInsets.all(12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         border: Border.all(color: Colors.grey.shade300),
//                       ),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 leave['type'],
//                                 style: const TextStyle(fontWeight: FontWeight.w600),
//                               ),
//                               Text("${leave['used']}/${leave['total']}"),
//                             ],
//                           ),
//                           Text(
//                             isClosed ? "Closed" : "Available",
//                             style: TextStyle(
//                               color: isClosed ? Colors.red : Colors.green,
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 ),
//               ),

//               // Apply Leave Button
//               SizedBox(
//                 width: double.infinity,
//                 height: 50,
//                 child: ElevatedButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                     Future.delayed(const Duration(milliseconds: 100), () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: (context) => const ApplyHalfDayForm(),
//                         ),
//                       );
//                     });
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: kButtonColor,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                   ),
//                   child: const Text(
//                     "Apply Leave",
//                     style: TextStyle(fontSize: 18, color: kTextColor),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
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
  final TextEditingController shiftGroupController = TextEditingController();
  final TextEditingController sessionTimeController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  final List<String> leaveTypes = ['Sick Leave', 'Casual Leave', 'Earned Leave'];
  final List<String> shifts = ['Morning', 'Afternoon', 'Night'];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: kPrimaryBackgroundTop,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(Icons.arrow_back, color: kAppBarColor),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "Apply",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: kAppBarColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Leave Type *
              DropdownButtonFormField<String>(
                value: selectedLeaveType,
                hint: const Text("Choose Leave Type"),
                decoration: _inputDecorationWithLabel("Leave Type"),
                items: leaveTypes.map((type) {
                  return DropdownMenuItem(value: type, child: Text(type));
                }).toList(),
                onChanged: (value) => setState(() => selectedLeaveType = value),
                validator: (value) => value == null ? "Please select leave type" : null,
              ),
              const SizedBox(height: 16),

              // Shift *
              DropdownButtonFormField<String>(
                value: selectedShift,
                hint: const Text("Choose Shift"),
                decoration: _inputDecorationWithLabel("Shift"),
                items: shifts.map((shift) {
                  return DropdownMenuItem(value: shift, child: Text(shift));
                }).toList(),
                onChanged: (value) => setState(() => selectedShift = value),
                validator: (value) => value == null ? "Please select shift" : null,
              ),
              const SizedBox(height: 16),

              // Shift Group *
              TextFormField(
                controller: shiftGroupController,
                decoration: _inputDecorationWithLabel("Shift Group").copyWith(
                  hintText: "Enter Shift Group",
                ),
                validator: (value) => value!.isEmpty ? "Enter shift group" : null,
              ),
              const SizedBox(height: 16),

              // Session Time *
              TextFormField(
                controller: sessionTimeController,
                decoration: _inputDecorationWithLabel("Session Time").copyWith(
                  hintText: "Enter Session Time",
                ),
                validator: (value) => value!.isEmpty ? "Enter session time" : null,
              ),
              const SizedBox(height: 16),

              // Reason *
              TextFormField(
                controller: reasonController,
                maxLines: 2,
                decoration: _inputDecorationWithLabel("Reason").copyWith(
                  hintText: "Enter Reason",
                ),
                validator: (value) => value!.isEmpty ? "Enter reason" : null,
              ),
              const SizedBox(height: 24),

              // Submit button
              SizedBox(
                width: double.infinity,
                height: 44,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Leave Request Submitted")),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text("Submit", style: TextStyle(color: kTextColor)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Reusable input decoration with floating label and mandatory red *
  InputDecoration _inputDecorationWithLabel(String labelText) {
    return InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      label: RichText(
        text: TextSpan(
          text: labelText,
          style: const TextStyle(color: Colors.black87, fontSize: 14),
          children: const [
            TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
          ],
        ),
      ),
      filled: true,
      fillColor: Colors.white,
      contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kButtonColor, width: 1.5),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: kAppBarColor, width: 2),
      ),
    );
  }
}