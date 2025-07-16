// import 'package:flutter/material.dart';

// class WorkdaysShiftPage extends StatefulWidget {
//   const WorkdaysShiftPage({super.key});

//   @override
//   State<WorkdaysShiftPage> createState() => _WorkdaysShiftPageState();
// }

// class _WorkdaysShiftPageState extends State<WorkdaysShiftPage> {
//   static const List<Map<String, String>> shiftTemplates = [
//     {"title": "Template 1", "time": "9:30 AM - 6:30 PM"},
//     {"title": "Template 2", "time": "07:30 AM - 03:30 PM"},
//     {"title": "Template 3", "time": "12:30 AM - 11:45 AM"},
//   ];

//   final shiftNameController = TextEditingController();
//   final groupNameController = TextEditingController();
//   final newGroupNameController = TextEditingController();
//   TimeOfDay? startTime;
//   TimeOfDay? endTime;
//   bool extraTime = false;
//   String breakType = "Define Break";
//   List<String> groupNames = ['PP Shift 2', 'ODC Shift 1', 'General Shift 1'];

//   final permissionNameController = TextEditingController();
//   final permissionHoursController = TextEditingController();
//   String permissionEligibility = '';
//   List<Map<String, String>> permissions = [
//     {"name": "Emergency", "hours": "02.00", "eligibility": "Monthly"},
//   ];

//   void _showAddGroupPopup() {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Add Group Name", style: TextStyle(fontWeight: FontWeight.bold)),
//                     IconButton(
//                       icon: const Icon(Icons.close),
//                       onPressed: () => Navigator.of(context).pop(),
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 const Text("Group Name *"),
//                 const SizedBox(height: 5),
//                 TextField(
//                   controller: newGroupNameController,
//                   decoration: const InputDecoration(
//                     hintText: "Group name",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     TextButton(
//                       onPressed: () => Navigator.of(context).pop(),
//                       child: const Text("Cancel"),
//                     ),
//                     ElevatedButton(
//                       onPressed: () {
//                         final name = newGroupNameController.text.trim();
//                         if (name.isNotEmpty) {
//                           setState(() {
//                             groupNames.add(name);
//                             groupNameController.text = name;
//                           });
//                           newGroupNameController.clear();
//                           Navigator.of(context).pop();
//                         }
//                       },
//                       child: const Text("ADD"),
//                     ),
//                   ],
//                 ),
//                 const Divider(),
//                 const Text("Group Name", style: TextStyle(fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 5),
//                 ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: groupNames.length,
//                   itemBuilder: (context, index) {
//                     return ListTile(
//                       title: Text(groupNames[index]),
//                       trailing: IconButton(
//                         icon: const Icon(Icons.edit),
//                         onPressed: () {},
//                       ),
//                     );
//                   },
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showCreateShiftPopup() {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: Padding(
//           padding: const EdgeInsets.all(16),
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisSize: MainAxisSize.min,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text("Shift Name *", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
//                 const SizedBox(height: 4),
//                 TextField(
//                   controller: shiftNameController,
//                   decoration: const InputDecoration(
//                     hintText: "Shift Name",
//                     border: OutlineInputBorder(),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text("Start Time *", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
//                           const SizedBox(height: 4),
//                           InkWell(
//                             onTap: () async {
//                               final picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
//                               if (picked != null) setState(() => startTime = picked);
//                             },
//                             child: Container(
//                               height: 45,
//                               padding: const EdgeInsets.symmetric(horizontal: 10),
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               alignment: Alignment.centerLeft,
//                               child: Text(startTime?.format(context) ?? "Start Time"),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           const Text("End Time *", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
//                           const SizedBox(height: 4),
//                           InkWell(
//                             onTap: () async {
//                               final picked = await showTimePicker(context: context, initialTime: TimeOfDay.now());
//                               if (picked != null) setState(() => endTime = picked);
//                             },
//                             child: Container(
//                               height: 45,
//                               padding: const EdgeInsets.symmetric(horizontal: 10),
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: Colors.grey),
//                                 borderRadius: BorderRadius.circular(5),
//                               ),
//                               alignment: Alignment.centerLeft,
//                               child: Text(endTime?.format(context) ?? "End Time"),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 12),
//                 const Text("Group Name *", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
//                 const SizedBox(height: 4),
//                 InkWell(
//                   onTap: _showAddGroupPopup,
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 14),
//                     decoration: BoxDecoration(
//                       border: Border.all(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(5),
//                     ),
//                     child: Text(
//                       groupNameController.text.isEmpty ? "Select or Add Group" : groupNameController.text,
//                       style: const TextStyle(fontSize: 16),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 12),
//                 Row(
//                   children: [
//                     Checkbox(value: extraTime, onChanged: (val) => setState(() => extraTime = val ?? false)),
//                     const Text("Extra Time Management"),
//                   ],
//                 ),
// const Text("Break Configuration", style: TextStyle(fontWeight: FontWeight.bold)),
// const SizedBox(height: 8),
// SingleChildScrollView(
//   scrollDirection: Axis.horizontal,
//   child: Row(
//     children: [
//       Radio<String>(
//         value: "Define Break",
//         groupValue: breakType,
//         onChanged: (val) => setState(() => breakType = val!),
//       ),
//       const Text("Define Break"),
//       const SizedBox(width: 20),
//       Radio<String>(
//         value: "Flexible Break",
//         groupValue: breakType,
//         onChanged: (val) => setState(() => breakType = val!),
//       ),
//       const Text("Flexible Break"),
//     ],
//   ),
// ),


//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _showShiftPermissionPopup() {
//     showDialog(
//       context: context,
//       builder: (context) => Dialog(
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         child: StatefulBuilder(
//           builder: (context, setModalState) {
//             return Padding(
//               padding: const EdgeInsets.all(16),
//               child: SingleChildScrollView(
//                 child: Column(
//                   mainAxisSize: MainAxisSize.min,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     const Text("Shift Permissions", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//                     const SizedBox(height: 12),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: TextField(
//                             controller: permissionNameController,
//                             decoration: const InputDecoration(
//                               labelText: "Permission Name",
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                         ),
//                         const SizedBox(width: 10),
//                         Expanded(
//                           child: TextField(
//                             controller: permissionHoursController,
//                             decoration: const InputDecoration(
//                               labelText: "No. of Hours",
//                               border: OutlineInputBorder(),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 10),
//                     DropdownButtonFormField<String>(
//                       value: permissionEligibility.isEmpty ? null : permissionEligibility,
//                       decoration: const InputDecoration(
//                         labelText: "Eligibility",
//                         border: OutlineInputBorder(),
//                       ),
//                       items: ["Weekly", "Monthly"]
//                           .map((e) => DropdownMenuItem(value: e, child: Text(e)))
//                           .toList(),
//                       onChanged: (val) => setModalState(() => permissionEligibility = val ?? ''),
//                     ),
//                     const SizedBox(height: 10),
//                     Align(
//                       alignment: Alignment.centerRight,
//                       child: ElevatedButton(
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: Colors.blue,
//                           foregroundColor: Colors.white,
//                         ),
//                         onPressed: () {
//                           if (permissionNameController.text.isNotEmpty &&
//                               permissionHoursController.text.isNotEmpty &&
//                               permissionEligibility.isNotEmpty) {
//                             setModalState(() {
//                               permissions.add({
//                                 "name": permissionNameController.text,
//                                 "hours": permissionHoursController.text,
//                                 "eligibility": permissionEligibility,
//                               });
//                               permissionNameController.clear();
//                               permissionHoursController.clear();
//                               permissionEligibility = '';
//                             });
//                           }
//                         },
//                         child: const Text("Add Permission"),
//                       ),
//                     ),
//                     const Divider(),
//                     ListView.builder(
//                       shrinkWrap: true,
//                       physics: const NeverScrollableScrollPhysics(),
//                       itemCount: permissions.length,
//                       itemBuilder: (context, index) {
//                         final perm = permissions[index];
//                         return ListTile(
//                           title: Text(perm['name'] ?? ''),
//                           subtitle: Text("${perm['hours']} hrs - ${perm['eligibility']}"),
//                         );
//                       },
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }

//   static Widget _templateBox(String title, String time) {
//     return Container(
//       width: 110,
//       padding: const EdgeInsets.all(8),
//       decoration: BoxDecoration(
//         color: Colors.pink.shade100,
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: Colors.grey.shade400),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//           const SizedBox(height: 4),
//           Text(time, style: const TextStyle(fontSize: 11)),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F1F1),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: const Text("Workdays & Shifts", style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600)),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             const Text("Shift Configuration", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 6),
//             const Text("Choose your Shift", style: TextStyle(color: Colors.grey)),
//             const SizedBox(height: 16),
//             SizedBox(
//               height: 100,
//               child: ListView.separated(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: shiftTemplates.length,
//                 separatorBuilder: (_, __) => const SizedBox(width: 10),
//                 itemBuilder: (context, index) {
//                   final template = shiftTemplates[index];
//                   return _templateBox(template['title']!, template['time']!);
//                 },
//               ),
//             ),
//             const SizedBox(height: 20),
//             Wrap(
//               spacing: 10,
//               runSpacing: 10,
//               children: [
//                 ElevatedButton(
//                   onPressed: _showShiftPermissionPopup,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 227, 229, 231),
//                     foregroundColor: Colors.black,
//                   ),
//                   child: const Text("Shift Permissions"),
//                 ),
//                 ElevatedButton(
//                   onPressed: _showCreateShiftPopup,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color.fromARGB(255, 227, 229, 231),
//                     foregroundColor: Colors.black,
//                   ),
//                   child: const Text("Create Shift"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'create_shift_page.dart';
import 'shift_permission_page.dart';

class WorkdaysShiftPage extends StatefulWidget {
  const WorkdaysShiftPage({super.key});

  @override
  State<WorkdaysShiftPage> createState() => _WorkdaysShiftPageState();
}

class _WorkdaysShiftPageState extends State<WorkdaysShiftPage> {
  bool _isShiftPermissionClicked = false;
  bool _isCreateShiftClicked = false;

  List<Map<String, String>> _createdShifts = [];
  // Holds dynamic shift data

  void _navigateToShiftPermission(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ShiftPermissionPage()),
    );
  }

  void _navigateToCreateShift(BuildContext context) async {
    final result = await Navigator.push<Map<String, String>>(
      context,
      MaterialPageRoute(builder: (context) => const CreateShiftPage()),
    );

    if (result != null) {
      setState(() {
        _createdShifts.add(result); // Add new shift to the list
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Workdays & Shifts")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Shift Configuration",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const Text(
              "Choose your shift",
              style: TextStyle(fontSize: 14, color: Colors.black54),
            ),
            const SizedBox(height: 16),

            const _ShiftTemplateCard(
              title: "Template 1",
              time: "09:30 AM - 06:30 PM",
            ),
            const SizedBox(height: 10),
            const _ShiftTemplateCard(
              title: "Template 2",
              time: "07:30 AM - 04:30 PM",
            ),
            const SizedBox(height: 10),
            const _ShiftTemplateCard(
              title: "Template 3",
              time: "12:30 AM - 11:59 PM",
            ),

            const SizedBox(height: 10),
            for (int i = 0; i < _createdShifts.length; i++) ...[
              _ShiftTemplateCard(
                title:
                    "Template ${i + 4}: ${_createdShifts[i]["shiftName"] ?? "Shift"}",
                time:
                    "${_createdShifts[i]["startTime"]} - ${_createdShifts[i]["endTime"]}",
              ),
              const SizedBox(height: 10),
            ],

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: _isShiftPermissionClicked
                        ? Colors.blueAccent
                        : Colors.transparent,
                    foregroundColor: _isShiftPermissionClicked
                        ? Colors.white
                        : Colors.black,
                    side: const BorderSide(color: Colors.blueAccent),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _isShiftPermissionClicked = true;
                      _isCreateShiftClicked = false;
                    });
                    _navigateToShiftPermission(context);
                  },
                  child: const Text("Shift Permissions"),
                ),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: _isCreateShiftClicked
                        ? Colors.teal
                        : Colors.transparent,
                    foregroundColor: _isCreateShiftClicked
                        ? Colors.white
                        : Colors.black,
                    side: const BorderSide(color: Colors.teal),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 24,
                      vertical: 14,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      _isCreateShiftClicked = true;
                      _isShiftPermissionClicked = false;
                    });
                    _navigateToCreateShift(context);
                  },
                  child: const Text("Create Shift"),
                ),
              ],
            ),

            const SizedBox(height: 30),
            _buildTableHeader(),
            const Divider(),
            _buildTableFooter(),
          ],
        ),
      ),
    );
  }

  Widget _buildTableHeader() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _HeaderCell("Shift Name"),
          _HeaderCell("Start Time"),
          _HeaderCell("End Time"),
          _HeaderCell("No. of hours"),
          _HeaderCell("OT(mins)"),
          _HeaderCell("Half Day Time"),
          _HeaderCell("Min PT"),
          _HeaderCell("Max PT"),
          _HeaderCell("Max OT"),
          _HeaderCell("Min OT"),
          _HeaderCell("Group Name"),
          _HeaderCell("Random count"),
          _HeaderCell("End BufferName"),
          _HeaderCell("Staff BufferName"),
          _HeaderCell("Group Name"),
          _HeaderCell("Break Count"),
          _HeaderCell("Delete"),
        ],
      ),
    );
  }

  Widget _buildTableFooter() {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(children: []),
    );
  }
}

class _ShiftTemplateCard extends StatelessWidget {
  final String title;
  final String time;

  const _ShiftTemplateCard({required this.title, required this.time});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink.shade100,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        width: double.infinity,
        height: 70,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
              const Spacer(),
              Text(
                time,
                style: const TextStyle(fontSize: 12),
                textAlign: TextAlign.right,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderCell extends StatelessWidget {
  final String label;

  const _HeaderCell(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        label,
        textAlign: TextAlign.center,
        style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
      ),
    );
  }
}