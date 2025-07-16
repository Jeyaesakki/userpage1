// import 'package:flutter/material.dart';
// import 'apply_half_day_form_page.dart'; // Ensure this import is correct

// class OverTimePage extends StatelessWidget {
//   final bool isPopup;
//   const OverTimePage({super.key, this.isPopup = false});

//   @override
//   Widget build(BuildContext context) {
//     final content = Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         children: [
//           const Spacer(),

//           // No Data Display
//           Column(
//             children: [
//               Icon(Icons.insert_drive_file_outlined, size: 80, color: Colors.grey.shade500),
//               const SizedBox(height: 8),
//               const Text("No Data Available", style: TextStyle(color: Colors.black54)),
//             ],
//           ),

//           const Spacer(),

//           // ✅ Apply Over Time Button
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: () {
//                 if (isPopup) {
//                   Navigator.pop(context);

//                   // Fix: Delay navigation to next frame
//                   Future.delayed(Duration.zero, () {
//                     Navigator.of(context).push(
//                       MaterialPageRoute(builder: (_) => const ApplyHalfDayForm()),
//                     );
//                   });
//                 } else {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (_) => const ApplyHalfDayForm()),
//                   );
//                 }
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFFD8C3E7),
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//               ),
//               child: const Text("Apply Over Time", style: TextStyle(fontWeight: FontWeight.bold)),
//             ),
//           ),
//         ],
//       ),
//     );

//     return isPopup
//         ? SizedBox(height: 420, width: 350, child: content)
//         : Scaffold(
//             backgroundColor: Colors.white,
//             appBar: AppBar(
//               title: const Text("Over Time", style: TextStyle(fontWeight: FontWeight.bold)),
//               backgroundColor: const Color(0xFFD1C7E0),
//               leading: BackButton(),
//               elevation: 0,
//             ),
//             body: content,
//           );
//   }
// }

import 'package:flutter/material.dart';
import 'apply_half_day_form_page.dart';
 // ✅ Import your color constants

 const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class OverTimePage extends StatelessWidget {
  final bool isPopup;
  const OverTimePage({super.key, this.isPopup = false});

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        children: [
          const Spacer(),

          // No Data Display
          Column(
            children: [
              Icon(Icons.insert_drive_file_outlined, size: 80, color: Colors.grey.shade500),
              const SizedBox(height: 8),
              const Text("No Data Available", style: TextStyle(color: Colors.black54)),
            ],
          ),

          const Spacer(),

          // ✅ Apply Over Time Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                if (isPopup) {
                  Navigator.pop(context);

                  // Fix: Delay navigation to next frame
                  Future.delayed(Duration.zero, () {
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (_) => const ApplyHalfDayForm()),
                    );
                  });
                } else {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ApplyHalfDayForm()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor, // ✅ updated
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              ),
              child: Text(
                "Apply Over Time",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: kTextColor, // ✅ updated
                ),
              ),
            ),
          ),
        ],
      ),
    );

    return isPopup
        ? SizedBox(height: 420, width: 350, child: content)
        : Scaffold(
            backgroundColor: kPrimaryBackgroundTop, // ✅ updated
            appBar: AppBar(
              title: const Text("Over Time", style: TextStyle(fontWeight: FontWeight.bold)),
              backgroundColor: kAppBarColor, // ✅ updated
              leading: const BackButton(),
              elevation: 0,
            ),
            body: content,
          );
  }
}