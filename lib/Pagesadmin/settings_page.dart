

// import 'package:flutter/material.dart';
// import 'package:serv_app/Pagesadmin/workdays_shift_page.dart';
// import 'package:serv_app/Pagesadmin/leave_page.dart';
// import 'package:serv_app/Pagesadmin/profile_page.dart';
// import 'package:serv_app/Pagesadmin/qr_code_page.dart';
// import 'package:serv_app/Pagesadmin/reason_master_page.dart';
// import 'package:serv_app/Pagesadmin/office_location_page.dart';

// // App-wide theme colors
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class SettingsPage extends StatelessWidget {
//   const SettingsPage({super.key});

//   void _handleItemClick(BuildContext context, String title) {
//     if (title == 'Workdays & Shift Permission') {
//       showDialog(
//         context: context,
//         builder: (_) => Dialog(
//           backgroundColor: kAppBarColor,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: const SizedBox(
//             width: 600,
//             height: 600,
//             child: WorkdaysShiftPage(),
//           ),
//         ),
//       );
//     } else if (title == 'Leave Holiday & Week Off') {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => const LeavePage()));
//     } else if (title == 'Profile') {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => CompanyDetailsPage()));
//     } else if (title == 'QR Code') {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => const OrganizationQrPage()));
//     } else if (title == 'Reason Master') {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => const ReasonMasterPage()));
//     } else if (title == 'Office Location') {
//       Navigator.push(context, MaterialPageRoute(builder: (_) => const OfficeLocationPage()));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('$title clicked')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 236, 232, 243),
//       body: Center(
//         child: Container(
//           width: 350,
//           padding: const EdgeInsets.all(16),
//           decoration: BoxDecoration(
//             color: kAppBarColor,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Center(
//                   child: Text(
//                     'Settings',
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                       color: kTextColor,
//                       letterSpacing: 1,
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 4),
//                 const Divider(color: kAppBarColor, thickness: 1),
//                 const SizedBox(height: 10),

//                 const Text(
//                   "Work Schedule",
//                   style: TextStyle(color: kButtonColor, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 _menuItem(context, "Workdays & Shift Permission"),
//                 _menuItem(context, "Leave Holiday & Week Off"),

//                 const SizedBox(height: 16),
//                 const Text(
//                   "Corporate",
//                   style: TextStyle(color: kButtonColor, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 _menuItem(context, "Profile"),
//                 _menuItem(context, "Office Location"),
//                 _menuItem(context, "QR Code"),

//                 const SizedBox(height: 16),
//                 const Text(
//                   "Admin",
//                   style: TextStyle(color: kButtonColor, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(height: 8),
//                 _menuItem(context, "Reason Master"),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _menuItem(BuildContext context, String title) {
//     return InkWell(
//       onTap: () => _handleItemClick(context, title),
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10),
//         child: Row(
//           children: [
//             const Icon(Icons.arrow_right, color: kTextColor),
//             const SizedBox(width: 8),
//             Flexible(
//               child: Text(
//                 title,
//                 style: const TextStyle(color: kTextColor, fontSize: 16),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:serv_app/Pagesadmin/workdays_shift_page.dart';
import 'package:serv_app/Pagesadmin/leave_page.dart';
import 'package:serv_app/Pagesadmin/profile_page.dart';
import 'package:serv_app/Pagesadmin/qr_code_page.dart';
import 'package:serv_app/Pagesadmin/reason_master_page.dart';
import 'package:serv_app/Pagesadmin/office_location_page.dart';

// App-wide theme colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  void _handleItemClick(BuildContext context, String title) {
    if (title == 'Workdays & Shift Permission') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const WorkdaysShiftPage()),
      );
    } else if (title == 'Leave Holiday & Week Off') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const LeavePage()));
    } else if (title == 'Profile') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => CompanyDetailsPage()));
    } else if (title == 'QR Code') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const OrganizationQrPage()));
    } else if (title == 'Reason Master') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const ReasonMasterPage()));
    } else if (title == 'Office Location') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => const OfficeLocationPage()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$title clicked')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 236, 232, 243),
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: kAppBarColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Center(
                  child: Text(
                    'Settings',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: kTextColor,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 4),
                const Divider(color: kAppBarColor, thickness: 1),
                const SizedBox(height: 10),

                const Text(
                  "Work Schedule",
                  style: TextStyle(color: kButtonColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _menuItem(context, "Workdays & Shift Permission"),
                _menuItem(context, "Leave Holiday & Week Off"),

                const SizedBox(height: 16),
                const Text(
                  "Corporate",
                  style: TextStyle(color: kButtonColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _menuItem(context, "Profile"),
                _menuItem(context, "Office Location"),
                _menuItem(context, "QR Code"),

                const SizedBox(height: 16),
                const Text(
                  "Admin",
                  style: TextStyle(color: kButtonColor, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                _menuItem(context, "Reason Master"),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _menuItem(BuildContext context, String title) {
    return InkWell(
      onTap: () => _handleItemClick(context, title),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Row(
          children: [
            const Icon(Icons.arrow_right, color: kTextColor),
            const SizedBox(width: 8),
            Flexible(
              child: Text(
                title,
                style: const TextStyle(color: kTextColor, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
