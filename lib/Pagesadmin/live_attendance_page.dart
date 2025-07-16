


// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import 'employee_list_page.dart';
// import 'company_setup_page.dart';

// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;
// const Color kPopupColor = Color(0xFFEDE7F6);

// class LiveAttendancePage extends StatelessWidget {
//   final CompanyProfile companyProfile;

//   LiveAttendancePage({super.key, required this.companyProfile});

//   // Dummy employees
//   final List<String> checkInEmployees = [
//     "John Smith - 9:00 AM",
//     "Priya R - 9:10 AM",
//     "David R - 8:55 AM",
//   ];

//   final List<String> checkOutEmployees = [
//     "Sarah J - 6:00 PM",
//     "Kumar P - 5:45 PM",
//   ];

//   final List<String> presentEmployees = [
//     "John Smith",
//     "Sarah J",
//     "Kumar P",
//   ];

//   final List<String> absentEmployees = ["Ravi K", "Deepa M"];

//   final List<String> onLeaveEmployees = ["Meena S"];

//   final List<String> halfDayEmployees = ["Lakshmi V"];
//   final List<String> lateCheckInEmployees = ["Naveen B"];
//   final List<String> earlyCheckoutEmployees = ["Ramya R"];
//   final List<String> waitingApprovalEmployees = ["Suresh M"];
//   final List<String> fieldAttendanceEmployees = ["Gopi A"];

//   @override
//   Widget build(BuildContext context) {
//     String currentDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
//     String currentTime = DateFormat('hh:mm a').format(DateTime.now());

//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundTop,
//       resizeToAvoidBottomInset: false,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.only(bottom: 20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildHeader(context),
//               const SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text("Today - $currentDate", style: const TextStyle(fontWeight: FontWeight.w500)),
//                     Text(currentTime, style: const TextStyle(color: Colors.grey)),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                   children: [
//                     _popupButton(context, "Check-in", checkInEmployees),
//                     _popupButton(context, "Check-out", checkOutEmployees),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 12),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     _statusBox(context, "Present", presentEmployees, Colors.green),
//                     _statusBox(context, "Absent", absentEmployees, Colors.red),
//                     _statusBox(context, "On Leave", onLeaveEmployees, Colors.orange),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               const Center(
//                 child: Text("Activity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//               ),
//               const SizedBox(height: 10),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 child: GridView.count(
//                   crossAxisCount: 3,
//                   shrinkWrap: true,
//                   physics: const NeverScrollableScrollPhysics(),
//                   crossAxisSpacing: 10,
//                   mainAxisSpacing: 10,
//                   childAspectRatio: 1,
//                   children: [
//                     _activityCard(context, "Half Day", halfDayEmployees),
//                     _activityCard(context, "Late Check-in", lateCheckInEmployees),
//                     _activityCard(context, "Early Check-out", earlyCheckoutEmployees),
//                     _activityCard(context, "Waiting for Approvals", waitingApprovalEmployees, fontSize: 10),
//                     _activityCard(context, "Field Attendance", fieldAttendanceEmployees),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Container(
//       width: double.infinity,
//       padding: const EdgeInsets.only(top: 40, bottom: 16, left: 16, right: 16),
//       decoration: const BoxDecoration(
//         color: kAppBarColor,
//         borderRadius: BorderRadius.only(
//           bottomLeft: Radius.circular(40),
//           bottomRight: Radius.circular(40),
//         ),
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const Text("Live Attendance",
//               style: TextStyle(color: kTextColor, fontSize: 22, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 8),
//           Text(companyProfile.name, style: const TextStyle(color: kTextColor)),
//           Text("ID | ${companyProfile.adminName}", style: const TextStyle(color: Colors.white70)),
//           const SizedBox(height: 16),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.end,
//             children: [
//               const CircleAvatar(
//                 backgroundColor: Colors.white,
//                 child: Icon(Icons.map, color: Colors.green),
//               ),
//               const SizedBox(width: 16),
//               GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => EmployeeListPage()),
//                   );
//                 },
//                 child: const CircleAvatar(
//                   backgroundColor: Colors.white,
//                   child: Icon(Icons.people, color: Colors.blue),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _popupButton(BuildContext context, String title, List<String> employees) {
//     return ElevatedButton(
//       onPressed: () => _showPopup(context, title, employees),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: kButtonColor,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
//       ),
//       child: Text(title, style: const TextStyle(color: kTextColor)),
//     );
//   }

//   Widget _statusBox(BuildContext context, String title, List<String> employees, Color color) {
//     return Expanded(
//       child: GestureDetector(
//         onTap: () => _showPopup(context, title, employees),
//         child: Container(
//           margin: const EdgeInsets.symmetric(horizontal: 4),
//           padding: const EdgeInsets.all(10),
//           decoration: BoxDecoration(
//             color: color.withOpacity(0.1),
//             border: Border.all(color: color),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Column(
//             children: [
//               Text("${employees.length}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color)),
//               const SizedBox(height: 4),
//               Text(title, style: TextStyle(color: color)),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _activityCard(BuildContext context, String title, List<String> employees, {double fontSize = 12}) {
//     return GestureDetector(
//       onTap: () => _showPopup(context, title, employees),
//       child: Container(
//         padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
//         decoration: BoxDecoration(
//           color: kPrimaryBackgroundBottom.withOpacity(0.1),
//           border: Border.all(color: kAppBarColor.withOpacity(0.3)),
//           borderRadius: BorderRadius.circular(12),
//         ),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text("${employees.length}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 4),
//             Text(title, style: TextStyle(fontSize: fontSize), textAlign: TextAlign.center),
//           ],
//         ),
//       ),
//     );
//   }

//   void _showPopup(BuildContext context, String title, List<String> employees) {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         backgroundColor: kPopupColor,
//         title: Text(
//           "$title - ${employees.length} Employees",
//           style: const TextStyle(fontWeight: FontWeight.bold, color: kAppBarColor),
//         ),
//         content: SizedBox(
//           width: double.maxFinite,
//           height: 300,
//           child: ListView.builder(
//             itemCount: employees.length,
//             itemBuilder: (_, index) => Padding(
//               padding: const EdgeInsets.symmetric(vertical: 6),
//               child: Text(
//                 employees[index],
//                 style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
//               ),
//             ),
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Close", style: TextStyle(color: kAppBarColor)),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'company_setup_page.dart';
import 'employee_list_page.dart';

class LiveAttendancePage extends StatelessWidget {
  final CompanyProfile companyProfile;

  const LiveAttendancePage({super.key, required this.companyProfile});

  @override
  Widget build(BuildContext context) {
    String currentDate = DateFormat('dd MMMM yyyy').format(DateTime.now());
    String currentTime = DateFormat('hh:mm a').format(DateTime.now());

    final presentCount = 46;
    final absentCount = 8;
    final onLeaveCount = 2;

    final checkInCount = 32;
    final checkOutCount = 18;

    final halfDay = 2;
    final lateCheckIn = 0;
    final earlyCheckOut = 0;
    final waitingForApprovals = 1;
    final fieldAttendance = 3;

    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.only(
                  top: 40,
                  bottom: 16,
                  left: 16,
                  right: 16,
                ),
                decoration: const BoxDecoration(
                  color: Color(0xFF8C6EAF),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Live Attendance",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      companyProfile.name,
                      style: const TextStyle(color: Colors.white),
                    ),
                    Text(
                      "ID | ${companyProfile.adminName}",
                      style: const TextStyle(color: Colors.white70),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Column(
                          children: const [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(Icons.map, color: Colors.green),
                            ),
                            SizedBox(height: 4),
                            Text("Map", style: TextStyle(color: Colors.white, fontSize: 12)),
                          ],
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => const EmployeeListPage(),
                              ),
                            );
                          },
                          child: Column(
                            children: const [
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                child: Icon(Icons.people, color: Colors.blue),
                              ),
                              SizedBox(height: 4),
                              Text("Employee List", style: TextStyle(color: Colors.white, fontSize: 12)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Today - $currentDate", style: const TextStyle(fontWeight: FontWeight.w500)),
                    Text(currentTime, style: const TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 16)),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _showEmployeePopup(context, "Checked-in Employees", checkInCount);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF655193),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text("Check-in $checkInCount", style: const TextStyle(color: Colors.white)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _showEmployeePopup(context, "Checked-out Employees", checkOutCount);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF655193),
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                      ),
                      child: Text("Check-out $checkOutCount", style: const TextStyle(color: Colors.white)),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _statusBox(context, "Present", presentCount, Colors.green),
                    _statusBox(context, "Absent", absentCount, Colors.red),
                    _statusBox(context, "On Leave", onLeaveCount, Colors.orange),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              const Center(
                child: Text("Activity", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 10),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1,
                  children: [
                    GestureDetector(
                      onTap: () => _showEmployeePopup(context, "Half Day", halfDay),
                      child: _activityCard("Half Day", halfDay),
                    ),
                    GestureDetector(
                      onTap: () => _showEmployeePopup(context, "Late Check-in", lateCheckIn),
                      child: _activityCard("Late Check-in", lateCheckIn),
                    ),
                    GestureDetector(
                      onTap: () => _showEmployeePopup(context, "Early Check-out", earlyCheckOut),
                      child: _activityCard("Early Check-out", earlyCheckOut),
                    ),
                    GestureDetector(
                      onTap: () => _showEmployeePopup(context, "Waiting for Approvals", waitingForApprovals),
                      child: _activityCard("Waiting for Approvals", waitingForApprovals, fontSize: 10),
                    ),
                    GestureDetector(
                      onTap: () => _showEmployeePopup(context, "Field Attendance", fieldAttendance),
                      child: _activityCard("Field Attendance", fieldAttendance),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showEmployeePopup(BuildContext context, String title, int count) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        backgroundColor: const Color(0xFFF3E5F5),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, color: Color(0xFF6A1B9A))),
        content: SizedBox(
          width: double.maxFinite,
          height: 300,
          child: ListView.builder(
            itemCount: count,
            itemBuilder: (ctx, index) {
              return ListTile(
                leading: const CircleAvatar(
                  backgroundColor: Color(0xFFCE93D8),
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text("Employee ${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text("ID: EMP00${index + 1}", style: const TextStyle(fontWeight: FontWeight.bold)),
              );
            },
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text("Close", style: TextStyle(color: Color(0xFF6A1B9A))),
          ),
        ],
      ),
    );
  }

  Widget _statusBox(BuildContext context, String title, int count, Color color) {
    return Expanded(
      child: GestureDetector(
        onTap: () => _showEmployeePopup(context, "$title Employees", count),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 4),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            border: Border.all(color: color),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Text(
                "$count",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: color),
              ),
              const SizedBox(height: 4),
              Text(title, style: TextStyle(color: color, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _activityCard(String title, int value, {double fontSize = 12}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFD1C4E9).withOpacity(0.1),
        border: Border.all(color: const Color(0xFF8C6EAF).withOpacity(0.3)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$value", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 4),
          Text(title, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
        ],
      ),
    );
  }
}