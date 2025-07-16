
// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:serv_app/Pagesusers/face_rec_page.dart';
// import 'package:serv_app/Pagesusers/myserv_page.dart'; // ✅ Import MyServPage

// class AttendancePage extends StatefulWidget {
//   const AttendancePage({super.key});

//   @override
//   _AttendancePageState createState() => _AttendancePageState();
// }

// class _AttendancePageState extends State<AttendancePage> {
//   String name = "Dharani";
//   String role = "Employee";
//   String id = "2113391075007";

//   bool isShiftSelected = false;
//   bool isCheckedIn = false;
//   Timer? _timer;
//   int _elapsedSeconds = 0;

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     setState(() {
//       isCheckedIn = true;
//     });
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _elapsedSeconds++;
//       });
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     setState(() {
//       isCheckedIn = false;
//       isShiftSelected = false;
//       _elapsedSeconds = 0;
//     });
//   }

//   String _format(int n) => n.toString().padLeft(2, '0');

//   @override
//   Widget build(BuildContext context) {
//     final currentDate = DateTime.now();
//     final formattedDate =
//         "${currentDate.day.toString().padLeft(2, '0')} ${_monthName(currentDate.month)} ${currentDate.year}";

//     final hours = _elapsedSeconds ~/ 3600;
//     final minutes = (_elapsedSeconds % 3600) ~/ 60;
//     final seconds = _elapsedSeconds % 60;

//     return Scaffold(
//       backgroundColor: const Color(0xFFB9B9F5),
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Column(
//             children: [
//               // Back and title
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.black),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   const Text(
//                     "Attendance",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 8),

//               // Profile Card
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 3),
//                     Text("$id / $role", style: const TextStyle(fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 3),
//                     Row(
//                       children: [
//                         const Icon(Icons.calendar_today, size: 14),
//                         const SizedBox(width: 5),
//                         Text(formattedDate, style: const TextStyle(fontSize: 13)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),

//               const SizedBox(height: 20),

//               const Icon(Icons.access_time, size: 30),
//               const SizedBox(height: 8),

//               // Timer
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _timeField(_format(hours)),
//                   const SizedBox(width: 6),
//                   _timeField(_format(minutes)),
//                   const SizedBox(width: 6),
//                   _timeField(_format(seconds)),
//                   const SizedBox(width: 6),
//                   const Text("Hrs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               // Shift 1 Button
//               ElevatedButton.icon(
//                 onPressed: isCheckedIn
//                     ? null
//                     : () {
//                         setState(() {
//                           isShiftSelected = true;
//                         });
//                       },
//                 icon: const Icon(Icons.schedule, size: 18),
//                 label: const Text("Shift 1", style: TextStyle(fontSize: 14)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.deepPurple,
//                   foregroundColor: Colors.white,
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Action Buttons
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 10,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   _actionButton(Icons.face, "Face Detection", Colors.teal, () {
//                     if (!isShiftSelected) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Please select Shift 1 before Face Detection.")),
//                       );
//                       return;
//                     }
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => FaceRecPage(onFaceDetected: _startTimer),
//                       ),
//                     );
//                   }),

//                   !isCheckedIn
//                       ? ElevatedButton.icon(
//                           onPressed: isShiftSelected ? _startTimer : null,
//                           icon: const Icon(Icons.check_circle_outline, size: 18),
//                           label: const Text("Check In", style: TextStyle(fontSize: 13)),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: isShiftSelected ? Colors.teal : Colors.grey,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                         )
//                       : _actionButton(Icons.logout, "Check Out", Colors.red, _stopTimer),
//                 ],
//               ),

//               const Spacer(),

//               // ✅ My Serve Button Navigation
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const MyServPage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.white,
//                   foregroundColor: Colors.black,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                 ),
//                 child: const Text("My Serv", style: TextStyle(fontSize: 13)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String _monthName(int month) {
//     const months = [
//       "Jan", "Feb", "Mar", "Apr", "May", "Jun",
//       "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
//     ];
//     return months[month - 1];
//   }

//   Widget _timeField(String value) {
//     return Container(
//       width: 36,
//       height: 36,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: Colors.black54),
//       ),
//       child: Text(
//         value,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//       ),
//     );
//   }

//   Widget _actionButton(IconData icon, String label, Color color, VoidCallback onPressed) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, size: 18),
//       label: Text(label, style: const TextStyle(fontSize: 13)),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         elevation: 3,
//       ),
//     );
//   }
// }

// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:serv_app/Pagesusers/face_rec_page.dart';
// import 'package:serv_app/Pagesusers/myserv_page.dart';

// // Color Constants
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class AttendancePage extends StatefulWidget {
//   const AttendancePage({super.key});

//   @override
//   _AttendancePageState createState() => _AttendancePageState();
// }

// class _AttendancePageState extends State<AttendancePage> {
//   String name = "Dharani";
//   String role = "Employee";
//   String id = "2113391075007";

//   bool isShiftSelected = false;
//   bool isCheckedIn = false;
//   Timer? _timer;
//   int _elapsedSeconds = 0;

//   @override
//   void dispose() {
//     _timer?.cancel();
//     super.dispose();
//   }

//   void _startTimer() {
//     setState(() {
//       isCheckedIn = true;
//     });
//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _elapsedSeconds++;
//       });
//     });
//   }

//   void _stopTimer() {
//     _timer?.cancel();
//     setState(() {
//       isCheckedIn = false;
//       isShiftSelected = false;
//       _elapsedSeconds = 0;
//     });
//   }

//   String _format(int n) => n.toString().padLeft(2, '0');

//   @override
//   Widget build(BuildContext context) {
//     final currentDate = DateTime.now();
//     final formattedDate =
//         "${currentDate.day.toString().padLeft(2, '0')} ${_monthName(currentDate.month)} ${currentDate.year}";

//     final hours = _elapsedSeconds ~/ 3600;
//     final minutes = (_elapsedSeconds % 3600) ~/ 60;
//     final seconds = _elapsedSeconds % 60;

//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundBottom,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//           child: Column(
//             children: [
//               Row(
//                 children: [
//                   IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.black),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                   const Text(
//                     "Attendance",
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 18,
//                       color: Colors.black,
//                     ),
//                   ),
//                 ],
//               ),
//               const SizedBox(height: 8),

//               // Profile Card
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   color: kPrimaryBackgroundTop,
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 3),
//                     Text("$id / $role", style: const TextStyle(fontWeight: FontWeight.bold)),
//                     const SizedBox(height: 3),
//                     Row(
//                       children: [
//                         const Icon(Icons.calendar_today, size: 14),
//                         const SizedBox(width: 5),
//                         Text(formattedDate, style: const TextStyle(fontSize: 13)),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//               const SizedBox(height: 20),
//               SizedBox(
//                         height: 40,
//                         width: 40,
//                         child: Image.asset('assets/images/clock.png'),
//                       ),
//               //const Icon(Icons.access_time, size: 70),
//               const SizedBox(height: 8),

//               // Timer Display
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   _timeField(_format(hours)),
//                   const SizedBox(width: 6),
//                   _timeField(_format(minutes)),
//                   const SizedBox(width: 6),
//                   _timeField(_format(seconds)),
//                   const SizedBox(width: 6),
//                   const Text("Hrs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
//                 ],
//               ),
//               const SizedBox(height: 16),

//               // Shift Button
//               ElevatedButton.icon(
//                 onPressed: isCheckedIn
//                     ? null
//                     : () {
//                         setState(() {
//                           isShiftSelected = true;
//                         });
//                       },
//                 icon: const Icon(Icons.schedule, size: 18),
//                 label: const Text("Shift 1", style: TextStyle(fontSize: 14)),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: kButtonColor,
//                   foregroundColor: kTextColor,
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // Action Buttons
//               Wrap(
//                 spacing: 12,
//                 runSpacing: 10,
//                 alignment: WrapAlignment.center,
//                 children: [
//                   _actionButton(Icons.face, "Face Detection", Colors.teal, () {
//                     if (!isShiftSelected) {
//                       ScaffoldMessenger.of(context).showSnackBar(
//                         const SnackBar(content: Text("Please select Shift 1 before Face Detection.")),
//                       );
//                       return;
//                     }
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => FaceRecPage(onFaceDetected: _startTimer),
//                       ),
//                     );
//                   }),

//                   !isCheckedIn
//                       ? ElevatedButton.icon(
//                           onPressed: isShiftSelected ? _startTimer : null,
//                           icon: const Icon(Icons.check_circle_outline, size: 18),
//                           label: const Text("Check In", style: TextStyle(fontSize: 13)),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: isShiftSelected ? Colors.teal : Colors.grey,
//                             foregroundColor: Colors.white,
//                             padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//                           ),
//                         )
//                       : _actionButton(Icons.logout, "Check Out", Colors.red, _stopTimer),
//                 ],
//               ),

//               const Spacer(),

//               // MyServ Button
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const MyServPage()),
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: kPrimaryBackgroundTop,
//                   foregroundColor: Colors.black,
//                   elevation: 2,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(16),
//                   ),
//                   padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
//                 ),
//                 child: const Text("My Serv", style: TextStyle(fontSize: 15)),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String _monthName(int month) {
//     const months = [
//       "Jan", "Feb", "Mar", "Apr", "May", "Jun",
//       "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
//     ];
//     return months[month - 1];
//   }

//   Widget _timeField(String value) {
//     return Container(
//       width: 36,
//       height: 36,
//       alignment: Alignment.center,
//       decoration: BoxDecoration(
//         color: kPrimaryBackgroundTop,
//         borderRadius: BorderRadius.circular(6),
//         border: Border.all(color: Colors.black54),
//       ),
//       child: Text(
//         value,
//         style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
//       ),
//     );
//   }

//   Widget _actionButton(IconData icon, String label, Color color, VoidCallback onPressed) {
//     return ElevatedButton.icon(
//       onPressed: onPressed,
//       icon: Icon(icon, size: 18),
//       label: Text(label, style: const TextStyle(fontSize: 13)),
//       style: ElevatedButton.styleFrom(
//         backgroundColor: color,
//         foregroundColor: Colors.white,
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         elevation: 3,
//       ),
//     );
//   }
// }
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:serv_app/Pagesusers/face_rec_page.dart';

// Color Constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class AttendancePage extends StatefulWidget {
  const AttendancePage({super.key});

  @override
  _AttendancePageState createState() => _AttendancePageState();
}

class _AttendancePageState extends State<AttendancePage> {
  String name = "Dharani";
  String role = "Employee";
  String id = "2113391075007";

  bool isShiftSelected = false;
  bool isCheckedIn = false;
  Timer? _timer;
  int _elapsedSeconds = 0;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    setState(() {
      isCheckedIn = true;
    });
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        _elapsedSeconds++;
      });
    });
  }

  void _stopTimer() {
    _timer?.cancel();
    setState(() {
      isCheckedIn = false;
      isShiftSelected = false;
      _elapsedSeconds = 0;
    });
  }

  String _format(int n) => n.toString().padLeft(2, '0');

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final formattedDate =
        "${currentDate.day.toString().padLeft(2, '0')} ${_monthName(currentDate.month)} ${currentDate.year}";

    final hours = _elapsedSeconds ~/ 3600;
    final minutes = (_elapsedSeconds % 3600) ~/ 60;
    final seconds = _elapsedSeconds % 60;

    return Scaffold(
      backgroundColor: kPrimaryBackgroundBottom,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.black),
                    onPressed: () => Navigator.pop(context),
                  ),
                  const Text(
                    "Attendance",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),

              // Profile Card
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: kPrimaryBackgroundTop,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 3),
                    Text("$id / $role", style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 3),
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 14),
                        const SizedBox(width: 5),
                        Text(formattedDate, style: const TextStyle(fontSize: 13)),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              SizedBox(
                height: 40,
                width: 40,
                child: Image.asset('assets/images/clock.png'),
              ),
              const SizedBox(height: 8),

              // Timer Display
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _timeField(_format(hours)),
                  const SizedBox(width: 6),
                  _timeField(_format(minutes)),
                  const SizedBox(width: 6),
                  _timeField(_format(seconds)),
                  const SizedBox(width: 6),
                  const Text("Hrs", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13)),
                ],
              ),
              const SizedBox(height: 16),

              // Shift Button
              ElevatedButton.icon(
                onPressed: isCheckedIn
                    ? null
                    : () {
                        setState(() {
                          isShiftSelected = true;
                        });
                      },
                icon: const Icon(Icons.schedule, size: 18),
                label: const Text("Shift 1", style: TextStyle(fontSize: 14)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  foregroundColor: kTextColor,
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
              ),
              const SizedBox(height: 20),

              // Action Buttons
              Wrap(
                spacing: 12,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  _actionButton(Icons.face, "Face Detection", Colors.teal, () {
                    if (!isShiftSelected) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Please select Shift 1 before Face Detection.")),
                      );
                      return;
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => FaceRecPage(onFaceDetected: _startTimer),
                      ),
                    );
                  }),
                  !isCheckedIn
                      ? ElevatedButton.icon(
                          onPressed: isShiftSelected ? _startTimer : null,
                          icon: const Icon(Icons.check_circle_outline, size: 18),
                          label: const Text("Check In", style: TextStyle(fontSize: 13)),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: isShiftSelected ? Colors.teal : Colors.grey,
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                        )
                      : _actionButton(Icons.logout, "Check Out", Colors.red, _stopTimer),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _monthName(int month) {
    const months = [
      "Jan", "Feb", "Mar", "Apr", "May", "Jun",
      "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
    ];
    return months[month - 1];
  }

  Widget _timeField(String value) {
    return Container(
      width: 36,
      height: 36,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kPrimaryBackgroundTop,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.black54),
      ),
      child: Text(
        value,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
      ),
    );
  }

  Widget _actionButton(IconData icon, String label, Color color, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      icon: Icon(icon, size: 18),
      label: Text(label, style: const TextStyle(fontSize: 13)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 3,
      ),
    );
  }
}
