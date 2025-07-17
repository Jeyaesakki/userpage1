


// import 'package:flutter/material.dart';
// import 'my_task_page.dart';
// import 'rewards_page.dart';
// import 'feedback_page.dart';
// import 'event_update_page.dart';

// class OthersPage extends StatelessWidget {
//   const OthersPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF274472), Color.fromARGB(255, 225, 228, 233)],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: ListView(
//               children: [
//                 // Header Row
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text(
//                       'SERV',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 24,
//                         color: Colors.white,
//                       ),
//                     ),
//                     Row(
//                       children: const [
//                         Text(
//                           'Welcome to SERV 🌐 EN ',
//                           style: TextStyle(fontSize: 12, color: Colors.white),
//                         ),
//                         SizedBox(width: 4),
//                         CircleAvatar(
//                           backgroundColor: Colors.grey,
//                           radius: 14,
//                           child: Text(
//                             'MR',
//                             style: TextStyle(fontSize: 12, color: Colors.white),
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//                 ),
//                 const SizedBox(height: 30),

//                 const Text(
//                   'Others',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Colors.white,
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 // My Task
//                 _buildMenuButton(context, 'My Task', onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const MyTaskPage()),
//                   );
//                 }, isSelected: true),
//                 const SizedBox(height: 10),

//                 // Rewards
//                 _buildMenuButton(context, 'Rewards', onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const RewardsPage()),
//                   );
//                 }),
//                 const SizedBox(height: 10),

//                 // Feedback
//                 _buildMenuButton(context, 'Feedback', onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const FeedbackPage()),
//                   );
//                 }),
//                 const SizedBox(height: 10),

//                 // Events Updates
//                 _buildMenuButton(context, 'Events Updates', onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const EventUpdatesPage()),
//                   );
//                 }),
//                 const SizedBox(height: 20),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildMenuButton(
//     BuildContext context,
//     String title, {
//     required VoidCallback onTap,
//     bool isSelected = false,
//   }) {
//     return Material(
//       elevation: 4,
//       shadowColor: Colors.black.withOpacity(0.3),
//       borderRadius: BorderRadius.circular(20),
//       child: SizedBox(
//         width: double.infinity,
//         child: ElevatedButton(
//           style: ElevatedButton.styleFrom(
//             elevation: 0,
//             backgroundColor: isSelected ? Color(0xFF7EA4CC) : Colors.white,
//             foregroundColor: Colors.black,
//             padding: const EdgeInsets.symmetric(vertical: 14),
//             shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(20),
//             ),
//           ),
//           onPressed: onTap,
//           child: Text(
//             title,
//             style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'my_task_page.dart';
import 'rewards_page.dart';
import 'feedback_page.dart';
import 'event_update_page.dart';

// ✅ Your color constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class OthersPage extends StatelessWidget {
  const OthersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: ListView(
              children: [
                // Header Row
              

                const Text(
                  'Others',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 15, 14, 14),
                  ),
                ),
                const SizedBox(height: 20),

                _buildMenuButton(context, 'My Task', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const MyTaskPage()),
                  );
                }, isSelected: true),

                const SizedBox(height: 10),

                _buildMenuButton(context, 'Rewards', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const RewardsPage()),
                  );
                }),

                const SizedBox(height: 10),

                _buildMenuButton(context, 'Feedback', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FeedbackPage()),
                  );
                }),

                const SizedBox(height: 10),

                _buildMenuButton(context, 'Events Updates', onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EventUpdatesPage()),
                  );
                }),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMenuButton(
    BuildContext context,
    String title, {
    required VoidCallback onTap,
    bool isSelected = false,
  }) {
    return Material(
      elevation: 4,
      shadowColor: Colors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            elevation: 0,
            backgroundColor: isSelected ? kButtonColor : Colors.white,
            foregroundColor: isSelected ? Colors.white : Colors.black,
            padding: const EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          onPressed: onTap,
          child: Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}