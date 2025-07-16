// import 'package:flutter/material.dart';


// class AttendanceReport extends StatefulWidget {
//   const AttendanceReport({super.key});

//   @override
//   State<AttendanceReport> createState() => _AttendanceReportState();
// }

// class _AttendanceReportState extends State<AttendanceReport> {
//   final TextEditingController _searchController = TextEditingController();
//   DateTime _fromDate = DateTime.now().subtract(const Duration(days: 7));
//   DateTime _toDate = DateTime.now();
//   List<AttendanceRecord> _filteredRecords = [];
//   List<AttendanceRecord> _allRecords = [];
//   String _selectedFilter = ''; // Track selected filter

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
//       AttendanceRecord(
//         employeeId: "EMP004",
//         employeeName: "Emily Davis",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "-",
//         checkOut: "-",
//         department: "Marketing",
//         attendance: "Absent",
//         workedHours: "0.0",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP005",
//         employeeName: "Robert Brown",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "09:00 AM",
//         checkOut: "02:00 PM",
//         department: "IT",
//         attendance: "Half Day",
//         workedHours: "5.0",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP006",
//         employeeName: "Lisa Anderson",
//         shift: "Evening",
//         date: "2024-01-15",
//         checkIn: "02:00 PM",
//         checkOut: "11:00 PM",
//         department: "Sales",
//         attendance: "Present",
//         workedHours: "9.0",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP007",
//         employeeName: "David Chen",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "09:30 AM",
//         checkOut: "06:00 PM",
//         department: "Engineering",
//         attendance: "Late",
//         workedHours: "8.5",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP008",
//         employeeName: "Maria Rodriguez",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "-",
//         checkOut: "-",
//         department: "Design",
//         attendance: "Absent",
//         workedHours: "0.0",
//       ),
//       // Add more sample data for other categories
//       AttendanceRecord(
//         employeeId: "EMP009",
//         employeeName: "James Wilson",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "-",
//         checkOut: "-",
//         department: "IT",
//         attendance: "On Leave",
//         workedHours: "0.0",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP010",
//         employeeName: "Anna Taylor",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "-",
//         checkOut: "-",
//         department: "HR",
//         attendance: "Holiday",
//         workedHours: "0.0",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP011",
//         employeeName: "Tom Brown",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "-",
//         checkOut: "-",
//         department: "Finance",
//         attendance: "Week Off",
//         workedHours: "0.0",
//       ),
//       AttendanceRecord(
//         employeeId: "EMP012",
//         employeeName: "Sophie Clark",
//         shift: "Morning",
//         date: "2024-01-15",
//         checkIn: "09:00 AM",
//         checkOut: "06:00 PM",
//         department: "Marketing",
//         attendance: "Regularized",
//         workedHours: "9.0",
//       ),
//     ];
//   }

//   void _searchEmployees(String query) {
//     setState(() {
//       List<AttendanceRecord> baseRecords = _selectedFilter.isEmpty 
//           ? _allRecords 
//           : _allRecords.where((record) => _matchesFilter(record, _selectedFilter)).toList();
          
//       if (query.isEmpty) {
//         _filteredRecords = baseRecords;
//       } else {
//         _filteredRecords = baseRecords.where((record) =>
//           record.employeeName.toLowerCase().contains(query.toLowerCase()) ||
//           record.employeeId.toLowerCase().contains(query.toLowerCase()) ||
//           record.department.toLowerCase().contains(query.toLowerCase())
//         ).toList();
//       }
//     });
//   }

//   bool _matchesFilter(AttendanceRecord record, String filter) {
//     switch (filter) {
//       case 'Present':
//         return record.attendance == 'Present';
//       case 'Absent':
//         return record.attendance == 'Absent';
//       case 'On Leave':
//         return record.attendance == 'On Leave';
//       case 'Holiday':
//         return record.attendance == 'Holiday';
//       case 'Week Off':
//         return record.attendance == 'Week Off';
//       case 'Half Day':
//         return record.attendance == 'Half Day';
//       case 'Regularized':
//         return record.attendance == 'Regularized';
//       default:
//         return true;
//     }
//   }

//   void _filterByAttendanceType(String attendanceType) {
//     setState(() {
//       _selectedFilter = _selectedFilter == attendanceType ? '' : attendanceType;
//       _searchController.clear();
      
//       if (_selectedFilter.isEmpty) {
//         _filteredRecords = _allRecords;
//       } else {
//         _filteredRecords = _allRecords.where((record) => _matchesFilter(record, _selectedFilter)).toList();
//       }
//     });
    
//     ScaffoldMessenger.of(context).showSnackBar(
//       SnackBar(
//         content: Text(_selectedFilter.isEmpty 
//             ? 'Filter cleared - showing all records' 
//             : 'Filtered by: $_selectedFilter'),
//         duration: const Duration(seconds: 2),
//       ),
//     );
//   }

//   int _getCountForType(String type) {
//     return _allRecords.where((record) => _matchesFilter(record, type)).length;
//   }

//   Future<void> _selectDate(BuildContext context, bool isFromDate) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: isFromDate ? _fromDate : _toDate,
//       firstDate: DateTime(2020),
//       lastDate: DateTime.now(),
//     );
//     if (picked != null) {
//       setState(() {
//         if (isFromDate) {
//           _fromDate = picked;
//         } else {
//           _toDate = picked;
//         }
//       });
//     }
//   }

//   String _formatDate(DateTime date) {
//     return "${date.day}/${date.month}/${date.year}";
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isWeb = MediaQuery.of(context).size.width > 600;
    
//     return Scaffold(
//       backgroundColor: const Color(0xFFE8F5E8),
//       appBar: AppBar(
//         backgroundColor: const Color.fromARGB(255, 178, 123, 223),
//         elevation: 0,
//         title: Row(
//           children: [
//             Flexible(
//               child: Text(
//                 'Welcome to SERV',
//                 style: TextStyle(
//                   fontSize: isWeb ? 16 : 14,
//                   fontWeight: FontWeight.w500,
//                   color: Colors.white,
//                 ),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//             const Spacer(),
//             Container(
//               padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(4),
//               ),
//               child: Text(
//                 'EN',
//                 style: TextStyle(
//                   color: const Color(0xFF00796B),
//                   fontSize: isWeb ? 12 : 10,
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//             const SizedBox(width: 4),
//             Text(
//               'MENU',
//               style: TextStyle(
//                 fontSize: isWeb ? 12 : 10,
//                 fontWeight: FontWeight.w500,
//                 color: Colors.white,
//               ),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           // Header Section
//           Container(
//             width: double.infinity,
//             color: const Color(0xFFE8F5E8),
//             padding: EdgeInsets.all(isWeb ? 16 : 12),
//             child: Row(
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.pop(context);
//                   },
//                   child: Icon(
//                   Icons.chevron_right,
//                   color: Colors.grey,
//                   size: isWeb ? 20 : 16,
//                 ),
//                 ),
                
//                 const SizedBox(width: 4),
//                 Flexible(
//                   child: Text(
//                     'Attendance Reports',
//                     style: TextStyle(
//                       fontSize: isWeb ? 16 : 14,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black87,
//                     ),
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                 ),
//                 // Show current filter if active
//                 if (_selectedFilter.isNotEmpty) ...[
//                   const Spacer(),
//                   Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
//                     decoration: BoxDecoration(
//                       color: Colors.blue.shade100,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Row(
//                       mainAxisSize: MainAxisSize.min,
//                       children: [
//                         Text(
//                           'Filter: $_selectedFilter',
//                           style: TextStyle(
//                             fontSize: isWeb ? 12 : 10,
//                             color: Colors.blue.shade700,
//                             fontWeight: FontWeight.w500,
//                           ),
//                         ),
//                         const SizedBox(width: 4),
//                         GestureDetector(
//                           onTap: () => _filterByAttendanceType(''),
//                           child: Icon(
//                             Icons.close,
//                             size: isWeb ? 16 : 14,
//                             color: Colors.blue.shade700,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ],
//             ),
//           ),

//           // Main Content
//           Expanded(
//             child: Container(
//               color: Colors.white,
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     // Date Filter Section
//                     Container(
//                       padding: EdgeInsets.all(isWeb ? 16 : 12),
//                       color: Colors.white,
//                       child: Row(
//                         children: [
//                           // From Date
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'From',
//                                   style: TextStyle(
//                                     fontSize: isWeb ? 14 : 12,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 SizedBox(height: isWeb ? 8 : 6),
//                                 GestureDetector(
//                                   onTap: () => _selectDate(context, true),
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: isWeb ? 12 : 8,
//                                       vertical: isWeb ? 10 : 8,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(color: Colors.grey.shade400),
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: Colors.white,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Flexible(
//                                           child: Text(
//                                             _formatDate(_fromDate),
//                                             style: TextStyle(
//                                               fontSize: isWeb ? 14 : 12,
//                                               color: Colors.black87,
//                                             ),
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                         const SizedBox(width: 4),
//                                         Icon(
//                                           Icons.calendar_today,
//                                           size: isWeb ? 16 : 14,
//                                           color: Colors.grey.shade600,
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           SizedBox(width: isWeb ? 16 : 8),
//                           // To Date
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   'To',
//                                   style: TextStyle(
//                                     fontSize: isWeb ? 14 : 12,
//                                     fontWeight: FontWeight.w500,
//                                     color: Colors.black87,
//                                   ),
//                                 ),
//                                 SizedBox(height: isWeb ? 8 : 6),
//                                 GestureDetector(
//                                   onTap: () => _selectDate(context, false),
//                                   child: Container(
//                                     padding: EdgeInsets.symmetric(
//                                       horizontal: isWeb ? 12 : 8,
//                                       vertical: isWeb ? 10 : 8,
//                                     ),
//                                     decoration: BoxDecoration(
//                                       border: Border.all(color: Colors.grey.shade400),
//                                       borderRadius: BorderRadius.circular(6),
//                                       color: Colors.white,
//                                     ),
//                                     child: Row(
//                                       children: [
//                                         Flexible(
//                                           child: Text(
//                                             _formatDate(_toDate),
//                                             style: TextStyle(
//                                               fontSize: isWeb ? 14 : 12,
//                                               color: Colors.black87,
//                                             ),
//                                             overflow: TextOverflow.ellipsis,
//                                           ),
//                                         ),
//                                         const SizedBox(width: 4),
//                                         Icon(
//                                           Icons.calendar_today,
//                                           size: isWeb ? 16 : 14,
//                                           color: Colors.grey.shade600,
//                                         ),
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

//                     // Buttons Section
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: isWeb ? 16 : 12),
//                       child: Row(
//                         children: [
//                           Flexible(
//                             child: ElevatedButton.icon(
//                               onPressed: () {
//                                 ScaffoldMessenger.of(context).showSnackBar(
//                                   const SnackBar(content: Text('Downloading report...')),
//                                 );
//                               },
//                               icon: Icon(Icons.download, size: isWeb ? 16 : 14),
//                               label: Text(
//                                 'Download Report',
//                                 style: TextStyle(fontSize: isWeb ? 14 : 12),
//                               ),
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Colors.grey.shade300,
//                                 foregroundColor: Colors.black87,
//                                 elevation: 0,
//                                 padding: EdgeInsets.symmetric(
//                                   horizontal: isWeb ? 16 : 12,
//                                   vertical: isWeb ? 10 : 8,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: isWeb ? 12 : 8),
//                           ElevatedButton(
//                             onPressed: () {
//                               setState(() {
//                               _filteredRecords = _allRecords.where((record) {
//       DateTime recordDate = DateTime.parse(record.date); // use correct format
//       return recordDate.isAfter(_fromDate.subtract(Duration(days: 1))) &&
//              recordDate.isBefore(_toDate.add(Duration(days: 1)));
//     }).toList();
//                               });
//                               ScaffoldMessenger.of(context).showSnackBar(
//                                 const SnackBar(content: Text('Filters applied!')),
//                               );
//                             },
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: const Color(0xFF1976D2),
//                               foregroundColor: const Color.fromARGB(255, 233, 227, 227),
//                               elevation: 0,
//                               padding: EdgeInsets.symmetric(
//                                 horizontal: isWeb ? 20 : 16,
//                                 vertical: isWeb ? 10 : 8,
//                               ),
//                             ),
//                             child: Text(
//                               'Apply',
//                               style: TextStyle(fontSize: isWeb ? 14 : 12),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: isWeb ? 16 : 12),

//                     // Summary Cards
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: isWeb ? 16 : 12),
//                       child: LayoutBuilder(
//                         builder: (context, constraints) {
//                           int crossAxisCount = isWeb ? 4 : 2;
//                           double childAspectRatio = isWeb ? 2.2 : 2.5;
                          
//                           if (constraints.maxWidth < 600) {
//                             crossAxisCount = 2;
//                             childAspectRatio = 2.0;
//                           }
                          
//                           return GridView.count(
//                             shrinkWrap: true,
//                             physics: const NeverScrollableScrollPhysics(),
//                             crossAxisCount: crossAxisCount,
//                             crossAxisSpacing: isWeb ? 8 : 6,
//                             mainAxisSpacing: isWeb ? 8 : 6,
//                             childAspectRatio: childAspectRatio,
//                             children: [
//                               _buildSummaryCard('Present', _getCountForType('Present').toString(), const Color(0xFFE1BEE7), isWeb),
//                               _buildSummaryCard('Absent', _getCountForType('Absent').toString(), const Color(0xFFBBDEFB), isWeb),
//                               _buildSummaryCard('On Leave', _getCountForType('On Leave').toString(), const Color(0xFFFFCC80), isWeb),
//                               _buildSummaryCard('Holiday', _getCountForType('Holiday').toString(), const Color(0xFFA5D6A7), isWeb),
//                               _buildSummaryCard('Week Off', _getCountForType('Week Off').toString(), const Color(0xFFFFAB91), isWeb),
//                               _buildSummaryCard('Half Day', _getCountForType('Half Day').toString(), const Color(0xFFF8BBD9), isWeb),
//                               _buildSummaryCard('Regularized', _getCountForType('Regularized').toString(), const Color(0xFFC8E6C9), isWeb),
                              
//                             ],
//                           );
//                         },
//                       ),
//                     ),
//                     SizedBox(height: isWeb ? 16 : 12),

//                     // Search and Regularization
//                     Container(
//                       padding: EdgeInsets.symmetric(horizontal: isWeb ? 16 : 12),
//                       child: Row(
//                         children: [
//                           Expanded(
//                             flex: 3,
//                             child: SizedBox(
//                               height: isWeb ? 40 : 35,
//                               child: TextField(
//                                 controller: _searchController,
//                                 onChanged: _searchEmployees,
//                                 style: TextStyle(fontSize: isWeb ? 14 : 12),
//                                 decoration: InputDecoration(
//                                   hintText: 'Search',
//                                   hintStyle: TextStyle(
//                                     color: Colors.grey.shade500,
//                                     fontSize: isWeb ? 14 : 12,
//                                   ),
//                                   prefixIcon: Icon(
//                                     Icons.search, 
//                                     color: Colors.grey.shade600,
//                                     size: isWeb ? 20 : 18,
//                                   ),
//                                   border: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6),
//                                     borderSide: BorderSide(color: Colors.grey.shade400),
//                                   ),
//                                   enabledBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6),
//                                     borderSide: BorderSide(color: Colors.grey.shade400),
//                                   ),
//                                   focusedBorder: OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(6),
//                                     borderSide: const BorderSide(color: Color(0xFF1976D2)),
//                                   ),
//                                   filled: true,
//                                   fillColor: Colors.white,
//                                   contentPadding: EdgeInsets.symmetric(
//                                     horizontal: isWeb ? 12 : 8,
//                                     vertical: isWeb ? 8 : 6,
//                                   ),
//                                   isDense: true,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           SizedBox(width: isWeb ? 12 : 8),

//                         ],
//                       ),
//                     ),
                    

//                     // Attendance Table
//                     Container(
//                       height: 400,
//                       margin: EdgeInsets.symmetric(horizontal: isWeb ? 16 : 12),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         border: Border.all(color: Colors.grey.shade300),
//                       ),
//                       child: Column(
//                         children: [
//                           // Table Header
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
//                                   _buildHeaderCell('Employee ID', isWeb ? 80 : 70, isWeb),
//                                   _buildHeaderCell('Employee Name', isWeb ? 100 : 90, isWeb),
//                                   _buildHeaderCell('Shift', isWeb ? 70 : 60, isWeb),
//                                   _buildHeaderCell('Date', isWeb ? 80 : 70, isWeb),
//                                   _buildHeaderCell('CheckIn', isWeb ? 70 : 60, isWeb),
//                                   _buildHeaderCell('CheckOut', isWeb ? 70 : 60, isWeb),
//                                   _buildHeaderCell('Department', isWeb ? 80 : 70, isWeb),
//                                   _buildHeaderCell('Attendance', isWeb ? 80 : 70, isWeb),
//                                   _buildHeaderCell('Total Worked Hours', isWeb ? 90 : 80, isWeb),
//                                 ],
//                               ),
//                             ),
//                           ),
//                           // Table Rows
//                           Expanded(
//                             child: ListView.builder(
//                               itemCount: _filteredRecords.length,
//                               itemBuilder: (context, index) {
//                                 final record = _filteredRecords[index];
//                                 return Container(
//                                   padding: EdgeInsets.all(isWeb ? 12 : 8),
//                                   decoration: BoxDecoration(
//                                     border: Border(
//                                       bottom: BorderSide(
//                                         color: Colors.grey.shade200,
//                                         width: 1,
//                                       ),
//                                     ),
//                                   ),
//                                   child: SingleChildScrollView(
//                                     scrollDirection: Axis.horizontal,
//                                     child: Row(
//                                       children: [
//                                         _buildDataCell(record.employeeId, isWeb ? 80 : 70, isWeb),
//                                         _buildDataCell(record.employeeName, isWeb ? 100 : 90, isWeb),
//                                         _buildDataCell(record.shift, isWeb ? 70 : 60, isWeb),
//                                         _buildDataCell(record.date, isWeb ? 80 : 70, isWeb),
//                                         _buildDataCell(record.checkIn, isWeb ? 70 : 60, isWeb),
//                                         _buildDataCell(record.checkOut, isWeb ? 70 : 60, isWeb),
//                                         _buildDataCell(record.department, isWeb ? 80 : 70, isWeb),
//                                         _buildDataCell(record.attendance, isWeb ? 80 : 70, isWeb),
//                                         _buildDataCell(record.workedHours, isWeb ? 90 : 80, isWeb),
//                                       ],
//                                     ),
//                                   ),
//                                 );
//                               },
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: isWeb ? 16 : 12),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildHeaderCell(String text, double width, bool isWeb) {
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

//   Widget _buildDataCell(String text, double width, bool isWeb) {
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

//   Widget _buildSummaryCard(String title, String count, Color color, bool isWeb) {
//     bool isSelected = _selectedFilter == title;
    
//     return GestureDetector(
//       onTap: () => _filterByAttendanceType(title),
//       child: Container(
//         padding: EdgeInsets.all(isWeb ? 8 : 6),
//         decoration: BoxDecoration(
//           color: color,
//           borderRadius: BorderRadius.circular(8),
//           border: isSelected 
//               ? Border.all(color: Colors.blue, width: 2)
//               : null,
//           boxShadow: isSelected 
//               ? [BoxShadow(
//                   color: Colors.blue.withOpacity(0.3),
//                   blurRadius: 4,
//                   offset: const Offset(0, 2),
//                 )]
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

class AttendanceReport extends StatefulWidget {
  const AttendanceReport({super.key});

  @override
  State<AttendanceReport> createState() => _AttendanceReportState();
}

class _AttendanceReportState extends State<AttendanceReport> {
  final TextEditingController _searchController = TextEditingController();
  DateTime _fromDate = DateTime.now().subtract(const Duration(days: 7));
  DateTime _toDate = DateTime.now();
  List<AttendanceRecord> _filteredRecords = [];
  List<AttendanceRecord> _allRecords = [];
  String _selectedFilter = ''; // Track selected filter

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
      AttendanceRecord(
        employeeId: "EMP004",
        employeeName: "Emily Davis",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "-",
        checkOut: "-",
        department: "Marketing",
        attendance: "Absent",
        workedHours: "0.0",
      ),
      AttendanceRecord(
        employeeId: "EMP005",
        employeeName: "Robert Brown",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "09:00 AM",
        checkOut: "02:00 PM",
        department: "IT",
        attendance: "Half Day",
        workedHours: "5.0",
      ),
      AttendanceRecord(
        employeeId: "EMP006",
        employeeName: "Lisa Anderson",
        shift: "Evening",
        date: "2024-01-15",
        checkIn: "02:00 PM",
        checkOut: "11:00 PM",
        department: "Sales",
        attendance: "Present",
        workedHours: "9.0",
      ),
      AttendanceRecord(
        employeeId: "EMP007",
        employeeName: "David Chen",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "09:30 AM",
        checkOut: "06:00 PM",
        department: "Engineering",
        attendance: "Late",
        workedHours: "8.5",
      ),
      AttendanceRecord(
        employeeId: "EMP008",
        employeeName: "Maria Rodriguez",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "-",
        checkOut: "-",
        department: "Design",
        attendance: "Absent",
        workedHours: "0.0",
      ),
      // Add more sample data for other categories
      AttendanceRecord(
        employeeId: "EMP009",
        employeeName: "James Wilson",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "-",
        checkOut: "-",
        department: "IT",
        attendance: "On Leave",
        workedHours: "0.0",
      ),
      AttendanceRecord(
        employeeId: "EMP010",
        employeeName: "Anna Taylor",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "-",
        checkOut: "-",
        department: "HR",
        attendance: "Holiday",
        workedHours: "0.0",
      ),
      AttendanceRecord(
        employeeId: "EMP011",
        employeeName: "Tom Brown",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "-",
        checkOut: "-",
        department: "Finance",
        attendance: "Week Off",
        workedHours: "0.0",
      ),
      AttendanceRecord(
        employeeId: "EMP012",
        employeeName: "Sophie Clark",
        shift: "Morning",
        date: "2024-01-15",
        checkIn: "09:00 AM",
        checkOut: "06:00 PM",
        department: "Marketing",
        attendance: "Regularized",
        workedHours: "9.0",
      ),
    ];
  }

  void _searchEmployees(String query) {
    setState(() {
      List<AttendanceRecord> baseRecords = _selectedFilter.isEmpty 
          ? _allRecords 
          : _allRecords.where((record) => _matchesFilter(record, _selectedFilter)).toList();
          
      if (query.isEmpty) {
        _filteredRecords = baseRecords;
      } else {
        _filteredRecords = baseRecords.where((record) =>
          record.employeeName.toLowerCase().contains(query.toLowerCase()) ||
          record.employeeId.toLowerCase().contains(query.toLowerCase()) ||
          record.department.toLowerCase().contains(query.toLowerCase())
        ).toList();
      }
    });
  }

  bool _matchesFilter(AttendanceRecord record, String filter) {
    switch (filter) {
      case 'Present':
        return record.attendance == 'Present';
      case 'Absent':
        return record.attendance == 'Absent';
      case 'On Leave':
        return record.attendance == 'On Leave';
      case 'Holiday':
        return record.attendance == 'Holiday';
      case 'Week Off':
        return record.attendance == 'Week Off';
      case 'Half Day':
        return record.attendance == 'Half Day';
      case 'Regularized':
        return record.attendance == 'Regularized';
      default:
        return true;
    }
  }

  void _filterByAttendanceType(String attendanceType) {
    setState(() {
      _selectedFilter = _selectedFilter == attendanceType ? '' : attendanceType;
      _searchController.clear();
      
      if (_selectedFilter.isEmpty) {
        _filteredRecords = _allRecords;
      } else {
        _filteredRecords = _allRecords.where((record) => _matchesFilter(record, _selectedFilter)).toList();
      }
    });
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(_selectedFilter.isEmpty 
            ? 'Filter cleared - showing all records' 
            : 'Filtered by: $_selectedFilter'),
        duration: const Duration(seconds: 2),
      ),
    );
  }

  int _getCountForType(String type) {
    return _allRecords.where((record) => _matchesFilter(record, type)).length;
  }

  Future<void> _selectDate(BuildContext context, bool isFromDate) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: isFromDate ? _fromDate : _toDate,
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (picked != null) {
      setState(() {
        if (isFromDate) {
          _fromDate = picked;
        } else {
          _toDate = picked;
        }
      });
    }
  }

  String _formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }

  @override
  Widget build(BuildContext context) {
    final isWeb = MediaQuery.of(context).size.width > 600;
    
    return Scaffold(
      backgroundColor: const Color(0xFFE8F5E8),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 178, 123, 223),
        elevation: 0,
        title: Row(
          children: [
            Flexible(
              child: Text(
                'Welcome to SERV',
                style: TextStyle(
                  fontSize: isWeb ? 16 : 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Spacer(),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                'EN',
                style: TextStyle(
                  color: const Color(0xFF00796B),
                  fontSize: isWeb ? 12 : 10,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            const SizedBox(width: 4),
            Text(
              'MENU',
              style: TextStyle(
                fontSize: isWeb ? 12 : 10,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            color: const Color(0xFFE8F5E8),
            padding: EdgeInsets.all(isWeb ? 16 : 12),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(
                  Icons.chevron_right,
                  color: Colors.grey,
                  size: isWeb ? 20 : 16,
                ),
                ),
                
                const SizedBox(width: 4),
                Flexible(
                  child: Text(
                    'Attendance Reports',
                    style: TextStyle(
                      fontSize: isWeb ? 16 : 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                // Show current filter if active
                if (_selectedFilter.isNotEmpty) ...[
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.blue.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Filter: $_selectedFilter',
                          style: TextStyle(
                            fontSize: isWeb ? 12 : 10,
                            color: Colors.blue.shade700,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        GestureDetector(
                          onTap: () => _filterByAttendanceType(''),
                          child: Icon(
                            Icons.close,
                            size: isWeb ? 16 : 14,
                            color: Colors.blue.shade700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ],
            ),
          ),

          // Main Content
          Expanded(
            child: Container(
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    // Date Filter Section
                    Container(
                      padding: EdgeInsets.all(isWeb ? 16 : 12),
                      color: Colors.white,
                      child: Row(
                        children: [
                          // From Date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'From',
                                  style: TextStyle(
                                    fontSize: isWeb ? 14 : 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
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
                                      border: Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            _formatDate(_fromDate),
                                            style: TextStyle(
                                              fontSize: isWeb ? 14 : 12,
                                              color: Colors.black87,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.calendar_today,
                                          size: isWeb ? 16 : 14,
                                          color: Colors.grey.shade600,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(width: isWeb ? 16 : 8),
                          // To Date
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'To',
                                  style: TextStyle(
                                    fontSize: isWeb ? 14 : 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black87,
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
                                      border: Border.all(color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(6),
                                      color: Colors.white,
                                    ),
                                    child: Row(
                                      children: [
                                        Flexible(
                                          child: Text(
                                            _formatDate(_toDate),
                                            style: TextStyle(
                                              fontSize: isWeb ? 14 : 12,
                                              color: Colors.black87,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                        const SizedBox(width: 4),
                                        Icon(
                                          Icons.calendar_today,
                                          size: isWeb ? 16 : 14,
                                          color: Colors.grey.shade600,
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

                    // Buttons Section
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: isWeb ? 16 : 12),
                      child: Row(
                        children: [
                          Flexible(
                            child: ElevatedButton.icon(
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Downloading report...')),
                                );
                              },
                              icon: Icon(Icons.download, size: isWeb ? 16 : 14),
                              label: Text(
                                'Download Report',
                                style: TextStyle(fontSize: isWeb ? 14 : 12),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.grey.shade300,
                                foregroundColor: Colors.black87,
                                elevation: 0,
                                padding: EdgeInsets.symmetric(
                                  horizontal: isWeb ? 16 : 12,
                                  vertical: isWeb ? 10 : 8,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: isWeb ? 12 : 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                              _filteredRecords = _allRecords.where((record) {
      DateTime recordDate = DateTime.parse(record.date); // use correct format
      return recordDate.isAfter(_fromDate.subtract(Duration(days: 1))) &&
             recordDate.isBefore(_toDate.add(Duration(days: 1)));
    }).toList();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('Filters applied!')),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF1976D2),
                              foregroundColor: const Color.fromARGB(255, 233, 227, 227),
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
                    SizedBox(height: isWeb ? 16 : 12),

                    // Summary Cards
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: isWeb ? 16 : 12),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          int crossAxisCount = isWeb ? 4 : 2;
                          double childAspectRatio = isWeb ? 2.2 : 2.5;
                          
                          if (constraints.maxWidth < 600) {
                            crossAxisCount = 2;
                            childAspectRatio = 2.0;
                          }
                          
                          return GridView.count(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            crossAxisCount: crossAxisCount,
                            crossAxisSpacing: isWeb ? 8 : 6,
                            mainAxisSpacing: isWeb ? 8 : 6,
                            childAspectRatio: childAspectRatio,
                            children: [
                              _buildSummaryCard('Present', _getCountForType('Present').toString(), const Color(0xFFE1BEE7), isWeb),
                              _buildSummaryCard('Absent', _getCountForType('Absent').toString(), const Color(0xFFBBDEFB), isWeb),
                              _buildSummaryCard('On Leave', _getCountForType('On Leave').toString(), const Color(0xFFFFCC80), isWeb),
                              _buildSummaryCard('Holiday', _getCountForType('Holiday').toString(), const Color(0xFFA5D6A7), isWeb),
                              _buildSummaryCard('Week Off', _getCountForType('Week Off').toString(), const Color(0xFFFFAB91), isWeb),
                              _buildSummaryCard('Half Day', _getCountForType('Half Day').toString(), const Color(0xFFF8BBD9), isWeb),
                              _buildSummaryCard('Regularized', _getCountForType('Regularized').toString(), const Color(0xFFC8E6C9), isWeb),
                              
                            ],
                          );
                        },
                      ),
                    ),
                    SizedBox(height: isWeb ? 16 : 12),

                    // Search and Regularization
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: isWeb ? 16 : 12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 3,
                            child: SizedBox(
                              height: isWeb ? 40 : 35,
                              child: TextField(
                                controller: _searchController,
                                onChanged: _searchEmployees,
                                style: TextStyle(fontSize: isWeb ? 14 : 12),
                                decoration: InputDecoration(
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Colors.grey.shade500,
                                    fontSize: isWeb ? 14 : 12,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.search, 
                                    color: Colors.grey.shade600,
                                    size: isWeb ? 20 : 18,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(color: Colors.grey.shade400),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: BorderSide(color: Colors.grey.shade400),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(6),
                                    borderSide: const BorderSide(color: Color(0xFF1976D2)),
                                  ),
                                  filled: true,
                                  fillColor: Colors.white,
                                  contentPadding: EdgeInsets.symmetric(
                                    horizontal: isWeb ? 12 : 8,
                                    vertical: isWeb ? 8 : 6,
                                  ),
                                  isDense: true,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: isWeb ? 12 : 8),

                        ],
                      ),
                    ),
                    

                    // Attendance Table
                    Container(
                      height: 400,
                      margin: EdgeInsets.symmetric(horizontal: isWeb ? 16 : 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        children: [
                          // Table Header
                          Container(
                            padding: EdgeInsets.all(isWeb ? 12 : 8),
                            decoration: const BoxDecoration(
                              color: Color(0xFFE3F2FD),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8),
                                topRight: Radius.circular(8),
                              ),
                            ),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  _buildHeaderCell('Employee ID', isWeb ? 80 : 70, isWeb),
                                  _buildHeaderCell('Employee Name', isWeb ? 100 : 90, isWeb),
                                  _buildHeaderCell('Shift', isWeb ? 70 : 60, isWeb),
                                  _buildHeaderCell('Date', isWeb ? 80 : 70, isWeb),
                                  _buildHeaderCell('CheckIn', isWeb ? 70 : 60, isWeb),
                                  _buildHeaderCell('CheckOut', isWeb ? 70 : 60, isWeb),
                                  _buildHeaderCell('Department', isWeb ? 80 : 70, isWeb),
                                  _buildHeaderCell('Attendance', isWeb ? 80 : 70, isWeb),
                                  _buildHeaderCell('Total Worked Hours', isWeb ? 90 : 80, isWeb),
                                ],
                              ),
                            ),
                          ),
                          // Table Rows
                          Expanded(
                            child: ListView.builder(
                              itemCount: _filteredRecords.length,
                              itemBuilder: (context, index) {
                                final record = _filteredRecords[index];
                                return Container(
                                  padding: EdgeInsets.all(isWeb ? 12 : 8),
                                  decoration: BoxDecoration(
                                    border: Border(
                                      bottom: BorderSide(
                                        color: Colors.grey.shade200,
                                        width: 1,
                                      ),
                                    ),
                                  ),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        _buildDataCell(record.employeeId, isWeb ? 80 : 70, isWeb),
                                        _buildDataCell(record.employeeName, isWeb ? 100 : 90, isWeb),
                                        _buildDataCell(record.shift, isWeb ? 70 : 60, isWeb),
                                        _buildDataCell(record.date, isWeb ? 80 : 70, isWeb),
                                        _buildDataCell(record.checkIn, isWeb ? 70 : 60, isWeb),
                                        _buildDataCell(record.checkOut, isWeb ? 70 : 60, isWeb),
                                        _buildDataCell(record.department, isWeb ? 80 : 70, isWeb),
                                        _buildDataCell(record.attendance, isWeb ? 80 : 70, isWeb),
                                        _buildDataCell(record.workedHours, isWeb ? 90 : 80, isWeb),
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
                    SizedBox(height: isWeb ? 16 : 12),
                  ],
                ),
              ),
            ),
          ),
        ],
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
          color: Colors.black87,
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
        style: TextStyle(
          fontSize: isWeb ? 12 : 10,
          color: Colors.black87,
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
    );
  }

  Widget _buildSummaryCard(String title, String count, Color color, bool isWeb) {
    bool isSelected = _selectedFilter == title;
    
    return GestureDetector(
      onTap: () => _filterByAttendanceType(title),
      child: Container(
        padding: EdgeInsets.all(isWeb ? 8 : 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(8),
          border: isSelected 
              ? Border.all(color: Colors.blue, width: 2)
              : null,
          boxShadow: isSelected 
              ? [BoxShadow(
                  color: Colors.blue.withOpacity(0.3),
                  blurRadius: 4,
                  offset: const Offset(0, 2),
                )]
              : null,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: isWeb ? 9 : 8,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
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
                fontSize: isWeb ? 16 : 14,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
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