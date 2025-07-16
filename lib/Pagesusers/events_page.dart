// import 'package:flutter/material.dart';

// class EventUpdatesPage extends StatelessWidget {
//   const EventUpdatesPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> events = [];

//     return Scaffold(
//       backgroundColor: const Color(0xFF6AB5DA),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF345C5F),
//         title: const Text(
//           'EVENT UPDATES',
//           style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
//         ),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back),
//           onPressed: () => Navigator.pop(context),
//         ),
//         actions: const [
//           Padding(
//             padding: EdgeInsets.only(right: 12.0),
//             child: Icon(Icons.person),
//           ),
//         ],
//       ),
//       body: Center(
//         child: events.isEmpty
//             ? Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 30),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     /// 📅 Image
//                     Image.asset(
//                       'assets/images/events.png',
//                       height: 180,
//                       fit: BoxFit.contain,
//                       errorBuilder: (context, error, stackTrace) {
//                         return const Text(
//                           '⚠️ Image not found!',
//                           style: TextStyle(color: Colors.red),
//                         );
//                       },
//                     ),

//                     const SizedBox(height: 20),
//                     const SizedBox(height: 25),

//                     /// ⬜ Info Box
//                     Container(
//                       padding: const EdgeInsets.symmetric(
//                         horizontal: 20,
//                         vertical: 12,
//                       ),
//                       decoration: BoxDecoration(
//                         color: const Color(0xFF345C5F),
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: const Text(
//                         "IF ANY EVENTS",
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontSize: 16,
//                           letterSpacing: 1.2,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             : ListView.builder(
//                 itemCount: events.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: const Icon(Icons.event),
//                     title: Text(events[index]),
//                   );
//                 },
//               ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

// Theme Colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class EventUpdatesPage extends StatelessWidget {
  const EventUpdatesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> events = [];

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              AppBar(
                backgroundColor: kAppBarColor,
                title: const Text(
                  'EVENT UPDATES',
                  style: TextStyle(
                    letterSpacing: 1,
                    fontWeight: FontWeight.bold,
                    color: kTextColor,
                  ),
                ),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back, color: kTextColor),
                  onPressed: () => Navigator.pop(context),
                ),
                actions: const [
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                    child: Icon(Icons.person, color: kTextColor),
                  ),
                ],
              ),

              Expanded(
                child: events.isEmpty
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            /// 📅 Image
                            Image.asset(
                              'assets/images/events.png',
                              height: 180,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) {
                                return const Text(
                                  '⚠️ Image not found!',
                                  style: TextStyle(color: Colors.red),
                                );
                              },
                            ),
                            const SizedBox(height: 25),

                            /// ⬜ Info Box
                            Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 20,
                                vertical: 12,
                              ),
                              decoration: BoxDecoration(
                                color: kButtonColor,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: const Text(
                                "IF ANY EVENTS",
                                style: TextStyle(
                                  color: kTextColor,
                                  fontSize: 16,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    : ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.event, color: kAppBarColor),
                            title: Text(
                              events[index],
                              style: const TextStyle(
                                color: Colors.black87,
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
