
// import 'package:flutter/material.dart';


// class UserEventUpdatesPage extends StatefulWidget {
//   const UserEventUpdatesPage({super.key});

//   @override
//   State<UserEventUpdatesPage> createState() => _UserEventUpdatesPageState();
// }

// class _UserEventUpdatesPageState extends State<UserEventUpdatesPage> {
//   late Future<List<Map<String, String>>> _eventsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _eventsFuture = fetchEventData();
//   }

//   Future<List<Map<String, String>>> fetchEventData() async {
//     try {
//       // Replace with your API later
//       // final response = await http.get(Uri.parse("http://your-api.com/api/events"));
//       // if (response.statusCode == 200) {
//       //   final List<dynamic> data = jsonDecode(response.body);
//       //   return data.map<Map<String, String>>((e) => {
//       //     "event": e['event'],
//       //     "from": e['from'],
//       //     "to": e['to'],
//       //     "location": e['location'],
//       //     "image": e['image'],
//       //     "desc": e['desc'],
//       //   }).toList();
//       // }

//       // Dummy fallback
//       return [
//         {
//           'event': 'Blood Donation',
//           'from': '25/07',
//           'to': '27/07',
//           'location': 'Chennai',
//           'image': 'https://via.placeholder.com/50',
//           'desc': 'Join us for a noble cause',
//         },
//         {
//           'event': 'Health Camp',
//           'from': '28/07',
//           'to': '30/07',
//           'location': 'Coimbatore',
//           'image': 'https://via.placeholder.com/50',
//           'desc': 'Free health checkup',
//         },
//       ];
//     } catch (e) {
//       throw Exception('Error fetching events: $e');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Event Updates'),
//         backgroundColor: const Color(0xFF8C6EAF),
//       ),
//       body: Container(
//         color: const Color(0xFFD1C4E9),
//         padding: const EdgeInsets.all(10),
//         child: FutureBuilder<List<Map<String, String>>>(
//           future: _eventsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text('No events found.'));
//             }

//             final events = snapshot.data!;
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Header
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                     decoration: BoxDecoration(
//                       color: Colors.purple.shade300,
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: const [
//                         SizedBox(width: 130, child: Text("Event Name", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 90, child: Text("From", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 90, child: Text("To", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 110, child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 80, child: Text("Image", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 160, child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold))),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 12),

//                   // Content
//                   ...events.map((event) {
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 10),
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 130, child: Text(event['event']!)),
//                           SizedBox(width: 90, child: Text(event['from']!)),
//                           SizedBox(width: 90, child: Text(event['to']!)),
//                           SizedBox(width: 110, child: Text(event['location']!)),
//                           SizedBox(
//                             width: 80,
//                             child: Image.network(
//                               event['image']!,
//                               width: 50,
//                               height: 50,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) =>
//                                   const Icon(Icons.broken_image),
//                             ),
//                           ),
//                           SizedBox(width: 160, child: Text(event['desc']!)),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }




// // import 'package:flutter/material.dart';

// // class EventUpdatesPage extends StatelessWidget {
// //   const EventUpdatesPage({super.key});

// //   @override
// //   Widget build(BuildContext context) {
// //     final List<String> events = [];

// //     return Scaffold(
// //       backgroundColor: const Color(0xFF6AB5DA),
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF345C5F),
// //         title: const Text(
// //           'EVENT UPDATES',
// //           style: TextStyle(letterSpacing: 1, fontWeight: FontWeight.bold),
// //         ),
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //         actions: const [
// //           Padding(
// //             padding: EdgeInsets.only(right: 12.0),
// //             child: Icon(Icons.person),
// //           ),
// //         ],
// //       ),
// //       body: Center(
// //         child: events.isEmpty
// //             ? Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 30),
// //                 child: Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     /// 📅 Image
// //                     Image.asset(
// //                       'assets/images/events.png',
// //                       height: 180,
// //                       fit: BoxFit.contain,
// //                       errorBuilder: (context, error, stackTrace) {
// //                         return const Text(
// //                           '⚠️ Image not found!',
// //                           style: TextStyle(color: Colors.red),
// //                         );
// //                       },
// //                     ),

// //                     const SizedBox(height: 20),
// //                     const SizedBox(height: 25),

// //                     /// ⬜ Info Box
// //                     Container(
// //                       padding: const EdgeInsets.symmetric(
// //                         horizontal: 20,
// //                         vertical: 12,
// //                       ),
// //                       decoration: BoxDecoration(
// //                         color: const Color(0xFF345C5F),
// //                         borderRadius: BorderRadius.circular(8),
// //                       ),
// //                       child: const Text(
// //                         "IF ANY EVENTS",
// //                         style: TextStyle(
// //                           color: Colors.white,
// //                           fontSize: 16,
// //                           letterSpacing: 1.2,
// //                         ),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               )
// //             : ListView.builder(
// //                 itemCount: events.length,
// //                 itemBuilder: (context, index) {
// //                   return ListTile(
// //                     leading: const Icon(Icons.event),
// //                     title: Text(events[index]),
// //                   );
// //                 },
// //               ),
// //       ),
// //     );
// //   }
// // }

// // 
// import 'package:flutter/material.dart';

// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);       // Background top
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);    // Background bottom
// const Color kAppBarColor = Color(0xFF8C6EAF);                // AppBar
// const Color kButtonColor = Color(0xFF655193);                // Button
// const Color kTextColor = Colors.white;                      // Text
// const Color kHeaderRowColor = Color(0xFFE6E0F8);             // Header Row

// class UserEventUpdatesPage extends StatefulWidget {
//   const UserEventUpdatesPage({super.key});

//   @override
//   State<UserEventUpdatesPage> createState() => _UserEventUpdatesPageState();
// }

// class _UserEventUpdatesPageState extends State<UserEventUpdatesPage> {
//   late Future<List<Map<String, String>>> _eventsFuture;

//   @override
//   void initState() {
//     super.initState();
//     _eventsFuture = fetchEventData();
//   }

//   Future<List<Map<String, String>>> fetchEventData() async {
//     // Replace with API later
//     return [
//       {
//         'event': 'Blood Donation',
//         'from': '25/07',
//         'to': '27/07',
//         'location': 'Chennai',
//         'image': 'https://via.placeholder.com/50',
//         'desc': 'Join us for a noble cause',
//       },
//       {
//         'event': 'Health Camp',
//         'from': '28/07',
//         'to': '30/07',
//         'location': 'Coimbatore',
//         'image': 'https://via.placeholder.com/50',
//         'desc': 'Free health checkup',
//       },
//     ];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Event Updates'),
//         backgroundColor: kAppBarColor,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         padding: const EdgeInsets.all(10),
//         child: FutureBuilder<List<Map<String, String>>>(
//           future: _eventsFuture,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const Center(child: CircularProgressIndicator());
//             } else if (snapshot.hasError) {
//               return Center(child: Text('Error: ${snapshot.error}'));
//             } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
//               return const Center(child: Text('No events found.'));
//             }

//             final events = snapshot.data!;
//             return SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // 🔘 Header Row
//                   Container(
//                     padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
//                     decoration: BoxDecoration(
//                       color: kHeaderRowColor, // ⬅️ New lavender color
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       children: const [
//                         SizedBox(width: 130, child: Text("Event Name", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 90, child: Text("From", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 90, child: Text("To", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 110, child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 80, child: Text("Image", style: TextStyle(fontWeight: FontWeight.bold))),
//                         SizedBox(width: 160, child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold))),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(height: 12),

//                   // 📄 Event List
//                   ...events.map((event) {
//                     return Container(
//                       margin: const EdgeInsets.only(bottom: 10),
//                       padding: const EdgeInsets.all(8),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(8),
//                         boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
//                       ),
//                       child: Row(
//                         children: [
//                           SizedBox(width: 130, child: Text(event['event']!)),
//                           SizedBox(width: 90, child: Text(event['from']!)),
//                           SizedBox(width: 90, child: Text(event['to']!)),
//                           SizedBox(width: 110, child: Text(event['location']!)),
//                           SizedBox(
//                             width: 80,
//                             child: Image.network(
//                               event['image']!,
//                               width: 50,
//                               height: 50,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) =>
//                                   const Icon(Icons.broken_image),
//                             ),
//                           ),
//                           SizedBox(width: 160, child: Text(event['desc']!)),
//                         ],
//                       ),
//                     );
//                   }).toList(),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

// App colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193); // Main button
const Color kTextColor = Colors.white;

// Lighter lavender for table header
const Color kHeaderColor = Color(0xFF9C83B8);

class UserEventUpdatesPage extends StatefulWidget {
  const UserEventUpdatesPage({super.key});

  @override
  State<UserEventUpdatesPage> createState() => _UserEventUpdatesPageState();
}

class _UserEventUpdatesPageState extends State<UserEventUpdatesPage> {
  late Future<List<Map<String, String>>> _eventsFuture;

  @override
  void initState() {
    super.initState();
    _eventsFuture = fetchEventData();
  }

  Future<List<Map<String, String>>> fetchEventData() async {
    await Future.delayed(const Duration(seconds: 1));
    return [
      {
        'event': 'Blood Donation',
        'from': '25/07',
        'to': '27/07',
        'location': 'Chennai',
        'image': 'https://via.placeholder.com/50',
        'desc': 'Join us for a noble cause',
      },
      {
        'event': 'Health Camp',
        'from': '28/07',
        'to': '30/07',
        'location': 'Coimbatore',
        'image': 'https://via.placeholder.com/50',
        'desc': 'Free health checkup',
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Updates'),
        backgroundColor: kAppBarColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        padding: const EdgeInsets.all(10),
        child: FutureBuilder<List<Map<String, String>>>(
          future: _eventsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              return const Center(child: Text('No events found.'));
            }

            final events = snapshot.data!;
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Table Header
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      color: kHeaderColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(width: 130, child: Text("Event Name", style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor))),
                        SizedBox(width: 90, child: Text("From", style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor))),
                        SizedBox(width: 90, child: Text("To", style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor))),
                        SizedBox(width: 110, child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor))),
                        SizedBox(width: 80, child: Text("Image", style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor))),
                        SizedBox(width: 160, child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold, color: kTextColor))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Event Rows
                  ...events.map((event) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)],
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 130, child: Text(event['event']!)),
                          SizedBox(width: 90, child: Text(event['from']!)),
                          SizedBox(width: 90, child: Text(event['to']!)),
                          SizedBox(width: 110, child: Text(event['location']!)),
                          SizedBox(
                            width: 80,
                            child: Image.network(
                              event['image']!,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                            ),
                          ),
                          SizedBox(width: 160, child: Text(event['desc']!)),
                        ],
                      ),
                    );
                  }),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}