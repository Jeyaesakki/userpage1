// import 'package:flutter/material.dart';
// import 'apply_half_day_form_page.dart';

// class CompOffPage extends StatelessWidget {
//   final bool isPopup;
//   const CompOffPage({super.key, this.isPopup = false});

//   @override
//   Widget build(BuildContext context) {
//     final content = Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Column(
//         children: [
//           // Search Field
//           Container(
//             padding: const EdgeInsets.symmetric(horizontal: 12),
//             decoration: BoxDecoration(
//               color: const Color(0xFFF3EFFF),
//               borderRadius: BorderRadius.circular(8),
//             ),
//             child: const TextField(
//               decoration: InputDecoration(
//                 icon: Icon(Icons.search),
//                 hintText: "Search",
//                 border: InputBorder.none,
//               ),
//             ),
//           ),
//           const SizedBox(height: 16),

//           // Date and Status row
//           Row(
//             children: [
//               Expanded(
//                 child: Card(
//                   elevation: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Text("12 Jun 2025"),
//                   ),
//                 ),
//               ),
//               const SizedBox(width: 12),
//               Expanded(
//                 child: Card(
//                   elevation: 2,
//                   child: Padding(
//                     padding: const EdgeInsets.all(12.0),
//                     child: Text("Status"),
//                   ),
//                 ),
//               ),
//             ],
//           ),

//           const SizedBox(height: 40),

//           // No data text
//           const Center(
//             child: Text(
//               "No data available",
//               style: TextStyle(color: Colors.grey),
//             ),
//           ),

//           const Spacer(),

//           // ✅ Apply CompOff Button → Navigates to ApplyHalfDayForm
//           SizedBox(
//             width: 200,
//             height: 45,
//             child: ElevatedButton(
//               onPressed: () {
//                 final outerContext = context;
//                 Navigator.pop(context); // Close the popup

//                 Future.delayed(const Duration(milliseconds: 150), () {
//                   Navigator.of(outerContext).push(
//                     MaterialPageRoute(builder: (_) => const ApplyHalfDayForm()),
//                   );
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.teal.shade400,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: const Text("Apply CompOff"),
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
//               title: const Text("Comp Off"),
//               backgroundColor: Colors.teal.shade400,
//             ),
//             body: content,
//           );
//   }
// }

import 'package:flutter/material.dart';
import 'apply_half_day_form_page.dart';
 // ✅ import your color constants

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class CompOffPage extends StatelessWidget {
  final bool isPopup;
  const CompOffPage({super.key, this.isPopup = false});

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          // 🔍 Search Field
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            decoration: BoxDecoration(
              color: kPrimaryBackgroundBottom.withOpacity(0.4), // ✅ updated
              borderRadius: BorderRadius.circular(8),
            ),
            child: const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.search),
                hintText: "Search",
                border: InputBorder.none,
              ),
            ),
          ),
          const SizedBox(height: 16),

          // 📅 Date and Status row
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("12 Jun 2025"),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Status"),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 40),

          // ❌ No Data
          const Center(
            child: Text(
              "No data available",
              style: TextStyle(color: Colors.grey),
            ),
          ),

          const Spacer(),

          // ✅ Apply CompOff Button
          SizedBox(
            width: 200,
            height: 45,
            child: ElevatedButton(
              onPressed: () {
                final outerContext = context;
                Navigator.pop(context); // Close popup

                Future.delayed(const Duration(milliseconds: 150), () {
                  Navigator.of(outerContext).push(
                    MaterialPageRoute(
                      builder: (_) => const ApplyHalfDayForm(),
                    ),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor, // ✅ updated
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                "Apply CompOff",
                style: TextStyle(color: kTextColor), // ✅ updated
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
              title: const Text("Comp Off"),
              backgroundColor: kAppBarColor, // ✅ updated
            ),
            body: content,
          );
  }
}