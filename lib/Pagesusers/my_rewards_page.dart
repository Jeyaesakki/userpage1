

// import 'package:flutter/material.dart';

// // Theme Colors
// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class MyRewardsPage extends StatelessWidget {
//   const MyRewardsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final List<String> rewards = [];

//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: Column(
//             children: [
//               AppBar(
//                 backgroundColor: kAppBarColor,
//                 title: const Text(
//                   'REWARDS',
//                   style: TextStyle(color: kTextColor),
//                 ),
//                 leading: IconButton(
//                   icon: const Icon(Icons.arrow_back, color: kTextColor),
//                   onPressed: () => Navigator.pop(context),
//                 ),
//                 actions: const [
//                   Padding(
//                     padding: EdgeInsets.only(right: 12.0),
//                     child: Icon(Icons.person, color: kTextColor),
//                   ),
//                 ],
//               ),

//               Expanded(
//                 child: rewards.isEmpty
//                     ? Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset(
//                             'assets/images/rewards.png',
//                             height: 150,
//                             errorBuilder: (context, error, stackTrace) =>
//                                 const Text("⚠️ Image not found", style: TextStyle(color: Colors.red)),
//                           ),
//                           const SizedBox(height: 20),
//                           Container(
//                             padding: const EdgeInsets.symmetric(
//                               horizontal: 16,
//                               vertical: 8,
//                             ),
//                             decoration: BoxDecoration(
//                               color: kButtonColor,
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: const Text(
//                               "NO REWARDS YET",
//                               style: TextStyle(
//                                 color: kTextColor,
//                                 fontSize: 16,
//                                 letterSpacing: 1.2,
//                               ),
//                             ),
//                           ),
//                         ],
//                       )
//                     : ListView.builder(
//                         itemCount: rewards.length,
//                         itemBuilder: (context, index) {
//                           return ListTile(
//                             leading: const Icon(Icons.star, color: Colors.amber),
//                             title: Text(rewards[index]),
//                           );
//                         },
//                       ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

class UserRewardsPage extends StatefulWidget {
  const UserRewardsPage({super.key});

  @override
  State<UserRewardsPage> createState() => _UserRewardsPageState();
}

class _UserRewardsPageState extends State<UserRewardsPage> {
  late Future<List<Map<String, String>>> _rewardsFuture;

  @override
  void initState() {
    super.initState();
    _rewardsFuture = getDummyRewards(); // using dummy data here
  }

  // 🔁 Dummy data function
  Future<List<Map<String, String>>> getDummyRewards() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate network delay
    return [
      {
        "name": "Pavithra",
        "employeeId": "EMP001",
        "department": "AI & ML",
        "description": "Best performer of the month",
        "adminName": "ramya",
        "date": "2025-07-01",
      },
      {
        "name": "Vignesh",
        "employeeId": "EMP002",
        "department": "Data Analytics",
        "description": "Outstanding team contribution",
        "adminName": "nirmala",
        "date": "2025-07-10",
      },
      {
        "name": "Ramesh",
        "employeeId": "EMP003",
        "department": "Cybersecurity",
        "description": "Excellent bug bounty efforts",
        "adminName": "mathi",
        "date": "2025-07-20",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rewards"),
        backgroundColor: const Color(0xFF8C6EAF),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFFFFFFFF), Color(0xFFD1C4E9)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(16),
        child: FutureBuilder<List<Map<String, String>>>(
          future: _rewardsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No rewards found.'));
            }

            final rewards = snapshot.data!;
            return ListView.builder(
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                final reward = rewards[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 16),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      )
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("👩‍💼 Name: ${reward['name']}", style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 6),
                      Text("🆔 Employee ID: ${reward['employeeId']}", style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 6),
                      Text("🏢 Department: ${reward['department']}", style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 6),
                      Text("📝 Description: ${reward['description']}", style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 6),
                      Text("👮‍♂️ Admin: ${reward['adminName']}", style: const TextStyle(fontSize: 16)),
                      const SizedBox(height: 6),
                      Text("📅 Date: ${reward['date']}", style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}