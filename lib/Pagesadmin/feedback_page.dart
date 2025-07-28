// import 'package:flutter/material.dart';

// class FeedbackPage extends StatefulWidget {
//   const FeedbackPage({Key? key}) : super(key: key);

//   @override
//   State<FeedbackPage> createState() => _FeedbackPageState();
// }

// class _FeedbackPageState extends State<FeedbackPage> {
//   final TextEditingController _controller = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF0B87C9), Color.fromARGB(255, 178, 190, 209)],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             child: ListView(
//               children: [
//                 // Header Row wrapped in SingleChildScrollView
//                 SingleChildScrollView(
//                   scrollDirection: Axis.horizontal,
//                   child: Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.arrow_back, color: Colors.white),
//                         onPressed: () => Navigator.pop(context),
//                       ),
//                       const Text(
//                         'Others',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       const Icon(Icons.arrow_right, color: Colors.white),
//                       const Text(
//                         'Feedback',
//                         style: TextStyle(
//                             color: Colors.white, fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(width: 20),
//                       const Text(
//                         'Welcome to SERV 🌐 EN ',
//                         style: TextStyle(fontSize: 12, color: Colors.white),
//                       ),
//                       const CircleAvatar(
//                         backgroundColor: Colors.grey,
//                         radius: 10,
//                         child: Text('MR',
//                             style:
//                                 TextStyle(fontSize: 12, color: Colors.white)),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 30),

//                 const Text(
//                   'Feedback',
//                   style: TextStyle(
//                       fontSize: 30,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white),
//                 ),
//                 const SizedBox(height: 20),

//                 Container(
//                   padding: const EdgeInsets.all(12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(10),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.5),
//                         blurRadius: 2,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       const Text(
//                         'Description:',
//                         style: TextStyle(fontWeight: FontWeight.bold),
//                       ),
//                       const SizedBox(height: 8),
//                       TextField(
//                         controller: _controller,
//                         maxLines: 6,
//                         decoration: const InputDecoration(
//                           border: OutlineInputBorder(),
//                           hintText: 'Enter your feedback here...',
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 const SizedBox(height: 20),

//                 Center(
//                   child: ElevatedButton(
//                     onPressed: () {
//                       final feedback = _controller.text.trim();

//                       if (feedback.isEmpty) {
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           const SnackBar(
//                             content:
//                                 Text('Please enter some feedback before submitting.'),
//                             backgroundColor: Colors.redAccent,
//                           ),
//                         );
//                         return;
//                       }

//                       ScaffoldMessenger.of(context).showSnackBar(
//                         SnackBar(
//                           content: Text('Feedback submitted: $feedback'),
//                           backgroundColor: Colors.green,
//                         ),
//                       );

//                       _controller.clear();
//                     },
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: const Color.fromARGB(255, 13, 146, 212),
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 40, vertical: 14),
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(20),
//                       ),
//                     ),
//                     child: const Text(
//                       'Submit',
//                       style: TextStyle(
//                           color: Colors.white, fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

// ✅ Global Color Constants

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({Key? key}) : super(key: key);

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _controller = TextEditingController();

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
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: ListView(
              children: [
                // Header Row
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: kButtonColor ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      const Text(
                        'Others',
                        style: TextStyle(
                            color: Color.fromARGB(255, 10, 3, 3), fontWeight: FontWeight.bold),
                      ),
                      const Icon(Icons.arrow_right, color: kButtonColor ),
                      const Text(
                        'Feedback',
                        style: TextStyle(
                            color: Color.fromARGB(255, 27, 15, 15), fontWeight: FontWeight.bold),
                      ),
         
                    ],
                  ),
                ),
                const SizedBox(height: 30),

                const Text(
                  'Feedback',
                  style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 8, 7, 7)),
                ),
                const SizedBox(height: 20),

                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        blurRadius: 2,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Description:',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 8),
                      TextField(
                        controller: _controller,
                        maxLines: 6,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter your feedback here...',
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      final feedback = _controller.text.trim();

                      if (feedback.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content:
                                Text('Please enter some feedback before submitting.'),
                            backgroundColor: Colors.redAccent,
                          ),
                        );
                        return;
                      }

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Feedback submitted: $feedback'),
                          backgroundColor:  Color.fromARGB(255, 56, 58, 56),
                        ),
                      );

                      _controller.clear();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: const Text(
                      'Submit',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}