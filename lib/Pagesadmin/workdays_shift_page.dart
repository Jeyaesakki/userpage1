
// import 'package:flutter/material.dart';
// import 'create_shift_page.dart';
// import 'shift_permission_page.dart';

// // Theme Colors
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class WorkdaysShiftPage extends StatefulWidget {
//   const WorkdaysShiftPage({super.key});

//   @override
//   State<WorkdaysShiftPage> createState() => _WorkdaysShiftPageState();
// }

// class _WorkdaysShiftPageState extends State<WorkdaysShiftPage> {
//   bool _isShiftPermissionClicked = false;
//   bool _isCreateShiftClicked = false;

//   List<Map<String, String>> _createdShifts = [];

//   void _navigateToShiftPermission(BuildContext context) {
//     Navigator.push(
//       context,
//       MaterialPageRoute(builder: (context) => const ShiftPermissionPage()),
//     );
//   }

//   void _navigateToCreateShift(BuildContext context) async {
//     final result = await Navigator.push<Map<String, String>>(
//       context,
//       MaterialPageRoute(builder: (context) => CreateShiftPage()),
//     );

//     if (result != null) {
//       setState(() {
//         _createdShifts.add(result);
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundTop,
//       appBar: AppBar(
//         title: const Text("Workdays & Shifts"),
//         backgroundColor: kAppBarColor,
//         foregroundColor: kTextColor,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               const Text(
//                 "Shift Configuration",
//                 style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 8),
//               const Text(
//                 "Choose your shift",
//                 style: TextStyle(fontSize: 14, color: Colors.black54),
//               ),
//               const SizedBox(height: 16),

//               const _ShiftTemplateCard(
//                 title: "Template 1",
//                 time: "09:30 AM - 06:30 PM",
//               ),
//               const SizedBox(height: 10),
//               const _ShiftTemplateCard(
//                 title: "Template 2",
//                 time: "07:30 AM - 04:30 PM",
//               ),
//               const SizedBox(height: 10),
//               const _ShiftTemplateCard(
//                 title: "Template 3",
//                 time: "12:30 AM - 11:59 PM",
//               ),
//               const SizedBox(height: 10),

//               for (int i = 0; i < _createdShifts.length; i++) ...[
//                 _ShiftTemplateCard(
//                   title: "Template ${i + 4}: ${_createdShifts[i]["shiftName"] ?? "Shift"}",
//                   time: "${_createdShifts[i]["startTime"]} - ${_createdShifts[i]["endTime"]}",
//                 ),
//                 const SizedBox(height: 10),
//               ],

//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       backgroundColor: _isShiftPermissionClicked ? kButtonColor : Colors.transparent,
//                       foregroundColor: _isShiftPermissionClicked ? kTextColor : Colors.black,
//                       side: const BorderSide(color: kButtonColor),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isShiftPermissionClicked = true;
//                         _isCreateShiftClicked = false;
//                       });
//                       _navigateToShiftPermission(context);
//                     },
//                     child: const Text("Shift Permissions"),
//                   ),
//                   OutlinedButton(
//                     style: OutlinedButton.styleFrom(
//                       backgroundColor: _isCreateShiftClicked ? kButtonColor : Colors.transparent,
//                       foregroundColor: _isCreateShiftClicked ? kTextColor : Colors.black,
//                       side: const BorderSide(color: kButtonColor),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
//                     ),
//                     onPressed: () {
//                       setState(() {
//                         _isCreateShiftClicked = true;
//                         _isShiftPermissionClicked = false;
//                       });
//                       _navigateToCreateShift(context);
//                     },
//                     child: const Text("Create Shift"),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 30),
//               _buildTableHeader(),
//               const Divider(),
//               _buildTableFooter(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildTableHeader() {
//     return const SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           _HeaderCell("Shift Name"),
//           _HeaderCell("Start Time"),
//           _HeaderCell("End Time"),
//           _HeaderCell("No. of hours"),
//           _HeaderCell("OT(mins)"),
//           _HeaderCell("Half Day Time"),
//           _HeaderCell("Min PT"),
//           _HeaderCell("Max PT"),
//           _HeaderCell("Max OT"),
//           _HeaderCell("Min OT"),
//           _HeaderCell("Group Name"),
//           _HeaderCell("Random count"),
//           _HeaderCell("End BufferName"),
//           _HeaderCell("Staff BufferName"),
//           _HeaderCell("Group Name"),
//           _HeaderCell("Break Count"),
//           _HeaderCell("Delete"),
//         ],
//       ),
//     );
//   }

//   Widget _buildTableFooter() {
//     return const SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(children: []),
//     );
//   }
// }

// class _ShiftTemplateCard extends StatelessWidget {
//   final String title;
//   final String time;

//   const _ShiftTemplateCard({required this.title, required this.time});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: kAppBarColor.withOpacity(0.2),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       child: SizedBox(
//         width: double.infinity,
//         height: 70,
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//               Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
//               const Spacer(),
//               Text(
//                 time,
//                 style: const TextStyle(fontSize: 12),
//                 textAlign: TextAlign.right,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class _HeaderCell extends StatelessWidget {
//   final String label;

//   const _HeaderCell(this.label);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 100,
//       padding: const EdgeInsets.all(8),
//       alignment: Alignment.center,
//       child: Text(
//         label,
//         textAlign: TextAlign.center,
//         style: const TextStyle(
//           fontWeight: FontWeight.w600,
//           fontSize: 12,
//           color: kButtonColor,
//         ),
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';
import 'create_shift_page.dart';
import 'shift_permission_page.dart';

// Theme Colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class WorkdaysShiftPage extends StatefulWidget {
  const WorkdaysShiftPage({super.key});

  @override
  State<WorkdaysShiftPage> createState() => _WorkdaysShiftPageState();
}

class _WorkdaysShiftPageState extends State<WorkdaysShiftPage> {
  bool _isShiftPermissionClicked = false;
  bool _isCreateShiftClicked = false;

  List<Map<String, String>> _createdShifts = [];

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
        _createdShifts.add(result);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackgroundTop,
      appBar: AppBar(
        title: const Text("Workdays & Shifts"),
        backgroundColor: kAppBarColor,
        foregroundColor: kTextColor,
      ),
      body: Container(
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
                  title: "Template ${i + 4}: ${_createdShifts[i]["shiftName"] ?? "Shift"}",
                  time: "${_createdShifts[i]["startTime"]} - ${_createdShifts[i]["endTime"]}",
                ),
                const SizedBox(height: 10),
              ],

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      backgroundColor: _isShiftPermissionClicked ? kButtonColor : Colors.transparent,
                      foregroundColor: _isShiftPermissionClicked ? kTextColor : Colors.black,
                      side: const BorderSide(color: kButtonColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
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
                      backgroundColor: _isCreateShiftClicked ? kButtonColor : Colors.transparent,
                      foregroundColor: _isCreateShiftClicked ? kTextColor : Colors.black,
                      side: const BorderSide(color: kButtonColor),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
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
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Column(
        children: _createdShifts.map((shift) {
          return Row(
            children: [
              _CustomDataCell(shift["shiftName"] ?? ""),
              _CustomDataCell(shift["startTime"] ?? ""),
              _CustomDataCell(shift["endTime"] ?? ""),
              _CustomDataCell("8 hrs"),
              _CustomDataCell("30"),
              _CustomDataCell("4 hrs"),
              _CustomDataCell("2 hrs"),
              _CustomDataCell("6 hrs"),
              _CustomDataCell("2 hrs"),
              _CustomDataCell("1 hr"),
              _CustomDataCell(shift["groupName"] ?? ""),
              _CustomDataCell("5"),
              _CustomDataCell("10 min"),
              _CustomDataCell("15 min"),
              _CustomDataCell(shift["groupName"] ?? ""),
              _CustomDataCell(shift["breakConfig"] ?? ""),
              IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () {
                  setState(() {
                    _createdShifts.remove(shift);
                  });
                },
              ),
            ],
          );
        }).toList(),
      ),
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
      color: kAppBarColor.withOpacity(0.2),
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
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 12,
          color: kButtonColor,
        ),
      ),
    );
  }
}

class _CustomDataCell extends StatelessWidget {
  final String value;

  const _CustomDataCell(this.value);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      padding: const EdgeInsets.all(8),
      alignment: Alignment.center,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: const TextStyle(fontSize: 12),
      ),
    );
  }
}
