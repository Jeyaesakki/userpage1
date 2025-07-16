// import 'package:flutter/material.dart';

// class MyRewardsPage extends StatelessWidget {
//   const MyRewardsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     // Dynamic data - can be fetched from API later
//     final List<String> rewards = [];

//     return Scaffold(
//       backgroundColor: const Color.fromARGB(153, 129, 94, 133),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF345C5F),
//         title: const Text('REWARDS'),
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
//         child: rewards.isEmpty
//             ? Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset('assets/images/rewards.png', height: 150),
//                   const SizedBox(height: 20),
//                   Container(
//                     padding: const EdgeInsets.symmetric(
//                       horizontal: 16,
//                       vertical: 8,
//                     ),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF345C5F),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: const Text(
//                       "NO REWARDS YET",
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 16,
//                         letterSpacing: 1.2,
//                       ),
//                     ),
//                   ),
//                 ],
//               )
//             : ListView.builder(
//                 itemCount: rewards.length,
//                 itemBuilder: (context, index) {
//                   return ListTile(
//                     leading: const Icon(Icons.star, color: Colors.amber),
//                     title: Text(rewards[index]),
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

class MyRewardsPage extends StatelessWidget {
  const MyRewardsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> rewards = [];

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
                  'REWARDS',
                  style: TextStyle(color: kTextColor),
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
                child: rewards.isEmpty
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/images/rewards.png',
                            height: 150,
                            errorBuilder: (context, error, stackTrace) =>
                                const Text("⚠️ Image not found", style: TextStyle(color: Colors.red)),
                          ),
                          const SizedBox(height: 20),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 16,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: kButtonColor,
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: const Text(
                              "NO REWARDS YET",
                              style: TextStyle(
                                color: kTextColor,
                                fontSize: 16,
                                letterSpacing: 1.2,
                              ),
                            ),
                          ),
                        ],
                      )
                    : ListView.builder(
                        itemCount: rewards.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: const Icon(Icons.star, color: Colors.amber),
                            title: Text(rewards[index]),
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
