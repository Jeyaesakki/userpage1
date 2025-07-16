// import 'package:flutter/material.dart';

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
//   String? _breakConfig; // "Define" or "Flexible"

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

//     Navigator.pop(context, shiftData); // 🔥 Send data back to previous screen
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
//       appBar: AppBar(
//         title: const Text("Create Shift"),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Shift Name *", style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 6),
//             TextField(
//               controller: _shiftNameController,
//               decoration: const InputDecoration(
//                 hintText: "Shift Name",
//                 border: OutlineInputBorder(),
//               ),
//             ),
//             const SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("Start Time *", style: TextStyle(fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 6),
//                       ElevatedButton(
//                         onPressed: () => _pickTime(true),
//                         child: Text(
//                           _startTime == null
//                               ? "Start Time"
//                               : _startTime!.format(context),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(width: 12),
//                 Expanded(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text("End Time *", style: TextStyle(fontWeight: FontWeight.bold)),
//                       const SizedBox(height: 6),
//                       ElevatedButton(
//                         onPressed: () => _pickTime(false),
//                         child: Text(
//                           _endTime == null
//                               ? "End Time"
//                               : _endTime!.format(context),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//             const SizedBox(height: 16),
//             const Text("Group Name *", style: TextStyle(fontWeight: FontWeight.bold)),
//             const SizedBox(height: 6),
//             GestureDetector(
//               onTap: _openGroupNameDialog,
//               child: AbsorbPointer(
//                 child: TextField(
//                   controller: _groupNameController,
//                   decoration: const InputDecoration(
//                     hintText: "Shift Group Name",
//                     border: OutlineInputBorder(),
//                     suffixIcon: Icon(Icons.arrow_drop_down),
//                   ),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 16),
//             CheckboxListTile(
//               contentPadding: EdgeInsets.zero,
//               title: const Text("Extra Time Management", style: TextStyle(fontWeight: FontWeight.bold)),
//               value: _extraTimeManagement,
//               onChanged: (value) {
//                 setState(() {
//                   _extraTimeManagement = value!;
//                 });
//               },
//             ),
//             const SizedBox(height: 10),
//             const Text("Break Configuration", style: TextStyle(fontWeight: FontWeight.bold)),
//             Row(
//               children: [
//                 Radio<String>(
//                   value: "Define",
//                   groupValue: _breakConfig,
//                   onChanged: (value) => setState(() => _breakConfig = value),
//                 ),
//                 const Text("Define Break"),
//                 const SizedBox(width: 20),
//                 Radio<String>(
//                   value: "Flexible",
//                   groupValue: _breakConfig,
//                   onChanged: (value) => setState(() => _breakConfig = value),
//                 ),
//                 const Text("Flexible Break"),
//               ],
//             ),
//             const SizedBox(height: 24),
//             Center(
//               child: ElevatedButton(
//                 onPressed: _submitForm,
//                 child: const Text("Submit"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AddGroupNameDialog extends StatefulWidget {
//   const AddGroupNameDialog({super.key});

//   @override
//   State<AddGroupNameDialog> createState() => _AddGroupNameDialogState();
// }

// class _AddGroupNameDialogState extends State<AddGroupNameDialog> {
//   final TextEditingController _groupNameController = TextEditingController();
//   final List<String> _groupList = [
//     "PY Shift 2",
//     "GDC Shift 1",
//     "General Shift 2",
//     "Shift",
//     "General Shift",
//   ];

//   void _deleteGroup(int index) {
//     setState(() {
//       _groupList.removeAt(index);
//     });
//   }

//   void _editGroup(int index) {
//     _groupNameController.text = _groupList[index];
//     _deleteGroup(index);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Dialog(
//       insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: ConstrainedBox(
//         constraints: const BoxConstraints(maxHeight: 500),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   const Text(
//                     "Add Group Name",
//                     style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
//                   ),
//                   IconButton(
//                     icon: const Icon(Icons.close),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 10),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: const Text(
//                   "Group Name *",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 6),
//               TextField(
//                 controller: _groupNameController,
//                 decoration: const InputDecoration(
//                   hintText: "Group name",
//                   border: OutlineInputBorder(),
//                 ),
//               ),
//               const SizedBox(height: 14),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey.shade300,
//                     ),
//                     onPressed: () => Navigator.pop(context),
//                     child: const Text(
//                       "Cancel",
//                       style: TextStyle(color: Colors.black),
//                     ),
//                   ),
//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.teal,
//                     ),
//                     onPressed: () {
//                       final selected = _groupNameController.text.trim();
//                       if (selected.isNotEmpty) {
//                         Navigator.pop(context, selected);
//                       }
//                     },
//                     child: const Text("ADD"),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 20),
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: Colors.grey.shade200,
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: const Text(
//                   "Group Name",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//               const SizedBox(height: 10),
//               ListView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 itemCount: _groupList.length,
//                 itemBuilder: (context, index) {
//                   final name = _groupList[index];
//                   return ListTile(
//                     dense: true,
//                     title: Text(name),
//                     leading: const Icon(Icons.edit, size: 18),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete, size: 18),
//                       onPressed: () => _deleteGroup(index),
//                     ),
//                     onTap: () => _editGroup(index),
//                   );
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Keep the same imports
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: const Text("Create Shift"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Shift Name *", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            TextField(
              controller: _shiftNameController,
              decoration: const InputDecoration(
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
                      const Text("Start Time *", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () => _pickTime(true),
                        child: Text(
                          _startTime == null ? "Start Time" : _startTime!.format(context),
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
                      const Text("End Time *", style: TextStyle(fontWeight: FontWeight.bold)),
                      const SizedBox(height: 6),
                      ElevatedButton(
                        onPressed: () => _pickTime(false),
                        child: Text(
                          _endTime == null ? "End Time" : _endTime!.format(context),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const Text("Group Name *", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            GestureDetector(
              onTap: _openGroupNameDialog,
              child: AbsorbPointer(
                child: TextField(
                  controller: _groupNameController,
                  decoration: const InputDecoration(
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
            const SizedBox(height: 8),
            const Text("Break Configuration", style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 6),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Radio<String>(
                    value: "Define",
                    groupValue: _breakConfig,
                    onChanged: (value) => setState(() => _breakConfig = value),
                  ),
                  const Text("Define Break"),
                  const SizedBox(width: 20),
                  Radio<String>(
                    value: "Flexible",
                    groupValue: _breakConfig,
                    onChanged: (value) => setState(() => _breakConfig = value),
                  ),
                  const Text("Flexible Break"),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: const Text("Submit"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AddGroupNameDialog extends StatefulWidget {
  const AddGroupNameDialog({super.key});

  @override
  State<AddGroupNameDialog> createState() => _AddGroupNameDialogState();
}

class _AddGroupNameDialogState extends State<AddGroupNameDialog> {
  final TextEditingController _groupNameController = TextEditingController();
  final List<String> _groupList = [
    "PY Shift 2",
    "GDC Shift 1",
    "General Shift 2",
    "Shift",
    "General Shift",
  ];

  void _deleteGroup(int index) {
    setState(() {
      _groupList.removeAt(index);
    });
  }

  void _editGroup(int index) {
    _groupNameController.text = _groupList[index];
    _deleteGroup(index);
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: ConstrainedBox(
        constraints: const BoxConstraints(maxHeight: 500),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Add Group Name", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: const Text("Group Name *", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 6),
              TextField(
                controller: _groupNameController,
                decoration: const InputDecoration(
                  hintText: "Group name",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 14),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade300),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel", style: TextStyle(color: Colors.black)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.teal),
                    onPressed: () {
                      final selected = _groupNameController.text.trim();
                      if (selected.isNotEmpty) {
                        Navigator.pop(context, selected);
                      }
                    },
                    child: const Text("ADD"),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text("Group Name", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 10),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: _groupList.length,
                itemBuilder: (context, index) {
                  final name = _groupList[index];
                  return ListTile(
                    dense: true,
                    title: Text(name),
                    leading: const Icon(Icons.edit, size: 18),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete, size: 18),
                      onPressed: () => _deleteGroup(index),
                    ),
                    onTap: () => _editGroup(index),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
