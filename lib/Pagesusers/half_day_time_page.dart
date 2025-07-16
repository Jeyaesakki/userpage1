// import 'package:flutter/material.dart';
// import 'apply_half_day_form_page.dart';

// class HalfDayTimePage extends StatelessWidget {
//   final bool isPopup;
//   final int totalHalfDays;
//   final int takenHalfDays;
//   final String status;

//   const HalfDayTimePage({
//     super.key,
//     this.isPopup = false,
//     required this.totalHalfDays,
//     required this.takenHalfDays,
//     required this.status,
//   });

//   @override
//   Widget build(BuildContext context) {
//     final content = Padding(
//       padding: const EdgeInsets.all(24.0),
//       child: Column(
//         mainAxisSize: MainAxisSize.min,
//         children: [
//           // ✅ Row wrapped in SingleChildScrollView to prevent overflow
//           SingleChildScrollView(
//             scrollDirection: Axis.horizontal,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 _buildCard("Total", "$totalHalfDays", Colors.green[50], Colors.green),
//                 const SizedBox(width: 8),
//                 _buildCard("Taken", "$takenHalfDays", Colors.red[50], Colors.red),
//               ],
//             ),
//           ),
//           const SizedBox(height: 23),

//           // Status
//           Center(
//             child: Container(
//               padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
//               decoration: BoxDecoration(
//                 color: Colors.blue.shade100,
//                 borderRadius: BorderRadius.circular(8),
//               ),
//               child: Text(
//                 status,
//                 style: const TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black87,
//                 ),
//               ),
//             ),
//           ),

//           const SizedBox(height: 30),

//           // ✅ Apply Request Button
//           SizedBox(
//             width: double.infinity,
//             height: 50,
//             child: ElevatedButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Close popup first

//                 // After closing popup, safely navigate to form
//                 WidgetsBinding.instance.addPostFrameCallback((_) {
//                   Navigator.of(context).push(
//                     MaterialPageRoute(builder: (_) => const ApplyHalfDayForm()),
//                   );
//                 });
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.deepPurple,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//               ),
//               child: const Text("Apply Request", style: TextStyle(fontSize: 16, color: Colors.white)),
//             ),
//           ),
//         ],
//       ),
//     );

//     return isPopup
//         ? SizedBox(height: 400, width: 350, child: SingleChildScrollView(child: content))
//         : Scaffold(
//             appBar: AppBar(
//               title: const Text("Half Day Time"),
//               backgroundColor: Colors.blueGrey.shade200,
//               leading: BackButton(onPressed: () => Navigator.pop(context)),
//             ),
//             body: SafeArea(child: content),
//           );
//   }

//   Widget _buildCard(String label, String value, Color? bgColor, Color? borderColor) {
//     return Container(
//       width: 130, // fits better in popup
//       height: 80,
//       decoration: BoxDecoration(
//         color: bgColor,
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: borderColor ?? Colors.grey, width: 1.5),
//       ),
//       child: Center(
//         child: Text(
//           "$label\n$value",
//           textAlign: TextAlign.center,
//           style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';
import 'apply_half_day_form_page.dart';

// Theme colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class HalfDayTimePage extends StatelessWidget {
  final bool isPopup;
  final int totalHalfDays;
  final int takenHalfDays;
  final String status;

  const HalfDayTimePage({
    super.key,
    this.isPopup = false,
    required this.totalHalfDays,
    required this.takenHalfDays,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: const EdgeInsets.all(24.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          // Cards
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildCard("Total", "$totalHalfDays", Colors.green[50], Colors.green),
                const SizedBox(width: 8),
                _buildCard("Taken", "$takenHalfDays", Colors.red[50], Colors.red),
              ],
            ),
          ),
          const SizedBox(height: 23),

          // Status box
          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              decoration: BoxDecoration(
                color: kPrimaryBackgroundBottom,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                status,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Apply Button
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ApplyHalfDayForm()),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text("Apply Request", style: TextStyle(fontSize: 16, color: kTextColor)),
            ),
          ),
        ],
      ),
    );

    return isPopup
        ? SizedBox(height: 400, width: 350, child: SingleChildScrollView(child: content))
        : Scaffold(
            appBar: AppBar(
              title: const Text("Half Day Time"),
              backgroundColor: kAppBarColor,
              leading: const BackButton(color: kTextColor),
              iconTheme: const IconThemeData(color: kTextColor),
              titleTextStyle: const TextStyle(color: kTextColor, fontSize: 20, fontWeight: FontWeight.bold),
            ),
            body: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: SafeArea(child: content),
            ),
          );
  }

  Widget _buildCard(String label, String value, Color? bgColor, Color? borderColor) {
    return Container(
      width: 130,
      height: 80,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: borderColor ?? Colors.grey, width: 1.5),
      ),
      child: Center(
        child: Text(
          "$label\n$value",
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
