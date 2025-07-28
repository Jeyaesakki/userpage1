


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// void main() => runApp(const MaterialApp(
//       home: LeaveApprovalsScreen(),
//       debugShowCheckedModeBanner: false,
//     ));

// class LeaveRequest {
//   String id;
//   String name;
//   String department;
//   String reason;
//   String status;
//   String date;

//   LeaveRequest({
//     required this.id,
//     required this.name,
//     required this.department,
//     required this.reason,
//     required this.date,
//     this.status = 'pending',
//   });
// }

// class LeaveApprovalsScreen extends StatefulWidget {
//   const LeaveApprovalsScreen({Key? key}) : super(key: key);

//   @override
//   State<LeaveApprovalsScreen> createState() => _LeaveApprovalsScreenState();
// }

// class _LeaveApprovalsScreenState extends State<LeaveApprovalsScreen> {
//   final List<LeaveRequest> _allLeaves = [
//     LeaveRequest(id: 'EMP001', name: 'Arun', department: 'IT', reason: 'Personal Work', date: '2025-07-10'),
//     LeaveRequest(id: 'EMP002', name: 'Divya', department: 'HR', reason: 'Fever', date: '2025-07-08'),
//     LeaveRequest(id: 'EMP003', name: 'Mohit', department: 'Finance', reason: 'Travel', date: '2025-07-05'),
//     LeaveRequest(id: 'EMP004', name: 'Nisha', department: 'Sales', reason: 'Function', date: '2025-07-11'),
//   ];

//   String _search = '';
//   String _statusFilter = 'all';

//   List<LeaveRequest> get _filteredLeaves {
//     var leaves = _allLeaves;

//     if (_search.isNotEmpty) {
//       leaves = leaves.where((e) =>
//           e.name.toLowerCase().contains(_search.toLowerCase()) ||
//           e.id.toLowerCase().contains(_search.toLowerCase())).toList();
//     }

//     if (_statusFilter != 'all') {
//       leaves = leaves.where((e) => e.status == _statusFilter).toList();
//     }

//     return leaves;
//   }

//   int get _pending => _allLeaves.where((e) => e.status == 'pending').length;
//   int get _approved => _allLeaves.where((e) => e.status == 'approved').length;
//   int get _rejected => _allLeaves.where((e) => e.status == 'rejected').length;

//   @override
//   Widget build(BuildContext context) {
//     String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundTop,
//       appBar: _buildAppBar(),
//       body: Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _headerRow(todayDate),
//             const SizedBox(height: 12),
//             _statusCounters(),
//             const SizedBox(height: 12),
//             _searchBar(),
//             const SizedBox(height: 10),
//             Expanded(child: _leaveList()),
//           ],
//         ),
//       ),
//     );
//   }

//   PreferredSizeWidget _buildAppBar() => AppBar(
 
//         title: const Text('Request and Leave Approvals'),
//       );
  
//   Widget _headerRow(String today) => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
          
//           const Text('Leave Approvals',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           Text(today,
//               style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
//         ],
//       );

//   Widget _statusCounters() => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _gotoStatus('all', _allLeaves.length, Colors.blue),
//           _gotoStatus('pending', _pending, kAppBarColor),
//           _gotoStatus('approved', _approved, Colors.green),
//           _gotoStatus('rejected', _rejected, Colors.red),
//         ],
//       );

//   Widget _gotoStatus(String label, int count, Color color) => InkWell(
//         onTap: () => setState(() => _statusFilter = label),
//         child: _statusChip("${label.capitalize()} ($count)", color),
//       );

//   Widget _statusChip(String label, Color color) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1),
//           border: Border.all(color: color),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           label,
//           style: TextStyle(
//             color: color,
//             fontWeight: FontWeight.w600,
//             fontSize: 10,
//           ),
//         ),
//       );

//   Widget _searchBar() => TextField(
//         onChanged: (val) => setState(() => _search = val),
//         decoration: InputDecoration(
//           hintText: 'Search',
//           prefixIcon: const Icon(Icons.search),
//           fillColor: kPrimaryBackgroundBottom.withOpacity(0.2),
//           filled: true,
//           border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(12),
//           ),
//         ),
//       );

//   Widget _leaveList() => ListView.builder(
//         itemCount: _filteredLeaves.length,
//         itemBuilder: (_, i) => _leaveCard(_filteredLeaves[i]),
//       );

//   Widget _leaveCard(LeaveRequest req) => Card(
//         margin: const EdgeInsets.symmetric(vertical: 6),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         color: kPrimaryBackgroundBottom.withOpacity(0.2),
//         child: Padding(
//           padding: const EdgeInsets.all(14),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _infoRow('Employee ID', req.id),
//               _infoRow('Employee Name', req.name),
//               _infoRow('Department', req.department),
//               _infoRow('Reason', req.reason),
//               _infoRow('Leave Date', req.date),
//               _infoRow('Status', req.status.capitalize(), colored: true),
//               const SizedBox(height: 10),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   _statusActionBtn(req, 'approved', Colors.green),
//                   const SizedBox(width: 6),
//                   _statusActionBtn(req, 'rejected', Colors.red),
//                 ],
//               )
//             ],
//           ),
//         ),
//       );

//   Widget _infoRow(String label, String value, {bool colored = false}) {
//     Color? color;
//     if (colored) {
//       if (value.toLowerCase() == 'approved') color = Colors.green;
//       if (value.toLowerCase() == 'rejected') color = Colors.red;
//       if (value.toLowerCase() == 'pending') color = kAppBarColor;
//     }

//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 2),
//       child: Row(
//         children: [
//           SizedBox(
//               width: 120,
//               child: Text('$label :',
//                   style: const TextStyle(fontWeight: FontWeight.bold))),
//           Expanded(
//             child: Text(
//               value,
//               style: TextStyle(
//                   fontWeight: colored ? FontWeight.bold : FontWeight.normal,
//                   color: color),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _statusActionBtn(LeaveRequest req, String type, Color color) {
//     bool isSelected = req.status == type;
//     bool isDisabled = req.status != 'pending';

//     return SizedBox(
//       width: 70,
//       child: OutlinedButton(
//         onPressed: isDisabled
//             ? null
//             : () {
//                 setState(() => req.status = type);
//               },
//         style: OutlinedButton.styleFrom(
//           foregroundColor: color,
//           backgroundColor: isSelected ? color.withOpacity(0.2) : null,
//           side: BorderSide(color: color),
//           padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
//           minimumSize: const Size(0, 0),
//           tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//           visualDensity: VisualDensity.compact,
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(18),
//           ),
//         ),
//         child: Text(
//           type.capitalize(),
//           style: const TextStyle(
//             fontSize: 12,
//             fontWeight: FontWeight.w600,
//           ),
//         ),
//       ),
//     );
//   }
// }

// extension _Cap on String {
//   String capitalize() => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
// }


import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class LeaveApprovalsScreen extends StatefulWidget {
  const LeaveApprovalsScreen({super.key});

  @override
  State<LeaveApprovalsScreen> createState() => _LeaveApprovalsScreenState();
}

class _LeaveApprovalsScreenState extends State<LeaveApprovalsScreen> {
  String selectedTab = 'All';
  String selectedStatusFilter = 'All';
  final TextEditingController searchController = TextEditingController();

  Map<String, int> approvedCount = {};
  Map<String, int> rejectedCount = {};
  Map<String, int> pendingCount = {};

  final List<Map<String, dynamic>> allLeaveRequests = [
    {
      'type': 'Leave Type',
      'id': 'EMP003',
      'name': 'Mohit',
      'days': 3,
      'from': '21-07-2025',
      'to': '23-07-2025',
      'reason': 'Travel',
      'status': 'pending'
    },
    {
      'type': 'Leave Type',
      'id': 'EMP004',
      'name': 'Abi',
      'days': 4,
      'from': '24-07-2025',
      'to': '25-07-2025',
      'reason': 'Birthday',
      'status': 'pending'
    },
    {
      'type': 'Permission',
      'id': 'EMP004',
      'name': 'Madhu',
      'shift': 1,
      'time': '2:00',
      'date': '25-07-2025',
      'reason': 'Fever',
      'status': 'pending'
    },
    {
      'type': 'Permission',
      'id': 'EMP003',
      'name': 'Deepi',
      'shift': 2,
      'time': '2:00',
      'date': '22-07-2025',
      'reason': 'Fever',
      'status': 'pending'
    },
    {
      'type': 'Over Time',
      'id': 'EMP004',
      'name': 'Madhu',
      'shift': 1,
      'time': '2:00',
      'date': '25-07-2025',
      'status': 'pending'
    },
    {
      'type': 'Over Time',
      'id': 'EMP008',
      'name': 'Divya',
      'shift': 2,
      'time': '3:00',
      'date': '22-07-2025',
      'status': 'pending'
    },
    {
      'type': 'Half Day Leave',
      'id': 'EMP004',
      'name': 'Madhu',
      'leaveDate': '22-07-2025',
      'section': 'Morning',
      'reason': 'Travel',
      'status': 'pending'
    },
    {
      'type': 'Half Day Leave',
      'id': 'EMP004',
      'name': 'Ammu',
      'leaveDate': '23-07-2025',
      'section': 'Evening',
      'reason': 'Fever',
      'status': 'pending'
    },
    {
      'type': 'Comp Off',
      'id': 'EMP004',
      'name': 'Madhu',
      'shift': 1,
      'fromDate': '21-07-2025',
      'replaceDate': '25-07-2025',
      'reason': 'Fever',
      'status': 'pending'
    },
    {
      'type': 'Comp Off',
      'id': 'EMP009',
      'name': 'Moni',
      'shift': 2,
      'fromDate': '22-07-2025',
      'replaceDate': '24-07-2025',
      'reason': 'Travel',
      'status': 'pending'
    },
  ];

  List<Map<String, dynamic>> get filteredRequests {
    List<Map<String, dynamic>> base = selectedTab == 'All'
        ? allLeaveRequests
        : allLeaveRequests.where((leave) => leave['type'] == selectedTab).toList();

    if (selectedStatusFilter != 'All') {
      base = base.where((leave) => leave['status'] == selectedStatusFilter.toLowerCase()).toList();
    }

    if (searchController.text.isNotEmpty) {
      base = base.where((leave) {
        return leave.values.any((value) => value
            .toString()
            .toLowerCase()
            .contains(searchController.text.toLowerCase()));
      }).toList();
    }

    return base;
  }

  void countStatuses() {
    approvedCount.clear();
    rejectedCount.clear();
    pendingCount.clear();

    for (var leave in allLeaveRequests) {
      String type = leave['type'];
      String status = leave['status'];

      if (status == 'approved') {
        approvedCount[type] = (approvedCount[type] ?? 0) + 1;
      } else if (status == 'rejected') {
        rejectedCount[type] = (rejectedCount[type] ?? 0) + 1;
      } else {
        pendingCount[type] = (pendingCount[type] ?? 0) + 1;
      }
    }
  }

  void updateStatus(Map<String, dynamic> leave, String newStatus) {
    setState(() {
      leave['status'] = newStatus;
      countStatuses();
    });
  }

  @override
  void initState() {
    super.initState();
    countStatuses();
  }

  @override
  Widget build(BuildContext context) {
    final today = DateFormat('dd MMM yyyy').format(DateTime.now());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: const Text("Leave Approvals"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 12),
            child: Center(child: Text(today)),
          )
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            // 🔹 Dropdown row
            Row(
              children: [
                DropdownButton<String>(
                  value: selectedTab,
                  onChanged: (val) => setState(() => selectedTab = val!),
                  items: ['All', 'Leave Type', 'Permission', 'Over Time', 'Half Day Leave', 'Comp Off']
                      .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                      .toList(),
                ),
              ],
            ),
            const SizedBox(height: 10),
            // 🔹 Status buttons row
            Row(
              children: [
                _buildStatusButton("Pending", Colors.pink[100]!),
                const SizedBox(width: 6),
                _buildStatusButton("Approved", Colors.greenAccent),
                const SizedBox(width: 6),
                _buildStatusButton("Rejected", Colors.red[200]!),
              ],
            ),
            const SizedBox(height: 10),
            // 🔹 Search bar
            TextField(
              controller: searchController,
              onChanged: (_) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              ),
            ),
            const SizedBox(height: 20),
            // 🔹 List of requests
            Expanded(
              child: ListView.builder(
                itemCount: filteredRequests.length,
                itemBuilder: (context, index) {
                  final item = filteredRequests[index];
                  return Card(
                    color: Colors.deepPurple[100],
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ...item.entries.map((e) => Text('${e.key} : ${e.value}')),
                          if (item['status'] == 'pending') ...[
                            const SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ElevatedButton(
                                  onPressed: () => updateStatus(item, 'approved'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.green,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    textStyle: const TextStyle(fontSize: 12),
                                  ),
                                  child: const Text('Approve'),
                                ),
                                const SizedBox(width: 8),
                                ElevatedButton(
                                  onPressed: () => updateStatus(item, 'rejected'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.red,
                                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                                    textStyle: const TextStyle(fontSize: 12),
                                  ),
                                  child: const Text('Reject'),
                                ),
                              ],
                            ),
                          ],
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStatusButton(String label, Color color) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedStatusFilter = label;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: Colors.black),
        ),
        child: Text(
          "$label (${_getCount(label.toLowerCase())})",
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }

  int _getCount(String status) {
    if (selectedTab == 'All') {
      return allLeaveRequests.where((e) => e['status'] == status).length;
    } else {
      return allLeaveRequests
          .where((e) => e['status'] == status && e['type'] == selectedTab)
          .length;
    }
  }
}