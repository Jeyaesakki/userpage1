



// import 'package:flutter/material.dart';
// import 'package:serv_app/Pagesadmin/AddGroupNameDialog.dart';

// // Optional: move these to your theme file
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class CreateShiftPage extends StatefulWidget {
//   const CreateShiftPage({super.key});

//   @override
//   State<CreateShiftPage> createState() => _CreateShiftPageState();
// }

// class _CreateShiftPageState extends State<CreateShiftPage> {
//   final TextEditingController _shiftNameController = TextEditingController();
//   final TextEditingController _groupNameController = TextEditingController();

//   TimeOfDay? _startTime;
//   TimeOfDay? _endTime;

//   bool _extraTimeManagement = false;
//   String? _breakConfig;

//   Future<void> _pickTime(bool isStart) async {
//     final picked = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isStart) {
//           _startTime = picked;
//         } else {
//           _endTime = picked;
//         }
//       });
//     }
//   }

//   void _submitForm() {
//     if (_shiftNameController.text.isEmpty ||
//         _groupNameController.text.isEmpty ||
//         _startTime == null ||
//         _endTime == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please fill all required fields")),
//       );
//       return;
//     }

//     final shiftData = {
//       "shiftName": _shiftNameController.text.trim(),
//       "startTime": _startTime!.format(context),
//       "endTime": _endTime!.format(context),
//       "groupName": _groupNameController.text.trim(),
//       "extraTime": _extraTimeManagement.toString(),
//       "breakConfig": _breakConfig ?? "",
//     };

//     debugPrint("Shift Data: $shiftData");

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Shift created successfully")),
//     );

//     Navigator.pop(context, shiftData);
//   }

//   void _openGroupNameDialog() async {
//     final selectedGroupName = await showDialog<String>(
//       context: context,
//       builder: (context) => const AddGroupNameDialog(),
//     );

//     if (selectedGroupName != null) {
//       setState(() {
//         _groupNameController.text = selectedGroupName;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: true,
//       appBar: AppBar(
//         backgroundColor: kAppBarColor,
//         title: const Text("Create Shift"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SafeArea(
//         child: GestureDetector(
//           onTap: () => FocusScope.of(context).unfocus(),
//           child: SingleChildScrollView(
//             padding: const EdgeInsets.all(16),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Shift Name
                
//                 const SizedBox(height: 6),
//                 TextField(
//                   controller: _shiftNameController,
//                   decoration: const InputDecoration(
//                     labelText: "Shift Name",
                   
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Time Pickers
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text("Start Time", style: TextStyle(fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 6),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(backgroundColor: kButtonColor),
//                             onPressed: () => _pickTime(true),
//                             child: Text(
//                               _startTime == null ? "Start Time" : _startTime!.format(context),
//                               style: const TextStyle(color: kTextColor),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text("End Time", style: TextStyle(fontWeight: FontWeight.bold)),
//                           const SizedBox(height: 6),
//                           ElevatedButton(
//                             style: ElevatedButton.styleFrom(backgroundColor: kButtonColor),
//                             onPressed: () => _pickTime(false),
//                             child: Text(
//                               _endTime == null ? "End Time" : _endTime!.format(context),
//                               style: const TextStyle(color: kTextColor),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 16),

//                 // Group Name
                
//                 const SizedBox(height: 6),
//                 GestureDetector(
//                   onTap: _openGroupNameDialog,
//                   child: AbsorbPointer(
//                     child: TextField(
//                       controller: _groupNameController,
//                       decoration: const InputDecoration(
//                         labelText: "Group Name",
//                         hintText: "Shift Group Name",
//                         border: OutlineInputBorder(),
//                         suffixIcon: Icon(Icons.arrow_drop_down),
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 16),

//                 // Checkbox
//                 CheckboxListTile(
//                   contentPadding: EdgeInsets.zero,
//                   title: const Text("Extra Time Management", style: TextStyle(fontWeight: FontWeight.bold)),
//                   value: _extraTimeManagement,
//                   onChanged: (value) {
//                     setState(() {
//                       _extraTimeManagement = value!;
//                     });
//                   },
//                 ),
//                 const SizedBox(height: 10),

//                 // Radio
//                 const Text("Break Configuration", style: TextStyle(fontWeight: FontWeight.bold)),
//                 Row(
//                   children: [
//                     Radio<String>(
//                       value: "Define",
//                       groupValue: _breakConfig,
//                       onChanged: (value) => setState(() => _breakConfig = value),
//                     ),
//                     const Text("Define Break"),
//                     const SizedBox(width: 20),
//                     Radio<String>(
//                       value: "Flexible",
//                       groupValue: _breakConfig,
//                       onChanged: (value) => setState(() => _breakConfig = value),
//                     ),
//                     const Text("Flexible Break"),
//                   ],
//                 ),
//                 const SizedBox(height: 24),

//                 // Submit
//                 Center(
//                   child: ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kButtonColor,
//                       padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
//                     ),
//                     onPressed: _submitForm,
//                     child: const Text("Submit", style: TextStyle(color: kTextColor)),
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
import 'package:serv_app/Pagesadmin/AddGroupNameDialog.dart';

// App-wide theme colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF); // White
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9); // Light purple
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class CreateShiftPage extends StatefulWidget {
  const CreateShiftPage({super.key});

  @override
  State<CreateShiftPage> createState() => _CreateShiftPageState();
}

class _CreateShiftPageState extends State<CreateShiftPage> {
  final TextEditingController _shiftNameController = TextEditingController();
  final TextEditingController _groupNameController = TextEditingController();

  TimeOfDay? _startTime;
  TimeOfDay? _endTime;

  bool _extraTimeManagement = false;
  String? _breakConfig;

  Future<void> _pickTime(bool isStart) async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          _startTime = picked;
        } else {
          _endTime = picked;
        }
      });
    }
  }

  void _submitForm() {
    if (_shiftNameController.text.isEmpty ||
        _groupNameController.text.isEmpty ||
        _startTime == null ||
        _endTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill all required fields")),
      );
      return;
    }

    final shiftData = {
      "shiftName": _shiftNameController.text.trim(),
      "startTime": _startTime!.format(context),
      "endTime": _endTime!.format(context),
      "groupName": _groupNameController.text.trim(),
      "extraTime": _extraTimeManagement.toString(),
      "breakConfig": _breakConfig ?? "",
    };

    debugPrint("Shift Data: $shiftData");

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text("Shift created successfully")),
    );

    Navigator.pop(context, shiftData);
  }

  void _openGroupNameDialog() async {
    final selectedGroupName = await showDialog<String>(
      context: context,
      builder: (context) => const AddGroupNameDialog(),
    );

    if (selectedGroupName != null) {
      setState(() {
        _groupNameController.text = selectedGroupName;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: const Text("Create Shift"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
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
                  const SizedBox(height: 6),
                  TextField(
                    controller: _shiftNameController,
                    decoration: const InputDecoration(
                      labelText: "Shift Name",
                      hintText: "Shift Name",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Start Time", style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: kButtonColor),
                              onPressed: () => _pickTime(true),
                              child: Text(
                                _startTime == null ? "Start Time" : _startTime!.format(context),
                                style: const TextStyle(color: kTextColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("End Time", style: TextStyle(fontWeight: FontWeight.bold)),
                            const SizedBox(height: 6),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(backgroundColor: kButtonColor),
                              onPressed: () => _pickTime(false),
                              child: Text(
                                _endTime == null ? "End Time" : _endTime!.format(context),
                                style: const TextStyle(color: kTextColor),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  const SizedBox(height: 6),
                  GestureDetector(
                    onTap: _openGroupNameDialog,
                    child: AbsorbPointer(
                      child: TextField(
                        controller: _groupNameController,
                        decoration: const InputDecoration(
                          labelText: "Group Name",
                          hintText: "Shift Group Name",
                          border: OutlineInputBorder(),
                          suffixIcon: Icon(Icons.arrow_drop_down),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  CheckboxListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text("Extra Time Management", style: TextStyle(fontWeight: FontWeight.bold)),
                    value: _extraTimeManagement,
                    onChanged: (value) {
                      setState(() {
                        _extraTimeManagement = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  const Text("Break Configuration", style: TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Wrap(
                    crossAxisAlignment: WrapCrossAlignment.center,
                    spacing: 10,
                    runSpacing: 8,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: "Define",
                            groupValue: _breakConfig,
                            onChanged: (value) => setState(() => _breakConfig = value),
                          ),
                          const Text("Define Break"),
                        ],
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Radio<String>(
                            value: "Flexible",
                            groupValue: _breakConfig,
                            onChanged: (value) => setState(() => _breakConfig = value),
                          ),
                          const Text("Flexible Break"),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                      ),
                      onPressed: _submitForm,
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
}
