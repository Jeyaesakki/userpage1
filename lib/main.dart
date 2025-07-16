// import 'package:flutter/material.dart';
// import 'package:serv_app/Pagesusers/attendance_model_page.dart';
// import 'package:serv_app/Pagesusers/login_page.dart';
// import 'package:serv_app/Pagesadmin/leave_page.dart';
// import 'package:serv_app/Pagesadmin/leave_form_page.dart'; // Add this if you're using a separate leave form page

// void main() {
//   // 🔥 Dummy Attendance Data
//   AttendanceData sampleData = AttendanceData(
//     presentCount: 10,
//     absentCount: 2,
//     leaveCount: 0,
//     lateCheckIn: 0,
//     earlyCheckOut: 2,
//     permissionCount: 0,
//     presentDates: [
//       DateTime(2025, 7, 1),
//       DateTime(2025, 7, 3),
//       DateTime(2025, 7, 4),
//       DateTime(2025, 7, 5),
//       DateTime(2025, 7, 6),
//       DateTime(2025, 7, 7),
//       DateTime(2025, 7, 8),
//       DateTime(2025, 7, 9),
//       DateTime(2025, 7, 10),
//       DateTime(2025, 7, 11),
//     ],
//     absentDates: [DateTime(2025, 7, 2)],
//     totalDays: 12,
//   );

//   runApp(MyApp(attendanceData: sampleData));
// }

// class MyApp extends StatelessWidget {
//   final AttendanceData attendanceData;

//   const MyApp({super.key, required this.attendanceData});

//   @override
//   Widget build(BuildContext context) {
//     ThemeData myTheme = ThemeData(
//       fontFamily: 'Poppins', 
//       scaffoldBackgroundColor: const Color(0xFFF8F6FF),
//       cardColor: Colors.white,
//       iconTheme: const IconThemeData(color: Color(0xFF0F3D3E)),
//       textTheme: const TextTheme(
//         bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
//       ),
//       appBarTheme: const AppBarTheme(
//         backgroundColor: Color(0xFF8C6EAF),
//         titleTextStyle: TextStyle(
//           color: Colors.white,
//           fontSize: 18,
//           fontWeight: FontWeight.bold,
//         ),
//         iconTheme: IconThemeData(color: Colors.white),
//         elevation: 2,
//       ),
//       elevatedButtonTheme: ElevatedButtonThemeData(
//         style: ElevatedButton.styleFrom(
//           backgroundColor: const Color(0xFF655193),
//           foregroundColor: Colors.white,
//           padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
//           textStyle: const TextStyle(fontSize: 16),
//         ),
//       ),
//       useMaterial3: true,
//     );

//     return MaterialApp(
//       title: 'SERV App',
//       debugShowCheckedModeBanner: false,
//       theme: myTheme,
//       initialRoute: '/',
//       routes: {
//         '/': (context) => const LoginPage(),
//         '/leave': (context) => const LeavePage(),
//         '/add-leave': (context) => const LeaveFormPage(), // Optional if exists
//       },
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'package:serv_app/Pagesusers/attendance_model_page.dart';
import 'package:serv_app/Pagesusers/login_page.dart';
import 'package:serv_app/Pagesadmin/leave_page.dart';
import 'package:serv_app/Pagesadmin/leave_form_page.dart'; // Add this if you're using a separate leave form page

void main() {
  // 🔥 Dummy Attendance Data
  AttendanceData sampleData = AttendanceData(
    presentCount: 10,
    absentCount: 2,
    leaveCount: 0,
    lateCheckIn: 0,
    earlyCheckOut: 2,
    permissionCount: 0,
    presentDates: [
      DateTime(2025, 7, 1),
      DateTime(2025, 7, 3),
      DateTime(2025, 7, 4),
      DateTime(2025, 7, 5),
      DateTime(2025, 7, 6),
      DateTime(2025, 7, 7),
      DateTime(2025, 7, 8),
      DateTime(2025, 7, 9),
      DateTime(2025, 7, 10),
      DateTime(2025, 7, 11),
    ],
    absentDates: [DateTime(2025, 7, 2)],
    totalDays: 12,
  );

  runApp(MyApp(attendanceData: sampleData));
}

class MyApp extends StatelessWidget {
  final AttendanceData attendanceData;

  const MyApp({super.key, required this.attendanceData});

  @override
  Widget build(BuildContext context) {
    ThemeData myTheme = ThemeData(
      fontFamily: 'Inter', // ✅ Changed from Poppins to Inter
      scaffoldBackgroundColor: const Color(0xFFF8F6FF),
      cardColor: Colors.white,
      iconTheme: const IconThemeData(color: Color(0xFF0F3D3E)),
      textTheme: const TextTheme(
        bodyMedium: TextStyle(fontSize: 14, color: Colors.black),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(0xFF8C6EAF),
        titleTextStyle: TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 2,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF655193),
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          textStyle: const TextStyle(fontSize: 16),
        ),
      ),
      useMaterial3: true,
    );

    return MaterialApp(
      title: 'SERV App',
      debugShowCheckedModeBanner: false,
      theme: myTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/leave': (context) => const LeavePage(),
        '/add-leave': (context) => const LeaveFormPage(), // Optional if exists
      },
    );
  }
}
