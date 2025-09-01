
// import 'package:flutter/material.dart';
// import 'package:serv_app/Pagesadmin/attendance_report_screen_page.dart';

// class AttendanceReportScreen extends StatefulWidget {
//   const AttendanceReportScreen({Key? key, required String initialFilter}) : super(key: key);

//   @override
//   State<AttendanceReportScreen> createState() => _AttendanceReportScreenState();
// }

// class _AttendanceReportScreenState extends State<AttendanceReportScreen> {
//   final TextEditingController _searchController = TextEditingController();
//   DateTime _fromDate = DateTime.now().subtract(const Duration(days: 7));
//   DateTime _toDate = DateTime.now();
//   List<AttendanceRecord> _filteredRecords = [];
//   List<AttendanceRecord> _allRecords = [];
//   String _selectedFilter = ''; // Track the selected filter

//   @override
//   void initState() {
//     super.initState();
//     _initializeDummyData();
//     _filteredRecords = _allRecords;
//   }

//   void _initializeDummyData() {
//     _allRecords = [
//       AttendanceRecord(
//         employeeId: "EMP001",
//         employeeName: "John Smith",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "09:00 AM",
//         checkOut: "06:00 PM",
//         department: "IT",
//         attendance: "Present",
//         workedHours: "9.0",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP002",
//         employeeName: "Sarah Johnson",
//         shift: "Evening",
//         date: "2024-01-15",
//         checkIn: "02:00 PM",
//         checkOut: "11:00 PM",
//         department: "HR",
//         attendance: "Present",
//         workedHours: "9.0",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP003",
//         employeeName: "Mike Wilson",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "09:15 AM",
//         checkOut: "06:00 PM",
//         department: "Finance",
//         attendance: "Late",
//         workedHours: "8.75",
//       ),
//       // Add more records as needed...
//     ];
//   }

//   void _searchEmployees(String query) {
//     setState(() {
//       final base = _selectedFilter.isEmpty
//           ? _allRecords
//           : _getFilteredRecordsByAttendance(_selectedFilter);
//       if (query.isEmpty) {
//         _filteredRecords = base;
//       } else {
//         _filteredRecords = base.where((r) {
//           final q = query.toLowerCase();
//           return r.employeeName.toLowerCase().contains(q) ||
//               r.employeeId.toLowerCase().contains(q) ||
//               r.department.toLowerCase().contains(q);
//         }).toList();
//       }
//     });
//   }

//   List<AttendanceRecord> _getFilteredRecordsByAttendance(String filter) {
//     switch (filter) {
//       case 'Checked-In':
//         return _allRecords
//             .where((r) =>
//                 r.attendance == 'Present' ||
//                 r.attendance == 'Late' ||
//                 r.attendance == 'Half Day')
//             .toList();
//       case 'Absent':
//         return _allRecords.where((r) => r.attendance == 'Absent').toList();
//       case 'Late Check-In':
//         return _allRecords.where((r) => r.attendance == 'Late').toList();
//       case 'Half Day':
//         return _allRecords.where((r) => r.attendance == 'Half Day').toList();
//       case 'On Leave':
//         return _allRecords.where((r) => r.attendance == 'On Leave').toList();
//       case 'Field Attendance':
//         return _allRecords
//             .where((r) => r.attendance == 'Field Attendance')
//             .toList();
//       case 'Early Check-Out':
//         return _allRecords
//             .where((r) => r.attendance == 'Early Check-Out')
//             .toList();
//       case 'Active Employees':
//         return _allRecords;
//       default:
//         return _allRecords;
//     }
//   }

//   void _onCardTapped(String title) {
//     setState(() {
//       if (_selectedFilter == title) {
//         _selectedFilter = '';
//         _filteredRecords = _allRecords;
//       } else {
//         _selectedFilter = title;
//         _filteredRecords = _getFilteredRecordsByAttendance(title);
//       }
//       _searchController.clear();
//     });
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(_selectedFilter.isEmpty
//             ? 'Filter cleared - showing all records'
//             : 'Showing $_selectedFilter records'),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   Future<void> _selectDate(BuildContext ctx, bool isFrom) async {
//     final picked = await showDatePicker(
//       context: ctx,
//       initialDate: isFrom ? _fromDate : _toDate,
//       firstDate: DateTime(2020),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isFrom) {
//           _fromDate = picked;
//         } else {
//           _toDate = picked;
//         }
//       });
//     }
//   }

//   String _formatDate(DateTime d) => "${d.day}/${d.month}/${d.year}";

//   @override
//   Widget build(BuildContext context) {
//     final isWeb = MediaQuery.of(context).size.width > 600;
//     return Scaffold(
//       backgroundColor: const Color(0xFFE8F5E8),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 178, 123, 223),
//         elevation: 0,
//         title: Text(
//           'Welcome to SERV',
//           style: TextStyle(fontSize: isWeb ? 16 : 14),
//         ),
//         actions: [
//           Container(
//             margin: const EdgeInsets.only(right: 12),
//             padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//             decoration: BoxDecoration(
//               color: Colors.white,
//               borderRadius: BorderRadius.circular(4),
//             ),
//             child: Text('EN',
//                 style: TextStyle(
//                     color: const Color(0xFF00796B),
//                     fontWeight: FontWeight.w600,
//                     fontSize: isWeb ? 12 : 10)),
//           ),
//           const Center(child: Text('MENU')),
//           const SizedBox(width: 12),
//         ],
//       ),
//       body: Column(
//         children: [
//           // --- Breadcrumb & Active Filter Chip ---
//           Container(
//             width: double.infinity,
//             color: const Color(0xFFE8F5E8),
//             padding: EdgeInsets.all(isWeb ? 16 : 12),
//             child: Row(
//               children: [
//                 const Icon(Icons.chevron_right, color: Colors.grey),
//                 const SizedBox(width: 4),
//                 const Text('Attendance Reports',
//                     style: TextStyle(fontWeight: FontWeight.w600)),
//                 if (_selectedFilter.isNotEmpty) ...[
//                   const SizedBox(width: 8),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                         horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.blue.shade100,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       children: [
//                         Text('Filter: $_selectedFilter',
//                             style: TextStyle(color: Colors.blue.shade700)),
//                         const SizedBox(width: 4),
//                         GestureDetector(
//                           onTap: () => _onCardTapped(_selectedFilter),
//                           child: Icon(Icons.close,
//                               size: 14, color: Colors.blue.shade700),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),

//           // --- Main Content ---
//           Expanded(
//             child: Container(
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // === DATE FILTER ROW ===
//                     Container(
//                       padding: EdgeInsets.all(isWeb ? 16 : 12),
//                       child: Row(
//                         children: [
//                           // From
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('From',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: isWeb ? 14 : 12)),
//                                 SizedBox(height: isWeb ? 8 : 6),
//                                 GestureDetector(
//                                   onTap: () => _selectDate(context, true),
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: isWeb ? 12 : 8,
//                                       vertical: isWeb ? 10 : 8,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colors.grey.shade400),
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: Colors.white,
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             _formatDate(_fromDate),
//                                             overflow: TextOverflow.ellipsis,
//                                             style: TextStyle(
//                                                 fontSize: isWeb ? 14 : 12),
//                                           ),
//                                         ),
//                                         Icon(Icons.calendar_today,
//                                             size: isWeb ? 16 : 14,
//                                             color: Colors.grey.shade600),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),

//                           SizedBox(width: isWeb ? 16 : 8),

//                           // To
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text('To',
//                                     style: TextStyle(
//                                         fontWeight: FontWeight.w500,
//                                         fontSize: isWeb ? 14 : 12)),
//                                 SizedBox(height: isWeb ? 8 : 6),
//                                 GestureDetector(
//                                   onTap: () => _selectDate(context, false),
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: isWeb ? 12 : 8,
//                                       vertical: isWeb ? 10 : 8,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(
//                                           color: Colors.grey.shade400),
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: Colors.white,
//                                     ),
//                                     child: Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Expanded(
//                                           child: Text(
//                                             _formatDate(_toDate),
//                                             overflow: TextOverflow.ellipsis,
//                                             style: TextStyle(
//                                                 fontSize: isWeb ? 14 : 12),
//                                           ),
//                                         ),
//                                         Icon(Icons.calendar_today,
//                                             size: isWeb ? 16 : 14,
//                                             color: Colors.grey.shade600),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     // === DOWNLOAD & APPLY BUTTONS ===
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: isWeb ? 16 : 12),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             child: ElevatedButton.icon(
//                               onPressed: () {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                     const SnackBar(
//                                         content: Text('Downloading report...')));
//                               },
//                               icon: Icon(Icons.download,
//                                   size: isWeb ? 16 : 14),
//                               label: Text('Download Report',
//                                   style: TextStyle(
//                                       fontSize: isWeb ? 14 : 12)),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.grey.shade300,
//                                 foregroundColor: Colors.black87,
//                                 elevation: 0,
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: isWeb ? 16 : 12,
//                                     vertical: isWeb ? 10 : 8),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: isWeb ? 12 : 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                                 _filteredRecords = _allRecords
//                                     .where((r) {
//                                       final recordDate =
//                                           DateTime.parse(r.date);
//                                       return recordDate
//                                               .isAfter(_fromDate
//                                                   .subtract(
//                                                       const Duration(days: 1))) &&
//                                           recordDate.isBefore(_toDate
//                                               .add(const Duration(days: 1)));
//                                     })
//                                     .toList();
//                               });
//                               ScaffoldMessenger.of(context)
//                                   .showSnackBar(const SnackBar(
//                                       content: Text('Filters applied!')));
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF1976D2),
//                               foregroundColor: Colors.white,
//                               elevation: 0,
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: isWeb ? 20 : 16,
//                                   vertical: isWeb ? 10 : 8),
//                             ),
//                             child: Text('Apply',
//                                 style: TextStyle(
//                                     fontSize: isWeb ? 14 : 12)),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 10),

//                     // === SUMMARY CARDS ===
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: isWeb ? 16 : 12),
//                       child: LayoutBuilder(
//                         builder: (ctx, constraints) {
//                           int cols = isWeb ? 4 : 2;
//                           double ratio = isWeb ? 2.2 : 2.5;
//                           if (constraints.maxWidth < 600) {
//                             cols = 2;
//                             ratio = 2.0;
//                           }
//                           return GridView.count(
//                             shrinkWrap: true,
//                             physics:
//                                 const NeverScrollableScrollPhysics(),
//                             crossAxisCount: cols,
//                             crossAxisSpacing: isWeb ? 8 : 6,
//                             mainAxisSpacing: isWeb ? 8 : 6,
//                             childAspectRatio: ratio,
//                             children: [
//                               _buildSummaryCard(
//                                   'Active Employees',
//                                   '74',
//                                   const Color.fromARGB(
//                                       255, 181, 91, 233),
//                                   isWeb),
//                               _buildSummaryCard('On Leave', '0',
//                                   const Color(0xFFBBDEFB), isWeb),
//                               _buildSummaryCard('Checked-In', '47',
//                                   const Color(0xFFFFCC80), isWeb),
//                               _buildSummaryCard('Absent', '27',
//                                   const Color(0xFFA5D6A7), isWeb),
//                               _buildSummaryCard('Late Check-In', '4',
//                                   const Color(0xFFFFAB91), isWeb),
//                               _buildSummaryCard('Field Attendance', '2',
//                                   const Color(0xFFF8BBD9), isWeb),
//                               _buildSummaryCard('Early Check-Out', '0',
//                                   const Color(0xFFC8E6C9), isWeb),
//                               _buildSummaryCard('Half Day', '0',
//                                   const Color.fromARGB(
//                                       255, 171, 114, 218), isWeb),
//                             ],
//                           );
//                         },
//                       ),
//                     ),

//                     const SizedBox(height: 16),

//                     // === SEARCH + REGULARIZATION BUTTON ===
//                     Padding(
//                       padding: EdgeInsets.symmetric(
//                           horizontal: isWeb ? 16 : 12),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: SizedBox(
//                               height: isWeb ? 40 : 35,
//                               child: TextField(
//                                 controller: _searchController,
//                                 onChanged: _searchEmployees,
//                                 decoration: InputDecoration(
//                                   hintText: 'Search',
//                                   prefixIcon: Icon(Icons.search,
//                                       size: isWeb ? 20 : 18),
//                                   border: OutlineInputBorder(
//                                       borderRadius:
//                                           BorderRadius.circular(6)),
//                                   isDense: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: isWeb ? 12 : 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               // Was: AttendanceReport(), now self-navigate
//                               Navigator.push(
//                                 context,
//                                 MaterialPageRoute(
//                                   builder: (_) =>
//                                       const AttendanceReport(),
//                                 ),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color.fromARGB(
//                                   255, 176, 90, 233),
//                               padding: EdgeInsets.symmetric(
//                                   horizontal: isWeb ? 16 : 12,
//                                   vertical: isWeb ? 12 : 8),
//                             ),
//                             child: Text('Limit',
//                                 style: TextStyle(
//                                     fontSize: isWeb ? 15 : 10)),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 16),

//                     // === ATTENDANCE TABLE ===
//                     Container(
//                       height: 400,
//                       margin: EdgeInsets.symmetric(
//                           horizontal: isWeb ? 16 : 12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(
//                             color: Colors.grey.shade300),
//                       ),
//                       child: Column(
//                         children: [
//                           // Header Row
//                           Container(
//                             padding: EdgeInsets.all(isWeb ? 12 : 8),
//                             decoration: const BoxDecoration(
//                               color: Color(0xFFE3F2FD),
//                               borderRadius: BorderRadius.only(
//                                 topLeft: Radius.circular(8),
//                                 topRight: Radius.circular(8),
//                               ),
//                             ),
//                             child: SingleChildScrollView(
//                               scrollDirection: Axis.horizontal,
//                               child: Row(
//                                 children: [
//                                   _buildHeaderCell('Employee ID',
//                                       isWeb ? 80 : 70, isWeb),
//                                   _buildHeaderCell('Employee Name',
//                                       isWeb ? 100 : 90, isWeb),
//                                   _buildHeaderCell('Shift',
//                                       isWeb ? 70 : 60, isWeb),
//                                   _buildHeaderCell('Date',
//                                       isWeb ? 80 : 70, isWeb),
//                                   _buildHeaderCell('CheckIn',
//                                       isWeb ? 70 : 60, isWeb),
//                                   _buildHeaderCell('CheckOut',
//                                       isWeb ? 70 : 60, isWeb),
//                                   _buildHeaderCell('Department',
//                                       isWeb ? 80 : 70, isWeb),
//                                   _buildHeaderCell('Attendance',
//                                       isWeb ? 80 : 70, isWeb),
//                                   _buildHeaderCell('Total Worked Hours',
//                                       isWeb ? 90 : 80, isWeb),
//                                 ],
//                               ),
//                             ),
//                           ),

//                           // Data Rows
//                           Expanded(
//                             child: _filteredRecords.isEmpty
//                                 ? Center(
//                                     child: Text(
//                                       'No records found${_selectedFilter.isNotEmpty ? ' for $_selectedFilter' : ''}',
//                                       style: TextStyle(
//                                         fontSize: isWeb ? 14 : 12,
//                                         color: Colors.grey.shade600,
//                                       ),
//                                     ),
//                                   )
//                                 : ListView.builder(
//                                     itemCount:
//                                         _filteredRecords.length,
//                                     itemBuilder: (ctx, i) {
//                                       final r =
//                                           _filteredRecords[i];
//                                       return Container(
//                                         padding: EdgeInsets.all(
//                                             isWeb ? 12 : 8),
//                                         decoration:
//                                             BoxDecoration(
//                                           border: Border(
//                                             bottom:
//                                                 BorderSide(
//                                               color: Colors
//                                                   .grey.shade200,
//                                               width: 1,
//                                             ),
//                                           ),
//                                         ),
//                                         child: SingleChildScrollView(
//                                           scrollDirection:
//                                               Axis.horizontal,
//                                           child: Row(
//                                             children: [
//                                               _buildDataCell(
//                                                   r.employeeId,
//                                                   isWeb
//                                                       ? 80
//                                                       : 70,
//                                                   isWeb),
//                                               _buildDataCell(
//                                                   r.employeeName,
//                                                   isWeb
//                                                       ? 100
//                                                       : 90,
//                                                   isWeb),
//                                               _buildDataCell(
//                                                   r.shift,
//                                                   isWeb
//                                                       ? 70
//                                                       : 60,
//                                                   isWeb),
//                                               _buildDataCell(
//                                                   r.date,
//                                                   isWeb
//                                                       ? 80
//                                                       : 70,
//                                                   isWeb),
//                                               _buildDataCell(
//                                                   r.checkIn,
//                                                   isWeb
//                                                       ? 70
//                                                       : 60,
//                                                   isWeb),
//                                               _buildDataCell(
//                                                   r.checkOut,
//                                                   isWeb
//                                                       ? 70
//                                                       : 60,
//                                                   isWeb),
//                                               _buildDataCell(
//                                                   r.department,
//                                                   isWeb
//                                                       ? 80
//                                                       : 70,
//                                                   isWeb),
//                                               _buildDataCell(
//                                                   r.attendance,
//                                                   isWeb
//                                                       ? 80
//                                                       : 70,
//                                                   isWeb),
//                                               _buildDataCell(
//                                                   r.workedHours,
//                                                   isWeb
//                                                       ? 90
//                                                       : 80,
//                                                   isWeb),
//                                             ],
//                                           ),
//                                         ),
//                                       );
//                                     },
//                                   ),
//                           ),
//                         ],
//                       ),
//                     ),

//                     const SizedBox(height: 16),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeaderCell(
//       String text, double width, bool isWeb) {
//     return SizedBox(
//       width: width,
//       child: Text(
//         text,
//         style: TextStyle(
//           fontWeight: FontWeight.w600,
//           fontSize: isWeb ? 12 : 10,
//           color: Colors.black87,
//         ),
//         overflow: TextOverflow.ellipsis,
//         maxLines: 2,
//       ),
//     );
//   }

//   Widget _buildDataCell(
//       String text, double width, bool isWeb) {
//     return SizedBox(
//       width: width,
//       child: Text(
//         text,
//         style: TextStyle(
//           fontSize: isWeb ? 12 : 10,
//           color: Colors.black87,
//         ),
//         overflow: TextOverflow.ellipsis,
//         maxLines: 1,
//       ),
//     );
//   }

//   Widget _buildSummaryCard(String title, String count,
//       Color color, bool isWeb) {
//     final isSelected = _selectedFilter == title;
//     return GestureDetector(
//       onTap: () => _onCardTapped(title),
//       child: Container(
//         padding: EdgeInsets.all(isWeb ? 8 : 6),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(8),
//           border: isSelected
//               ? Border.all(color: Colors.blue, width: 2)
//               : null,
//           boxShadow: isSelected
//               ? [
//                   BoxShadow(
//                     color: Colors.blue.withOpacity(0.3),
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                 ]
//               : null,
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Flexible(
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: isWeb ? 9 : 8,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.black87,
//                 ),
//                 textAlign: TextAlign.center,
//                 maxLines: 2,
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             SizedBox(height: isWeb ? 4 : 2),
//             Text(
//               count,
//               style: TextStyle(
//                 fontSize: isWeb ? 16 : 14,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black87,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// class AttendanceRecord {
//   final String employeeId;
//   final String employeeName;
//   final String shift;
//   final String date;
//   final String checkIn;
//   final String checkOut;
//   final String department;
//   final String attendance;
//   final String workedHours;

//   AttendanceRecord({
//     required this.employeeId,
//     required this.employeeName,
//     required this.shift,
//     required this.date,
//     required this.checkIn,
//     required this.checkOut,
//     required this.department,
//     required this.attendance,
//     required this.workedHours,
//   });
// }

import 'package:flutter/material.dart';
import 'package:serv_app/Pagesadmin/attendance_report_screen_page.dart';


const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF); // Light lavender
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9); // Deeper lavender
const Color kAppBarColor = Color(0xFF8c6eaf); // Updated app bar color
const Color kButtonColor = Color(0xFF655193); // Updated button color
const Color kTextColor = Colors.white;

class AttendanceReportScreen extends StatefulWidget {
  const AttendanceReportScreen({super.key, required String initialFilter});

  @override
  State<AttendanceReportScreen> createState() => _AttendanceReportScreenState();
}

class _AttendanceReportScreenState extends State<AttendanceReportScreen> {
  final TextEditingController _searchController = TextEditingController();
  DateTime _fromDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime _toDate = DateTime.now();
  List<AttendanceRecord> _filteredRecords = [];
  List<AttendanceRecord> _allRecords = [];
  String _selectedFilter = ''; // Track the selected filter

  @override
  void initState() {
    super.initState();
    _initializeDummyData();
    _filteredRecords = _allRecords;
  }

  void _initializeDummyData() {
    _allRecords = [
      AttendanceRecord(
        employeeId: "EMP001",
        employeeName: "John Smith",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "09:00 AM",
        checkOut: "06:00 PM",
        department: "IT",
        attendance: "Present",
        workedHours: "9.0",
      ),
      AttendanceRecord(
        employeeId: "EMP002",
        employeeName: "Sarah Johnson",
        shift: "Evening",
        date: "2024-01-15",
        checkIn: "02:00 PM",
        checkOut: "11:00 PM",
        department: "HR",
        attendance: "Present",
        workedHours: "9.0",
      ),
      AttendanceRecord(
        employeeId: "EMP003",
        employeeName: "Mike Wilson",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "09:15 AM",
        checkOut: "06:00 PM",
        department: "Finance",
        attendance: "Late",
        workedHours: "8.75",
      ),
      // Add more records as needed...
    ];
  }

  void _searchEmployees(String query) {
    setState(() {
      final base = _selectedFilter.isEmpty
          ? _allRecords
          : _getFilteredRecordsByAttendance(_selectedFilter);
      if (query.isEmpty) {
        _filteredRecords = base;
      } else {
        _filteredRecords = base.where((r) {
          final q = query.toLowerCase();
          return r.employeeName.toLowerCase().contains(q) ||
              r.employeeId.toLowerCase().contains(q) ||
              r.department.toLowerCase().contains(q);
        }).toList();
      }
    });
  }

  List<AttendanceRecord> _getFilteredRecordsByAttendance(String filter) {
    switch (filter) {
      case 'Checked-In':
        return _allRecords
            .where(
              (r) =>
                  r.attendance == 'Present' ||
                  r.attendance == 'Late' ||
                  r.attendance == 'Half Day',
            )
            .toList();
      case 'Absent':
        return _allRecords.where((r) => r.attendance == 'Absent').toList();
      case 'Late Check-In':
        return _allRecords.where((r) => r.attendance == 'Late').toList();
      case 'Half Day':
        return _allRecords.where((r) => r.attendance == 'Half Day').toList();
      case 'On Leave':
        return _allRecords.where((r) => r.attendance == 'On Leave').toList();
      case 'Field Attendance':
        return _allRecords
            .where((r) => r.attendance == 'Field Attendance')
            .toList();
      case 'Early Check-Out':
        return _allRecords
            .where((r) => r.attendance == 'Early Check-Out')
            .toList();
      case 'Active Employees':
        return _allRecords;
      default:
        return _allRecords;
    }
  }

  void _onCardTapped(String title) {
    setState(() {
      if (_selectedFilter == title) {
        _selectedFilter = '';
        _filteredRecords = _allRecords;
      } else {
        _selectedFilter = title;
        _filteredRecords = _getFilteredRecordsByAttendance(title);
      }
      _searchController.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _selectedFilter.isEmpty
              ? 'Filter cleared - showing all records'
              : 'Showing $_selectedFilter records',
        ),
        backgroundColor: kButtonColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  Future<void> _selectDate(BuildContext ctx, bool isFrom) async {
    final picked = await showDatePicker(
      context: ctx,
      initialDate: isFrom ? _fromDate : _toDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: kButtonColor,
              onPrimary: kTextColor,
              surface: kPrimaryBackgroundTop,
              onSurface: Colors.black87,
            ),
          ),
          child: child!,
        );
      },
    );
    if (picked != null) {
      setState(() {
        if (isFrom) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime d) => "${d.day}/${d.month}/${d.year}";

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;
    return Scaffold(
      backgroundColor: kPrimaryBackgroundBottom,
      
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
          ),
        ),
        child: Column(
          children: [
            // --- Breadcrumb & Active Filter Chip ---
            Container(
              width: double.infinity,
              color: kPrimaryBackgroundBottom.withOpacity(0.3),
              padding: EdgeInsets.all(isWeb ? 16 : 12),
              child: Row(
                children: [
                  Icon(Icons.chevron_right, color: kButtonColor),
                  const SizedBox(width: 4),
                  Text(
                    'Attendance Reports',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: kButtonColor,
                    ),
                  ),
                  if (_selectedFilter.isNotEmpty) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: kButtonColor.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 4),
                          GestureDetector(
                            onTap: () => _onCardTapped(_selectedFilter),
                            child: Icon(
                              Icons.close,
                              size: 14,
                              color: kButtonColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ],
              ),
            ),

            // --- Main Content ---
            Expanded(
              child: Container(
                color: kPrimaryBackgroundTop,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // === DATE FILTER ROW ===
                      Container(
                        padding: EdgeInsets.all(isWeb ? 16 : 12),
                        child: Row(
                          children: [
                            // From
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'From',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: isWeb ? 14 : 12,
                                      color: kButtonColor,
                                    ),
                                  ),
                                  SizedBox(height: isWeb ? 8 : 6),
                                  GestureDetector(
                                    onTap: () => _selectDate(context, true),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isWeb ? 12 : 8,
                                        vertical: isWeb ? 10 : 8,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kButtonColor.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                        color: kPrimaryBackgroundTop,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _formatDate(_fromDate),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: isWeb ? 14 : 12,
                                                color: kButtonColor,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.calendar_today,
                                            size: isWeb ? 16 : 14,
                                            color: kButtonColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            SizedBox(width: isWeb ? 16 : 8),

                            // To
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'To',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: isWeb ? 14 : 12,
                                      color: kButtonColor,
                                    ),
                                  ),
                                  SizedBox(height: isWeb ? 8 : 6),
                                  GestureDetector(
                                    onTap: () => _selectDate(context, false),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                        horizontal: isWeb ? 12 : 8,
                                        vertical: isWeb ? 10 : 8,
                                      ),
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: kButtonColor.withOpacity(0.5),
                                        ),
                                        borderRadius: BorderRadius.circular(6),
                                        color: kPrimaryBackgroundTop,
                                      ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Text(
                                              _formatDate(_toDate),
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                fontSize: isWeb ? 14 : 12,
                                                color: kButtonColor,
                                              ),
                                            ),
                                          ),
                                          Icon(
                                            Icons.calendar_today,
                                            size: isWeb ? 16 : 14,
                                            color: kButtonColor,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      // === DOWNLOAD & APPLY BUTTONS ===
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWeb ? 16 : 12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ElevatedButton.icon(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: const Text(
                                        'Downloading report...',
                                      ),
                                      backgroundColor: kButtonColor,
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.download,
                                  size: isWeb ? 16 : 14,
                                  color: kButtonColor,
                                ),
                                label: Text(
                                  'Download Report',
                                  style: TextStyle(
                                    fontSize: isWeb ? 14 : 12,
                                    color: kButtonColor,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: kPrimaryBackgroundBottom,
                                  foregroundColor: kButtonColor,
                                  elevation: 0,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: isWeb ? 16 : 12,
                                    vertical: isWeb ? 10 : 8,
                                  ),
                                  side: BorderSide(color: kButtonColor),
                                ),
                              ),
                            ),
                            SizedBox(width: isWeb ? 12 : 8),
                            ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  _filteredRecords = _allRecords.where((r) {
                                    final recordDate = DateTime.parse(r.date);
                                    return recordDate.isAfter(
                                          _fromDate.subtract(
                                            const Duration(days: 1),
                                          ),
                                        ) &&
                                        recordDate.isBefore(
                                          _toDate.add(const Duration(days: 1)),
                                        );
                                  }).toList();
                                });
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: const Text('Filters applied!'),
                                    backgroundColor: kButtonColor,
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kButtonColor,
                                foregroundColor: kTextColor,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isWeb ? 20 : 16,
                                  vertical: isWeb ? 10 : 8,
                                ),
                              ),
                              child: Text(
                                'Apply',
                                style: TextStyle(fontSize: isWeb ? 14 : 12),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 10),

                      // === SUMMARY CARDS ===
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWeb ? 16 : 12,
                        ),
                        child: LayoutBuilder(
                          builder: (ctx, constraints) {
                            int cols = isWeb ? 4 : 2;
                            double ratio = isWeb ? 2.2 : 2.5;
                            if (constraints.maxWidth < 600) {
                              cols = 2;
                              ratio = 2.0;
                            }
                            return GridView.count(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              crossAxisCount: cols,
                              crossAxisSpacing: isWeb ? 8 : 6,
                              mainAxisSpacing: isWeb ? 8 : 6,
                              childAspectRatio: ratio,
                              children: [
                                _buildSummaryCard(
                                  'Active Employees',
                                  '74',
                                  Color(0xFFB39DDB),
                                  isWeb,
                                ),
                                _buildSummaryCard(
                                  'On Leave',
                                  '0',
                                  Color(0xFFD1C4E9),
                                  isWeb,
                                ),
                                _buildSummaryCard(
                                  'Checked-In',
                                  '47',
                                  Color(0xFFCE93D8),
                                  isWeb,
                                ),
                                _buildSummaryCard(
                                  'Absent',
                                  '27',
                                  Color(0xFFE1BEE7),
                                  isWeb,
                                ),
                                _buildSummaryCard(
                                  'Late Check-In',
                                  '4',
                                  Color(0xFFBA68C8),
                                  isWeb,
                                ),
                                _buildSummaryCard(
                                  'Field Attendance',
                                  '2',
                                  Color(0xFFF8BBD0),
                                  isWeb,
                                ),
                                _buildSummaryCard(
                                  'Early Check-Out',
                                  '0',
                                  Color(0xFFF48FB1),
                                  isWeb,
                                ),
                                _buildSummaryCard(
                                  'Half Day',
                                  '0',
                                  Color(0xFFF06292),
                                  isWeb,
                                ),
                              ],
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 16),

                      // === SEARCH + REGULARIZATION BUTTON ===
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: isWeb ? 16 : 12,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: SizedBox(
                                height: isWeb ? 40 : 35,
                                child: TextField(
                                  controller: _searchController,
                                  onChanged: _searchEmployees,
                                  decoration: InputDecoration(
                                    hintText: 'Search',
                                    hintStyle: TextStyle(
                                      color: kButtonColor.withOpacity(0.6),
                                    ),
                                    prefixIcon: Icon(
                                      Icons.search,
                                      size: isWeb ? 20 : 18,
                                      color: kButtonColor,
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: kButtonColor,
                                      ),
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: kButtonColor.withOpacity(0.5),
                                      ),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6),
                                      borderSide: BorderSide(
                                        color: kButtonColor,
                                      ),
                                    ),
                                    isDense: true,
                                    filled: true,
                                    fillColor: kPrimaryBackgroundTop,
                                  ),
                                  style: TextStyle(color: kButtonColor),
                                ),
                              ),
                            ),
                            SizedBox(width: isWeb ? 12 : 8),
                            ElevatedButton(
                              onPressed: () {
                                // Was: AttendanceReport(), now self-navigate
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => const AttendanceReport(),
                                  ),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kAppBarColor,
                                foregroundColor: kTextColor,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isWeb ? 16 : 12,
                                  vertical: isWeb ? 12 : 8,
                                ),
                              ),
                              child: Text(
                                'Limit',
                                style: TextStyle(fontSize: isWeb ? 15 : 10),
                              ),
                            ),
                          ],
                        ),
                      ),

                      const SizedBox(height: 16),

                      // === ATTENDANCE TABLE ===
                      Container(
                        height: 400,
                        margin: EdgeInsets.symmetric(
                          horizontal: isWeb ? 16 : 12,
                        ),
                        decoration: BoxDecoration(
                          color: kPrimaryBackgroundTop,
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: kButtonColor.withOpacity(0.3),
                          ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: SizedBox(
                            width: isWeb
                                ? 50
                                : 925, // adjust based on total width of all columns
                            child: Column(
                              children: [
                                // Header Row
                                Container(
                                  padding: EdgeInsets.all(isWeb ? 12 : 8),
                                  decoration: BoxDecoration(
                                    color: kPrimaryBackgroundBottom,
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(8),
                                      topRight: Radius.circular(8),
                                    ),
                                  ),
                                  child: Row(
                                    children: [
                                      _buildHeaderCell(
                                        'Employee ID',
                                        100,
                                        isWeb,
                                      ),
                                      _buildHeaderCell(
                                        'Employee Name',
                                        120,
                                        isWeb,
                                      ),
                                      _buildHeaderCell('Shift', 80, isWeb),
                                      _buildHeaderCell('Date', 100, isWeb),
                                      _buildHeaderCell('CheckIn', 100, isWeb),
                                      _buildHeaderCell('CheckOut', 100, isWeb),
                                      _buildHeaderCell(
                                        'Department',
                                        100,
                                        isWeb,
                                      ),
                                      _buildHeaderCell(
                                        'Attendance',
                                        100,
                                        isWeb,
                                      ),
                                      _buildHeaderCell(
                                        'Worked Hours',
                                        100,
                                        isWeb,
                                      ),
                                    ],
                                  ),
                                ),

                                // Data Rows
                                Expanded(
                                  child: _filteredRecords.isEmpty
                                      ? Center(
                                          child: Text(
                                            'No records found${_selectedFilter.isNotEmpty ? ' for $_selectedFilter' : ''}',
                                            style: TextStyle(
                                              fontSize: isWeb ? 14 : 12,
                                              color: kButtonColor.withOpacity(
                                                0.7,
                                              ),
                                            ),
                                          ),
                                        )
                                      : ListView.builder(
                                          itemCount: _filteredRecords.length,
                                          itemBuilder: (ctx, i) {
                                            final r = _filteredRecords[i];
                                            return Container(
                                              padding: EdgeInsets.all(
                                                isWeb ? 12 : 8,
                                              ),
                                              decoration: BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    color:
                                                        kPrimaryBackgroundBottom
                                                            .withOpacity(0.5),
                                                    width: 1,
                                                  ),
                                                ),
                                              ),
                                              child: Row(
                                                children: [
                                                  _buildDataCell(
                                                    r.employeeId,
                                                    100,
                                                    isWeb,
                                                  ),
                                                  _buildDataCell(
                                                    r.employeeName,
                                                    120,
                                                    isWeb,
                                                  ),
                                                  _buildDataCell(
                                                    r.shift,
                                                    80,
                                                    isWeb,
                                                  ),
                                                  _buildDataCell(
                                                    r.date,
                                                    100,
                                                    isWeb,
                                                  ),
                                                  _buildDataCell(
                                                    r.checkIn,
                                                    100,
                                                    isWeb,
                                                  ),
                                                  _buildDataCell(
                                                    r.checkOut,
                                                    100,
                                                    isWeb,
                                                  ),
                                                  _buildDataCell(
                                                    r.department,
                                                    100,
                                                    isWeb,
                                                  ),
                                                  _buildDataCell(
                                                    r.attendance,
                                                    100,
                                                    isWeb,
                                                  ),
                                                  _buildDataCell(
                                                    r.workedHours,
                                                    100,
                                                    isWeb,
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderCell(String text, double width, bool isWeb) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: isWeb ? 12 : 10,
          color: kButtonColor,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 2,
      ),
    );
  }

  Widget _buildDataCell(String text, double width, bool isWeb) {
    return SizedBox(
      width: width,
      child: Text(
        text,
        style: TextStyle(fontSize: isWeb ? 12 : 10, color: kButtonColor),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _buildSummaryCard(
    String title,
    String count,
    Color color,
    bool isWeb,
  ) {
    final isSelected = _selectedFilter == title;
    return GestureDetector(
      onTap: () => _onCardTapped(title),
      child: Container(
        padding: EdgeInsets.all(isWeb ? 8 : 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: isSelected ? Border.all(color: kButtonColor, width: 2) : null,
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: kButtonColor.withOpacity(0.3),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ]
              : [
                  BoxShadow(
                    color: kButtonColor.withOpacity(0.1),
                    blurRadius: 2,
                    offset: const Offset(0, 1),
                  ),
                ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isWeb ? 30 : 12,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            SizedBox(height: isWeb ? 4 : 2),
            Text(
              count,
              style: TextStyle(
                fontSize: isWeb ? 15 : 15,
                fontWeight: FontWeight.bold,
                color: const Color.fromARGB(234, 24, 24, 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AttendanceRecord {
  final String employeeId;
  final String employeeName;
  final String shift;
  final String date;
  final String checkIn;
  final String checkOut;
  final String department;
  final String attendance;
  final String workedHours;

  AttendanceRecord({
    required this.employeeId,
    required this.employeeName,
    required this.shift,
    required this.date,
    required this.checkIn,
    required this.checkOut,
    required this.department,
    required this.attendance,
    required this.workedHours,
  });
}