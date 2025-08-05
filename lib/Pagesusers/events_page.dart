


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



import 'package:flutter/material.dart';


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
    try {
      // Replace with your API later
      // final response = await http.get(Uri.parse("http://your-api.com/api/events"));
      // if (response.statusCode == 200) {
      //   final List<dynamic> data = jsonDecode(response.body);
      //   return data.map<Map<String, String>>((e) => {
      //     "event": e['event'],
      //     "from": e['from'],
      //     "to": e['to'],
      //     "location": e['location'],
      //     "image": e['image'],
      //     "desc": e['desc'],
      //   }).toList();
      // }

      // Dummy fallback
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
    } catch (e) {
      throw Exception('Error fetching events: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Event Updates'),
        backgroundColor: const Color(0xFF8C6EAF),
      ),
      body: Container(
        color: const Color(0xFFD1C4E9),
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
                  // Header
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 8),
                    decoration: BoxDecoration(
                      color: Colors.purple.shade300,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: const [
                        SizedBox(width: 130, child: Text("Event Name", style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(width: 90, child: Text("From", style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(width: 90, child: Text("To", style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(width: 110, child: Text("Location", style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(width: 80, child: Text("Image", style: TextStyle(fontWeight: FontWeight.bold))),
                        SizedBox(width: 160, child: Text("Description", style: TextStyle(fontWeight: FontWeight.bold))),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Content
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
                              errorBuilder: (context, error, stackTrace) =>
                                  const Icon(Icons.broken_image),
                            ),
                          ),
                          SizedBox(width: 160, child: Text(event['desc']!)),
                        ],
                      ),
                    );
                  }).toList(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}