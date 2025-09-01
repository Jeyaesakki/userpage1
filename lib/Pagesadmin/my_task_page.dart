



// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';

// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

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

//   final Map<String, bool> showPreview = {
//     'Task assigned': false,
//     'Daily Update': false,
//   };

//   Future<void> _pickFile(String section) async {
//     final result = await FilePicker.platform.pickFiles(allowMultiple: false);

//     if (result != null && result.files.single.path != null) {
//       final filePath = result.files.single.path!;
//       print("Picked File: $filePath");

//       setState(() {
//         uploadedFiles[section] = filePath;
//         showPreview[section] = false;
//       });

//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('File uploaded for "$section"')),
//       );
//     }
//   }

//   void _viewFile(String section) {
//     final filePath = uploadedFiles[section];

//     if (filePath == null) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('No file uploaded for "$section"')),
//       );
//       return;
//     }

//     final extension = filePath.split('.').last.toLowerCase();
//     final isImage = ['jpg', 'jpeg', 'png', 'gif'].contains(extension);

//     if (isImage) {
//       final file = File(filePath);
//       if (file.existsSync()) {
//         setState(() {
//           showPreview[section] = true;
//         });
//       } else {
//         print("File does not exist at: $filePath");
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text('Image file not found')),
//         );
//       }
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Only image preview supported')),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundTop,
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//           ),
//         ),
//         child: SafeArea(
//           child: Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: ListView(
//               children: [
//                 _buildHeader(context),
//                 const SizedBox(height: 20),
//                 const Center(
//                   child: Text(
//                     'My Task',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 ...uploadedFiles.keys.map((section) => _buildTaskSection(section)).toList(),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildHeader(BuildContext context) {
//     return Row(
//       children: [
//         IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.black),
//           onPressed: () => Navigator.pop(context), // ✅ back working
//         ),
//         const SizedBox(width: 8),
//         const Text("Others", style: TextStyle(fontSize: 16)),
//         const Icon(Icons.arrow_right, color: kButtonColor),
//         const Text("My Task", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//       ],
//     );
//   }

//   Widget _buildTaskSection(String section) {
//     final filePath = uploadedFiles[section];
//     final shouldShowImage = showPreview[section] ?? false;
//     final isImage = filePath != null &&
//         filePath.contains('.') &&
//         ['jpg', 'jpeg', 'png', 'gif'].contains(filePath.split('.').last.toLowerCase());

//     return Column(
//       children: [
//         Container(
//           width: double.infinity,
//           margin: const EdgeInsets.symmetric(vertical: 10),
//           padding: const EdgeInsets.symmetric(vertical: 14),
//           decoration: BoxDecoration(
//             color: kAppBarColor,
//             borderRadius: BorderRadius.circular(16),
//           ),
//           child: Center(
//             child: Text(
//               section,
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: kTextColor,
//               ),
//             ),
//           ),
//         ),
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             _buildActionButton('Upload', () => _pickFile(section)),
//             _buildActionButton('View', () => _viewFile(section)),
//           ],
//         ),
//         const SizedBox(height: 15),

//         if (filePath != null && shouldShowImage && isImage)

//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10),
//             child: ClipRRect(
//               borderRadius: BorderRadius.circular(12),
//               child: Image.file(
//                 File(filePath),
//                 height: 220,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }

//   Widget _buildActionButton(String label, VoidCallback onTap) {
//     return Card(
//       elevation: 4,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: ElevatedButton(
//         onPressed: onTap,
//         style: ElevatedButton.styleFrom(
//           backgroundColor: kButtonColor,
//           foregroundColor: kTextColor,
//           padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
//           shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//         ),
//         child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

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

  final Map<String, bool> showPreview = {
    'Task assigned': false,
    'Daily Update': false,
  };

  Future<void> _pickFile(String section) async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result != null && result.files.single.path != null) {
      final filePath = result.files.single.path!;
      print("Picked File: $filePath");

      setState(() {
        uploadedFiles[section] = filePath;
        showPreview[section] = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('File uploaded for "$section"')),
      );
    }
  }

  void _viewFile(String section) {
    final filePath = uploadedFiles[section];

    if (filePath == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No file uploaded for "$section"')),
      );
      return;
    }

    final extension = filePath.split('.').last.toLowerCase();
    final isImage = ['jpg', 'jpeg', 'png', 'gif'].contains(extension);

    if (isImage) {
      final file = File(filePath);
      if (file.existsSync()) {
        setState(() {
          showPreview[section] = true;
        });
      } else {
        print("File does not exist at: $filePath");
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Image file not found')),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Only image preview supported')),
      );
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
            padding: const EdgeInsets.all(20.0),
            child: ListView(
              children: [
                _buildHeader(context),
                const SizedBox(height: 20),
                const Center(
                  child: Text(
                    'My Tasks',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 30),
                ...uploadedFiles.keys.map((section) => _buildTaskSection(section)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context) {
    return Row(
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        const SizedBox(width: 8),
        const Text("Others", style: TextStyle(fontSize: 16)),
        const Icon(Icons.arrow_right, color: kButtonColor),
        const Text("My Tasks", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ],
    );
  }

  Widget _buildTaskSection(String section) {
    final filePath = uploadedFiles[section];
    final shouldShowImage = showPreview[section] ?? false;
    final isImage = filePath != null &&
        filePath.contains('.') &&
        ['jpg', 'jpeg', 'png', 'gif'].contains(filePath.split('.').last.toLowerCase());

    return Column(
      children: [
        Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.symmetric(vertical: 14),
          decoration: BoxDecoration(
            color: kAppBarColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Center(
            child: Text(
              section,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: kTextColor,
              ),
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (section != 'Daily Update') // ✅ Upload hidden for Daily Update
              _buildActionButton('Upload', () => _pickFile(section)),
            _buildActionButton('View', () => _viewFile(section)),
          ],
        ),
        const SizedBox(height: 15),
        if (filePath != null && shouldShowImage && isImage)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.file(
                File(filePath),
                height: 220,
                fit: BoxFit.contain,
              ),
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  Widget _buildActionButton(String label, VoidCallback onTap) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: kButtonColor,
          foregroundColor: kTextColor,
          padding: const EdgeInsets.symmetric(horizontal: 35, vertical: 16),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
        child: Text(label, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
      ),
    );
  }
}



