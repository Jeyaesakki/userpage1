


// import 'package:flutter/material.dart';
// import 'request_leave_page.dart';
// import 'permission_time_page.dart';
// import 'over_time_page.dart';
// import 'half_day_time_page.dart';
// import 'comp_off_page.dart';
//  // ✅ color constants


// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class TypeOfRequestPage extends StatelessWidget {
//   const TypeOfRequestPage({super.key});

//   final List<Map<String, dynamic>> requestTypes = const [
//     {'title': 'Leave Type', 'icon': Icons.calendar_today},
//     {'title': 'Permission Time', 'icon': Icons.access_time},
//     {'title': 'Over Time', 'icon': Icons.timer},
//     {'title': 'Half Day Time', 'icon': Icons.timelapse},
//     {'title': 'Comp Off', 'icon': Icons.sync_alt},
//   ];

//   void _handleNavigation(BuildContext context, String title) {
//     if (title == 'Leave Type') {
//       showModalBottomSheet(
//         context: context,
//         isScrollControlled: true,
//         backgroundColor: Colors.transparent,
//         builder: (_) => const RequestLeavePage(),
//       );
//     } else if (title == 'Permission Time') {
//       showDialog(
//         context: context,
//         builder: (_) => Dialog(
//           backgroundColor: kPrimaryBackgroundTop,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: const PermissionTimePage(isPopup: true),
//         ),
//       );
//     } else if (title == 'Over Time') {
//       showDialog(
//         context: context,
//         builder: (_) => Dialog(
//           backgroundColor: kPrimaryBackgroundTop,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: const SizedBox(
//             height: 300,
//             width: 350,
//             child: OverTimePage(isPopup: true),
//           ),
//         ),
//       );
//     } else if (title == 'Half Day Time') {
//       showDialog(
//         context: context,
//         builder: (_) => Dialog(
//           backgroundColor: kPrimaryBackgroundTop,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: const SizedBox(
//             height: 400,
//             width: 350,
//             child: HalfDayTimePage(
//               isPopup: true,
//               totalHalfDays: 8,
//               takenHalfDays: 4,
//               status: "Available",
//             ),
//           ),
//         ),
//       );
//     } else if (title == 'Comp Off') {
//       showDialog(
//         context: context,
//         builder: (_) => Dialog(
//           backgroundColor: kPrimaryBackgroundTop,
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
//           child: const SizedBox(
//             height: 420,
//             width: 350,
//             child: CompOffPage(isPopup: true),
//           ),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('$title clicked - not connected')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundBottom, // ✅ Updated background
//       appBar: AppBar(
//         title: const Text("Type Of Requests"),
//         backgroundColor: kAppBarColor, // ✅ Updated AppBar color
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: GridView.builder(
//           itemCount: requestTypes.length,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 12,
//             mainAxisSpacing: 12,
//             childAspectRatio: 1.2,
//           ),
//           itemBuilder: (context, index) {
//             final item = requestTypes[index];
//             return GestureDetector(
//               onTap: () => _handleNavigation(context, item['title']),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: kPrimaryBackgroundTop, // ✅ Updated box color
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Icon(item['icon'], size: 40, color: kButtonColor), // ✅ Updated icon color
//                     const SizedBox(height: 10),
//                     Text(
//                       item['title'],
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                         color: kAppBarColor, // ✅ Updated text color
//                       ),
//                     )
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'request_leave_page.dart';
import 'permission_time_page.dart';
import 'over_time_page.dart';
import 'half_day_time_page.dart';
import 'comp_off_page.dart';

// ✅ Color Constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class TypeOfRequestPage extends StatelessWidget {
  const TypeOfRequestPage({super.key});

  final List<Map<String, dynamic>> requestTypes = const [
    {'title': 'Leave Type', 'icon': Icons.calendar_today},
    {'title': 'Permission Time', 'icon': Icons.access_time},
    {'title': 'Over Time', 'icon': Icons.timer},
    {'title': 'Half Day Time', 'icon': Icons.timelapse},
    {'title': 'Comp Off', 'icon': Icons.sync_alt},
  ];

  void _handleNavigation(BuildContext context, String title) {
    if (title == 'Leave Type') {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        builder: (_) => const RequestLeavePage(),
      );
    } else if (title == 'Permission Time') {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: kPrimaryBackgroundTop,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const PermissionTimePage(isPopup: true),
        ),
      );
    } else if (title == 'Over Time') {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: kPrimaryBackgroundTop,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const SizedBox(
            height: 300,
            width: 350,
            child: OverTimePage(isPopup: true),
          ),
        ),
      );
    } else if (title == 'Half Day Time') {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: kPrimaryBackgroundTop,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const SizedBox(
            height: 400,
            width: 350,
            child: HalfDayTimePage(
              isPopup: true,
              totalHalfDays: 8,
              takenHalfDays: 4,
              status: "Available",
            ),
          ),
        ),
      );
    } else if (title == 'Comp Off') {
      showDialog(
        context: context,
        builder: (_) => Dialog(
          backgroundColor: kPrimaryBackgroundTop,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          child: const SizedBox(
            height: 420,
            width: 350,
            child: CompOffPage(isPopup: true),
          ),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('$title clicked - not connected')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Type Of Requests"),
        backgroundColor: kAppBarColor,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: GridView.builder(
            itemCount: requestTypes.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 1.2,
            ),
            itemBuilder: (context, index) {
              final item = requestTypes[index];
              return GestureDetector(
                onTap: () => _handleNavigation(context, item['title']),
                child: Container(
                  decoration: BoxDecoration(
                    color: kPrimaryBackgroundTop,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 4,
                        offset: Offset(2, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item['icon'], size: 40, color: kButtonColor),
                      const SizedBox(height: 10),
                      Text(
                        item['title'],
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: kAppBarColor,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
