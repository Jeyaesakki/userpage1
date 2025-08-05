// // leave_approvals_screen.dart
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'leave_data.dart';
// import 'leave_card.dart';

// class LeaveApprovalsScreen extends StatefulWidget {
//   const LeaveApprovalsScreen({super.key});

//   @override
//   State<LeaveApprovalsScreen> createState() => _LeaveApprovalsScreenState();
// }

// class _LeaveApprovalsScreenState extends State<LeaveApprovalsScreen> {
//   String selectedTab = 'All';
//   String selectedStatusFilter = 'All';
//   final TextEditingController searchController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     final today = DateFormat('dd MMM yyyy').format(DateTime.now());

//     List<Map<String, dynamic>> filtered = allLeaveRequests
//         .where((leave) => selectedTab == 'All' || leave['type'] == selectedTab)
//         .where((leave) => selectedStatusFilter == 'All' || leave['status'] == selectedStatusFilter.toLowerCase())
//         .where((leave) => leave.values.any((v) => v.toString().toLowerCase().contains(searchController.text.toLowerCase())))
//         .toList();

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF8C6EAF),
//         title: const Text("Leave Approvals"),
//         actions: [
//           Padding(
//             padding: const EdgeInsets.all(12),
//             child: Center(child: Text(today)),
//           ),
//         ],
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(10),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFFFFF), Color(0xFFD1C4E9)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           children: [
//             // 🔁 Scrollable Row with Dropdown + Buttons
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   DropdownButton<String>(
//                     value: selectedTab,
//                     onChanged: (val) => setState(() => selectedTab = val!),
//                     items: [
//                       'All',
//                       'Leave Type',
//                       'Permission',
//                       'Over Time',
//                       'Half Day Leave',
//                       'Comp Off'
//                     ].map((type) => DropdownMenuItem(value: type, child: Text(type))).toList(),
//                   ),
//                   const SizedBox(width: 10),
//                   _buildStatusButton("Pending", Colors.pink[100]!),
//                   const SizedBox(width: 6),
//                   _buildStatusButton("Approved", Colors.greenAccent),
//                   const SizedBox(width: 6),
//                   _buildStatusButton("Rejected", Colors.red[200]!),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),

//             // 🔍 Search bar
//             TextField(
//               controller: searchController,
//               onChanged: (_) => setState(() {}),
//               decoration: InputDecoration(
//                 hintText: 'Search...',
//                 prefixIcon: const Icon(Icons.search),
//                 filled: true,
//                 fillColor: Colors.white,
//                 border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//             ),
//             const SizedBox(height: 10),

//             // 📝 List of Leave Cards
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filtered.length,
//                 itemBuilder: (context, index) {
//                   final leave = filtered[index];
//                   return LeaveCard(
//                     item: leave,
//                     onStatusChange: (status) {
//                       setState(() {
//                         leave['status'] = status;
//                       });
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // 🔘 Status Button Widget
//   Widget _buildStatusButton(String label, Color color) {
//     return GestureDetector(
//       onTap: () => setState(() => selectedStatusFilter = label),
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(14),
//           border: Border.all(color: Colors.black),
//         ),
//         child: Text(
//           "$label (${_getCount(label.toLowerCase())})",
//           style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
//         ),
//       ),
//     );
//   }

//   // 🔢 Count logic
//   int _getCount(String status) {
//     return allLeaveRequests
//         .where((e) => (selectedTab == 'All' || e['type'] == selectedTab) && e['status'] == status)
//         .length;
//   }
// }



import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'leave_data.dart';
import 'leave_card.dart';

class LeaveApprovalsScreen extends StatefulWidget {
  const LeaveApprovalsScreen({super.key});

  @override
  State<LeaveApprovalsScreen> createState() => _LeaveApprovalsScreenState();
}

class _LeaveApprovalsScreenState extends State<LeaveApprovalsScreen> {
  String selectedTab = 'All';
  String selectedStatusFilter = 'All';
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final today = DateFormat('dd MMM yyyy').format(DateTime.now());

    List<Map<String, dynamic>> filtered = allLeaveRequests
        .where((leave) => selectedTab == 'All' || leave['type'] == selectedTab)
        .where((leave) =>
            selectedStatusFilter == 'All' ||
            leave['status'] == selectedStatusFilter.toLowerCase())
        .where((leave) => leave.values.any((v) => v
            .toString()
            .toLowerCase()
            .contains(searchController.text.toLowerCase())))
        .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8C6EAF),
        title: const Text("Leave Approvals"),
        actions: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Center(child: Text(today)),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFD1C4E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // 🔁 Horizontal scroll for filters (overflow fixed)
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    height: 30,
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    margin: const EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple[100],
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.black),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        value: selectedTab,
                        onChanged: (val) => setState(() => selectedTab = val!),
                        icon: const Icon(Icons.arrow_drop_down,
                            size: 18, color: Colors.black),
                        style: const TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                            fontWeight: FontWeight.w500),
                        dropdownColor: Colors.white,
                        isDense: true,
                        isExpanded: false,
                        items: [
                          'All',
                          'Late check in',
                          'Late check out',
                          'Leave Type',
                          'Permission',
                          'Over Time',
                          'Half Day Leave',
                          'Comp Off'
                        ]
                            .map((type) => DropdownMenuItem(
                                  value: type,
                                  child: Text(type),
                                ))
                            .toList(),
                      ),
                    ),
                  ),
                  _buildStatusButton("Pending", Colors.pink[100]!),
                  const SizedBox(width: 6),
                  _buildStatusButton("Approved", Colors.greenAccent),
                  const SizedBox(width: 6),
                  _buildStatusButton("Rejected", Colors.red[200]!),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // 🔍 Search bar
            TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // 📝 Leave card list
            Expanded(
              child: ListView.builder(
                itemCount: filtered.length,
                itemBuilder: (context, index) {
                  final leave = filtered[index];
                  return LeaveCard(
                    item: leave,
                    onStatusChange: (status) {
                      setState(() {
                        leave['status'] = status;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🔘 Filter button with count
  Widget _buildStatusButton(String label, Color color) {
    return GestureDetector(
      onTap: () => setState(() => selectedStatusFilter = label),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          "$label (${_getCount(label.toLowerCase())})",
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 11),
        ),
      ),
    );
  }

  // 🔢 Count for each filter button
  int _getCount(String status) {
    return allLeaveRequests
        .where((e) =>
            (selectedTab == 'All' || e['type'] == selectedTab) &&
            e['status'] == status)
        .length;
  }
}