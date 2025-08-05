


// import 'package:flutter/material.dart';

// class UserRewardsPage extends StatefulWidget {
//   const UserRewardsPage({super.key});

//   @override
//   State<UserRewardsPage> createState() => _UserRewardsPageState();
// }

// class _UserRewardsPageState extends State<UserRewardsPage> {
//   late Future<List<Map<String, String>>> _rewardsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _rewardsFuture = getDummyRewards(); // using dummy data here
//   }

//   // 🔁 Dummy data function
//   Future<List<Map<String, String>>> getDummyRewards() async {
//     await Future.delayed(const Duration(seconds: 1)); // simulate network delay
//     return [
//       {
//         "name": "Pavithra",
//         "employeeId": "EMP001",
//         "department": "AI & ML",
//         "description": "Best performer of the month",
//         "adminName": "ramya",
//         "date": "2025-07-01",
//       },
//       {
//         "name": "Vignesh",
//         "employeeId": "EMP002",
//         "department": "Data Analytics",
//         "description": "Outstanding team contribution",
//         "adminName": "nirmala",
//         "date": "2025-07-10",
//       },
//       {
//         "name": "Ramesh",
//         "employeeId": "EMP003",
//         "department": "Cybersecurity",
//         "description": "Excellent bug bounty efforts",
//         "adminName": "mathi",
//         "date": "2025-07-20",
//       },
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Rewards"),
//         backgroundColor: const Color(0xFF8C6EAF),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFFFFF), Color(0xFFD1C4E9)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         padding: const EdgeInsets.all(16),
//         child: FutureBuilder<List<Map<String, String>>>(
//           future: _rewardsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text('No rewards found.'));
//             }

//             final rewards = snapshot.data!;
//             return ListView.builder(
//               itemCount: rewards.length,
//               itemBuilder: (context, index) {
//                 final reward = rewards[index];
//                 return Container(
//                   margin: const EdgeInsets.only(bottom: 16),
//                   padding: const EdgeInsets.all(16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: const [
//                       BoxShadow(
//                         color: Colors.black26,
//                         blurRadius: 4,
//                         offset: Offset(0, 2),
//                       )
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Text("👩‍💼 Name: ${reward['name']}", style: const TextStyle(fontSize: 16)),
//                       const SizedBox(height: 6),
//                       Text("🆔 Employee ID: ${reward['employeeId']}", style: const TextStyle(fontSize: 16)),
//                       const SizedBox(height: 6),
//                       Text("🏢 Department: ${reward['department']}", style: const TextStyle(fontSize: 16)),
//                       const SizedBox(height: 6),
//                       Text("📝 Description: ${reward['description']}", style: const TextStyle(fontSize: 16)),
//                       const SizedBox(height: 6),
//                       Text("👮‍♂️ Admin: ${reward['adminName']}", style: const TextStyle(fontSize: 16)),
//                       const SizedBox(height: 6),
//                       Text("📅 Date: ${reward['date']}", style: const TextStyle(fontSize: 16)),
//                     ],
//                   ),
//                 );
//               },
//             );
//           },
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
    _rewardsFuture = getDummyRewards(); // dummy rewards for now
  }

  // Dummy data
  Future<List<Map<String, String>>> getDummyRewards() async {
    await Future.delayed(const Duration(seconds: 1)); // simulate API delay
    return [
      {
        "name": "Pavithra",
        "employeeId": "EMP001",
        "department": "AI & ML",
        "description": "Best performer of the month",
      },
      {
        "name": "Vignesh",
        "employeeId": "EMP002",
        "department": "Data Analytics",
        "description": "Outstanding team contribution",
      },
      {
        "name": "Ramesh",
        "employeeId": "EMP003",
        "department": "Cybersecurity",
        "description": "Excellent bug bounty efforts",
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Rewards"),
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