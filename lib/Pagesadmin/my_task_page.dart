// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:open_filex/open_filex.dart';

// class MyTaskPage extends StatefulWidget {
//   const MyTaskPage({super.key});

//   @override
//   State<MyTaskPage> createState() => _MyTaskPageState();
// }

// class _MyTaskPageState extends State<MyTaskPage> {
//   final Map<String, String?> uploadedFiles = {
//     'Task assigned': null,
//     'Daily Update': null,
//   };

//   Future<void> _pickFile(String section) async {
//     final result = await FilePicker.platform.pickFiles(
//       allowMultiple: false,
//       type: FileType.any,
//     );

//     if (result != null && result.files.single.path != null) {
//       setState(() {
//         uploadedFiles[section] = result.files.single.path!;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('File uploaded for "$section"')),
//       );
//     }
//   }

//   Future<void> _viewFile(String section) async {
//     final filePath = uploadedFiles[section];

//     if (filePath == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('No file uploaded for "$section"')),
//       );
//       return;
//     }

//     final extension = filePath.split('.').last.toLowerCase();
//     final file = File(filePath);

//     if (['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(extension)) {
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text('$section - Preview'),
//           content: Image.file(file),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Close"),
//             ),
//           ],
//         ),
//       );
//     } else {
//       final result = await OpenFilex.open(filePath);
//       if (result.type != ResultType.done) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Failed to open file')),
//         );
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [Color(0xFF0B87C9), Color.fromARGB(255, 206, 215, 231)],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
//             child: ListView(
//               children: [
//                 _buildHeader(context),
//                 const SizedBox(height: 20),
//                 const Text(
//                   'My Task',
//                   style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
//                 ),
//                 const SizedBox(height: 20),
//                 ...uploadedFiles.keys.map((section) => Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         _buildLabel(section),
//                         const SizedBox(height: 10),
//                         _buildActionRow(section),
//                         const SizedBox(height: 30),
//                       ],
//                     )),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.horizontal,
//       child: Row(
//         children: [
//           IconButton(
//             icon: const Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Navigator.pop(context),
//           ),
//           const SizedBox(width: 4),
//           const Text('Others', style: TextStyle(color: Colors.white, fontSize: 16)),
//           const Icon(Icons.arrow_right, color: Colors.white),
//           const Text('My Task',
//               style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
//           const SizedBox(width: 20),
//           const Text('Welcome to SERV 🌐 EN ', style: TextStyle(fontSize: 12, color: Colors.white)),
//           const CircleAvatar(
//             backgroundColor: Colors.grey,
//             radius: 14,
//             child: Text('MR', style: TextStyle(fontSize: 12, color: Colors.white)),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _buildLabel(String text) {
//     return Center(
//       child: Container(
//         padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
//         decoration: BoxDecoration(
//           color: Colors.purple[200],
//           borderRadius: BorderRadius.circular(20),
//         ),
//         child: Text(
//           text,
//           style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//       ),
//     );
//   }

//   Widget _buildActionRow(String section) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       children: [
//         _buildActionButton('Upload', () => _pickFile(section)),
//         _buildActionButton('View', () => _viewFile(section)),
//       ],
//     );
//   }

//   Widget _buildActionButton(String label, VoidCallback onTap) {
//     return ElevatedButton(
//       onPressed: onTap,
//       style: ElevatedButton.styleFrom(
//         backgroundColor: Colors.white,
//         foregroundColor: Colors.black,
//         padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//       ),
//       child: Text(
//         label,
//         style: const TextStyle(fontWeight: FontWeight.bold),
//       ),
//     );
//   }
// }

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';

// App-wide theme colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class MyTaskPage extends StatefulWidget {
  const MyTaskPage({super.key});

  @override
  State<MyTaskPage> createState() => _MyTaskPageState();
}

class _MyTaskPageState extends State<MyTaskPage> {
  final Map<String, String?> uploadedFiles = {
    'Task assigned': null,
    'Daily Update': null,
  };

  Future<void> _pickFile(String section) async {
    final result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.any,
    );

    if (result != null && result.files.single.path != null) {
      setState(() {
        uploadedFiles[section] = result.files.single.path!;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File uploaded for "$section"')),
      );
    }
  }

  Future<void> _viewFile(String section) async {
    final filePath = uploadedFiles[section];

    if (filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file uploaded for "$section"')),
      );
      return;
    }

    final extension = filePath.split('.').last.toLowerCase();
    final file = File(filePath);

    if (['jpg', 'jpeg', 'png', 'gif', 'bmp'].contains(extension)) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('$section - Preview'),
          content: Image.file(file),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        ),
      );
    } else {
      final result = await OpenFilex.open(filePath);
      if (result.type != ResultType.done) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to open file')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackgroundTop,
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
                _buildHeader(context),
                const SizedBox(height: 20),
                const Text(
                  'My Task',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 17, 15, 15)),
                ),
                const SizedBox(height: 20),
                ...uploadedFiles.keys.map((section) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLabel(section),
                        const SizedBox(height: 10),
                        _buildActionRow(section),
                        const SizedBox(height: 30),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 15, 12, 12)),
            onPressed: () => Navigator.pop(context),
          ),
          const SizedBox(width: 4),
          const Text('Others', style: TextStyle(color: Color.fromARGB(255, 17, 15, 15), fontSize: 16)),
          const Icon(Icons.arrow_right, color: kButtonColor),
          const Text('My Task',
              style: TextStyle(color: Color.fromARGB(255, 26, 22, 22), fontSize: 16, fontWeight: FontWeight.bold)),
          const SizedBox(width: 20),
          const Text('Welcome to SERV 🌐 EN ', style: TextStyle(fontSize: 12, color: kTextColor)),
          const CircleAvatar(
            backgroundColor: Colors.grey,
            radius: 14,
            child: Text('MR', style: TextStyle(fontSize: 12, color: kTextColor)),
          ),
        ],
      ),
    );
  }

  Widget _buildLabel(String text) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: kAppBarColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: const TextStyle(color: kTextColor, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Widget _buildActionRow(String section) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildActionButton('Upload', () => _pickFile(section)),
        _buildActionButton('View', () => _viewFile(section)),
      ],
    );
  }

  Widget _buildActionButton(String label, VoidCallback onTap) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        backgroundColor: kButtonColor,
        foregroundColor: kTextColor,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }
}
