



// import 'package:flutter/material.dart';

// class ApplyLeaveFormPage extends StatefulWidget {
//   const ApplyLeaveFormPage({super.key});

//   @override
//   State<ApplyLeaveFormPage> createState() => _ApplyLeaveFormPageState();
// }

// class _ApplyLeaveFormPageState extends State<ApplyLeaveFormPage> {
//   String leaveType = 'Leave';
//   String? selectedLeaveType;
//   final TextEditingController causeController = TextEditingController();
//   final TextEditingController fromDateController = TextEditingController();
//   final TextEditingController toDateController = TextEditingController();
//   final TextEditingController leaveFormatController = TextEditingController();

//   Future<void> _selectDate(TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2100),
//     );
//     if (picked != null) {
//       controller.text = "${picked.day}/${picked.month}/${picked.year}";
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Apply leave"),
//         backgroundColor: const Color(0xFF9DAAF2),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             // Radio toggle
//             Row(
//               children: [
//                 Radio(
//                   value: 'Leave',
//                   groupValue: leaveType,
//                   onChanged: (value) {
//                     setState(() => leaveType = value.toString());
//                   },
//                 ),
//                 const Text("Leave"),
//                 Radio(
//                   value: 'Comp off',
//                   groupValue: leaveType,
//                   onChanged: (value) {
//                     setState(() => leaveType = value.toString());
//                   },
//                 ),
//                 const Text("Comp off"),
//               ],
//             ),
//             const SizedBox(height: 8),

//             // Leave Type Dropdown
//             DropdownButtonFormField<String>(
//               value: selectedLeaveType,
//               hint: const Text("Choose Leave Type"),
//               items: ['Casual Leave', 'Sick Leave', 'Planned Leave']
//                   .map((type) => DropdownMenuItem(value: type, child: Text(type)))
//                   .toList(),
//               onChanged: (value) {
//                 setState(() => selectedLeaveType = value);
//               },
//               decoration: const InputDecoration(
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 12),

//             // Cause
//             TextFormField(
//               controller: causeController,
//               decoration: const InputDecoration(
//                 labelText: "Cause",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 12),

//             // From Date
//             TextFormField(
//               controller: fromDateController,
//               readOnly: true,
//               onTap: () => _selectDate(fromDateController),
//               decoration: const InputDecoration(
//                 labelText: "From Date",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 12),

//             // To Date
//             TextFormField(
//               controller: toDateController,
//               readOnly: true,
//               onTap: () => _selectDate(toDateController),
//               decoration: const InputDecoration(
//                 labelText: "To Date",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 12),

//             // Apply leave count
//             TextFormField(
//               controller: leaveFormatController,
//               decoration: const InputDecoration(
//                 labelText: "Apply leave count 0",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 12),

//             // Capture image button
//             const Text("Capture Image"),
//             const SizedBox(height: 8),
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Camera integration
//               },
//               style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
//               child: const Text("Capture"),
//             ),
//             const SizedBox(height: 20),

//             // Submit button
//             ElevatedButton(
//               onPressed: () {
//                 // TODO: Submit logic
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.black,
//               ),
//               child: const Text("Submit"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// 🎨 Color constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class ApplyLeaveFormPage extends StatefulWidget {
  const ApplyLeaveFormPage({super.key});

  @override
  State<ApplyLeaveFormPage> createState() => _ApplyLeaveFormPageState();
}

class _ApplyLeaveFormPageState extends State<ApplyLeaveFormPage> {
  String leaveType = 'Leave';
  String? selectedLeaveType;
  final TextEditingController causeController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController leaveFormatController = TextEditingController();

  DateTime? fromDate;
  DateTime? toDate;

  Future<void> _selectDate(TextEditingController controller, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
      if (isFromDate) {
        fromDate = picked;
      } else {
        toDate = picked;
      }
    }
  }

  Future<void> submitLeaveForm() async {
    final url = Uri.parse("http://localhost:4000/api/requests/leave");

    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'employeeName': "Padma", // Or use a controller if name is input
        'leaveType': selectedLeaveType ?? '',
        'fromDate': fromDate?.toIso8601String() ?? '',
        'toDate': toDate?.toIso8601String() ?? '',
        'reason': causeController.text,
        'leaveCount': leaveFormatController.text,
        'category': leaveType, // "Leave" or "Comp off"
      }),
    );

    if (response.statusCode == 200) {
      print("✅ Leave submitted successfully!");
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Leave submitted!")),
      );
    } else {
      print("❌ Error: ${response.body}");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Error: ${response.body}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply Leave"),
        backgroundColor: kAppBarColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              // Radio toggle
              Row(
                children: [
                  Radio(
                    value: 'Leave',
                    groupValue: leaveType,
                    onChanged: (value) {
                      setState(() => leaveType = value.toString());
                    },
                  ),
                  const Text("Leave"),
                  Radio(
                    value: 'Comp off',
                    groupValue: leaveType,
                    onChanged: (value) {
                      setState(() => leaveType = value.toString());
                    },
                  ),
                  const Text("Comp off"),
                ],
              ),
              const SizedBox(height: 8),

              // Leave Type Dropdown
              DropdownButtonFormField<String>(
                value: selectedLeaveType,
                hint: const Text("Choose Leave Type"),
                items: ['Casual Leave', 'Sick Leave', 'Planned Leave']
                    .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedLeaveType = value);
                },
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              // Cause
              TextFormField(
                controller: causeController,
                decoration: const InputDecoration(
                  labelText: "Cause",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              // From Date
              TextFormField(
                controller: fromDateController,
                readOnly: true,
                onTap: () => _selectDate(fromDateController, true),
                decoration: const InputDecoration(
                  labelText: "From Date",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              // To Date
              TextFormField(
                controller: toDateController,
                readOnly: true,
                onTap: () => _selectDate(toDateController, false),
                decoration: const InputDecoration(
                  labelText: "To Date",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),

              // Leave count
              TextFormField(
                controller: leaveFormatController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Apply leave count",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),

              // Capture image (optional feature)
              const Text("Capture Image"),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {
                  // TODO: Add camera logic
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                ),
                child: const Text("Capture", style: TextStyle(color: kTextColor)),
              ),
              const SizedBox(height: 20),

              // Submit Button
              ElevatedButton(
                onPressed: submitLeaveForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                ),
                child: const Text("Submit", style: TextStyle(color: kTextColor)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}