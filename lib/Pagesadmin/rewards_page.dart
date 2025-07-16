// import 'package:flutter/material.dart';

// class RewardsPage extends StatelessWidget {
//   const RewardsPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF0B87C9), Color.fromARGB(255, 207, 217, 233)],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: ListView(
//               children: [
//                 // Safe horizontal scroll for header row
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           IconButton(
//                             icon: const Icon(Icons.arrow_back, color: Colors.white),
//                             onPressed: () => Navigator.pop(context),
//                           ),
//                           const SizedBox(width: 4),
//                           const Text(
//                             'Others',
//                             style: TextStyle(color: Colors.white, fontSize: 16),
//                           ),
//                           const Icon(Icons.arrow_right, color: Colors.white),
//                           const Text(
//                             'Rewards',
//                             style: TextStyle(
//                                 color: Colors.white,
//                                 fontSize: 16,
//                                 fontWeight: FontWeight.bold),
//                           ),
//                         ],
//                       ),
//                       const SizedBox(width: 10),
//                       Row(
//                         children: const [
//                           Text(
//                             'Welcome to SERV 🌐 EN ',
//                             style: TextStyle(fontSize: 12, color: Colors.white),
//                           ),
//                           CircleAvatar(
//                             backgroundColor: Colors.grey,
//                             radius: 14,
//                             child: Text('MR',
//                                 style: TextStyle(fontSize: 12, color: Colors.white)),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 const Text(
//                   'Rewards',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//                 const SizedBox(height: 40),

//                 Center(
//                   child: Container(
//                     padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
//                     decoration: BoxDecoration(
//                       color: Colors.teal[600],
//                       borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Text(
//                       'Performance based\nCertificate and rewards',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.white,
//                       ),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

// ✅ Your global color constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF); // Light lavender top
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9); // Lavender bottom
const Color kTextColor = Colors.white;
const Color kHighlightBoxColor = Color(0xFF655193); // Same as button color

class RewardsPage extends StatelessWidget {
  const RewardsPage({Key? key}) : super(key: key);

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
                // Safe horizontal scroll for header row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.arrow_back, color: kHighlightBoxColor),
                            onPressed: () => Navigator.pop(context),
                          ),
                          const SizedBox(width: 4),
                          const Text(
                            'Others',
                            style: TextStyle(color: Color.fromARGB(255, 14, 11, 11), fontSize: 16),
                          ),
                          const Icon(Icons.arrow_right, color: kHighlightBoxColor),
                          const Text(
                            'Rewards',
                            style: TextStyle(
                              color: Color.fromARGB(255, 12, 9, 9),
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
 
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                const Text(
                  'Rewards',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 5, 3, 3),
                  ),
                ),
                const SizedBox(height: 40),

                Center(
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                    decoration: BoxDecoration(
                      color: kHighlightBoxColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Text(
                      'Performance based\nCertificate and rewards',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: kTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}