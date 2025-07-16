
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';

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
//     LeaveRequest(
//         id: 'EMP001',
//         name: 'Arun',
//         department: 'IT',
//         reason: 'Personal Work',
//         date: '2025-07-10'),
//     LeaveRequest(
//         id: 'EMP002',
//         name: 'Divya',
//         department: 'HR',
//         reason: 'Fever',
//         date: '2025-07-08'),
//     LeaveRequest(
//         id: 'EMP003',
//         name: 'Mohit',
//         department: 'Finance',
//         reason: 'Travel',
//         date: '2025-07-05'),
//     LeaveRequest(
//         id: 'EMP004',
//         name: 'Nisha',
//         department: 'Sales',
//         reason: 'Function',
//         date: '2025-07-11'),
//   ];

//   String _search = '';
//   String _statusFilter = 'all';

//   List<LeaveRequest> get _filteredLeaves {
//     var leaves = _allLeaves;

//     if (_search.isNotEmpty) {
//       leaves = leaves
//           .where((e) =>
//               e.name.toLowerCase().contains(_search.toLowerCase()) ||
//               e.id.toLowerCase().contains(_search.toLowerCase()))
//           .toList();
//     }

//     if (_statusFilter != 'all') {
//       leaves = leaves.where((e) => e.status == _statusFilter).toList();
//     }

//     return leaves;
//   }

//   int get _pending =>
//       _allLeaves.where((e) => e.status.toLowerCase() == 'pending').length;
//   int get _approved =>
//       _allLeaves.where((e) => e.status.toLowerCase() == 'approved').length;
//   int get _rejected =>
//       _allLeaves.where((e) => e.status.toLowerCase() == 'rejected').length;

//   @override
//   Widget build(BuildContext context) {
//     String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: _buildAppBar(), // ✅ No date passed here now
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
//         backgroundColor: Colors.blue.shade700,
//         shape: const RoundedRectangleBorder(
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
//         ),
//         title: const Text('Request and Leave Approvals'),
//         actions: [], // ✅ Removed date from appBar
//       );

//   Widget _headerRow(String today) => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           const Text('Leave Approvals',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           Text(
//             today,
//             style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
//           ),
//         ],
//       );

//   Widget _statusCounters() => Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _gotoStatus('all', _allLeaves.length, Colors.blue),
//           _gotoStatus('pending', _pending, Colors.purple),
//           _gotoStatus('approved', _approved, Colors.green),
//           _gotoStatus('rejected', _rejected, Colors.red),
//         ],
//       );

//   Widget _gotoStatus(String label, int count, Color color) => InkWell(
//         onTap: () {
//           setState(() => _statusFilter = label);
//         },
//         child: _statusChip(label.capitalize(), count, color),
//       );

//   Widget _statusChip(String label, int count, Color color) => Container(
//         padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//         decoration: BoxDecoration(
//           color: color.withOpacity(0.1),
//           border: Border.all(color: color),
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           children: [
//             Icon(Icons.circle, size: 6, color: color),
//             const SizedBox(width: 4),
//             Text(
//               '$label $count',
//               style: TextStyle(
//                 color: color,
//                 fontWeight: FontWeight.w600,
//                 fontSize: 10,
//               ),
//             ),
//           ],
//         ),
//       );

//   Widget _searchBar() => TextField(
//         onChanged: (val) => setState(() => _search = val),
//         decoration: InputDecoration(
//           hintText: 'Search',
//           prefixIcon: const Icon(Icons.search),
//           fillColor: Colors.white,
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
//               _infoRow('Status', req.status.capitalize()),
//               const SizedBox(height: 10),
//               if (req.status == 'pending')
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     _actionBtn('Approve', Colors.green, () {
//                       setState(() {
//                         req.status = 'approved';
//                       });
//                     }),
//                     const SizedBox(width: 6),
//                     _actionBtn('Reject', Colors.red, () {
//                       setState(() {
//                         req.status = 'rejected';
//                       });
//                     }),
//                   ],
//                 )
//             ],
//           ),
//         ),
//       );

//   Widget _infoRow(String label, String value) => Padding(
//         padding: const EdgeInsets.symmetric(vertical: 2),
//         child: Row(
//           children: [
//             SizedBox(
//                 width: 120,
//                 child: Text('$label :',
//                     style: const TextStyle(fontWeight: FontWeight.bold))),
//             Expanded(child: Text(value)),
//           ],
//         ),
//       );

//   Widget _actionBtn(String text, Color color, VoidCallback onTap) => SizedBox(
//         width: 70,
//         child: OutlinedButton(
//           onPressed: onTap,
//           style: OutlinedButton.styleFrom(
//             foregroundColor: color,
//             side: BorderSide(color: color),
//             backgroundColor: color.withOpacity(0.08),
//             padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
//             minimumSize: const Size(0, 0),
//             tapTargetSize: MaterialTapTargetSize.shrinkWrap,
//             visualDensity: VisualDensity.compact,
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(18),
//             ),
//           ),
//           child: Text(
//             text,
//             textAlign: TextAlign.center,
//             style: const TextStyle(
//               fontSize: 12,
//               fontWeight: FontWeight.w600,
//             ),
//           ),
//         ),
//       );
// }

// extension _Cap on String {
//   String capitalize() =>
//       isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

void main() => runApp(const MaterialApp(
      home: LeaveApprovalsScreen(),
      debugShowCheckedModeBanner: false,
    ));

class LeaveRequest {
  String id;
  String name;
  String department;
  String reason;
  String status;
  String date;

  LeaveRequest({
    required this.id,
    required this.name,
    required this.department,
    required this.reason,
    required this.date,
    this.status = 'pending',
  });
}

class LeaveApprovalsScreen extends StatefulWidget {
  const LeaveApprovalsScreen({Key? key}) : super(key: key);

  @override
  State<LeaveApprovalsScreen> createState() => _LeaveApprovalsScreenState();
}

class _LeaveApprovalsScreenState extends State<LeaveApprovalsScreen> {
  final List<LeaveRequest> _allLeaves = [
    LeaveRequest(id: 'EMP001', name: 'Arun', department: 'IT', reason: 'Personal Work', date: '2025-07-10'),
    LeaveRequest(id: 'EMP002', name: 'Divya', department: 'HR', reason: 'Fever', date: '2025-07-08'),
    LeaveRequest(id: 'EMP003', name: 'Mohit', department: 'Finance', reason: 'Travel', date: '2025-07-05'),
    LeaveRequest(id: 'EMP004', name: 'Nisha', department: 'Sales', reason: 'Function', date: '2025-07-11'),
  ];

  String _search = '';
  String _statusFilter = 'all';

  List<LeaveRequest> get _filteredLeaves {
    var leaves = _allLeaves;

    if (_search.isNotEmpty) {
      leaves = leaves.where((e) =>
          e.name.toLowerCase().contains(_search.toLowerCase()) ||
          e.id.toLowerCase().contains(_search.toLowerCase())).toList();
    }

    if (_statusFilter != 'all') {
      leaves = leaves.where((e) => e.status == _statusFilter).toList();
    }

    return leaves;
  }

  int get _pending => _allLeaves.where((e) => e.status == 'pending').length;
  int get _approved => _allLeaves.where((e) => e.status == 'approved').length;
  int get _rejected => _allLeaves.where((e) => e.status == 'rejected').length;

  @override
  Widget build(BuildContext context) {
    String todayDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

    return Scaffold(
      backgroundColor: kPrimaryBackgroundTop,
      appBar: _buildAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _headerRow(todayDate),
            const SizedBox(height: 12),
            _statusCounters(),
            const SizedBox(height: 12),
            _searchBar(),
            const SizedBox(height: 10),
            Expanded(child: _leaveList()),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() => AppBar(
        backgroundColor: kAppBarColor,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(18)),
        ),
        title: const Text('Request and Leave Approvals'),
      );

  Widget _headerRow(String today) => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text('Leave Approvals',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Text(today,
              style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold)),
        ],
      );

  Widget _statusCounters() => Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _gotoStatus('all', _allLeaves.length, Colors.blue),
          _gotoStatus('pending', _pending, kAppBarColor),
          _gotoStatus('approved', _approved, Colors.green),
          _gotoStatus('rejected', _rejected, Colors.red),
        ],
      );

  Widget _gotoStatus(String label, int count, Color color) => InkWell(
        onTap: () => setState(() => _statusFilter = label),
        child: _statusChip("${label.capitalize()} ($count)", color),
      );

  Widget _statusChip(String label, Color color) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          border: Border.all(color: color),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: 10,
          ),
        ),
      );

  Widget _searchBar() => TextField(
        onChanged: (val) => setState(() => _search = val),
        decoration: InputDecoration(
          hintText: 'Search',
          prefixIcon: const Icon(Icons.search),
          fillColor: kPrimaryBackgroundBottom.withOpacity(0.2),
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      );

  Widget _leaveList() => ListView.builder(
        itemCount: _filteredLeaves.length,
        itemBuilder: (_, i) => _leaveCard(_filteredLeaves[i]),
      );

  Widget _leaveCard(LeaveRequest req) => Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        color: kPrimaryBackgroundBottom.withOpacity(0.2),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _infoRow('Employee ID', req.id),
              _infoRow('Employee Name', req.name),
              _infoRow('Department', req.department),
              _infoRow('Reason', req.reason),
              _infoRow('Leave Date', req.date),
              _infoRow('Status', req.status.capitalize(), colored: true),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  _statusActionBtn(req, 'approved', Colors.green),
                  const SizedBox(width: 6),
                  _statusActionBtn(req, 'rejected', Colors.red),
                ],
              )
            ],
          ),
        ),
      );

  Widget _infoRow(String label, String value, {bool colored = false}) {
    Color? color;
    if (colored) {
      if (value.toLowerCase() == 'approved') color = Colors.green;
      if (value.toLowerCase() == 'rejected') color = Colors.red;
      if (value.toLowerCase() == 'pending') color = kAppBarColor;
    }

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          SizedBox(
              width: 120,
              child: Text('$label :',
                  style: const TextStyle(fontWeight: FontWeight.bold))),
          Expanded(
            child: Text(
              value,
              style: TextStyle(
                  fontWeight: colored ? FontWeight.bold : FontWeight.normal,
                  color: color),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusActionBtn(LeaveRequest req, String type, Color color) {
    bool isSelected = req.status == type;
    bool isDisabled = req.status != 'pending';

    return SizedBox(
      width: 70,
      child: OutlinedButton(
        onPressed: isDisabled
            ? null
            : () {
                setState(() => req.status = type);
              },
        style: OutlinedButton.styleFrom(
          foregroundColor: color,
          backgroundColor: isSelected ? color.withOpacity(0.2) : null,
          side: BorderSide(color: color),
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 9),
          minimumSize: const Size(0, 0),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Text(
          type.capitalize(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

extension _Cap on String {
  String capitalize() => isEmpty ? this : '${this[0].toUpperCase()}${substring(1)}';
}