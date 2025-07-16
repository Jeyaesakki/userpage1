// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:file_picker/file_picker.dart';
// import 'dart:io';
// import 'dart:typed_data';

// class MyTasksPage extends StatefulWidget {
//   const MyTasksPage({super.key});

//   @override
//   State<MyTasksPage> createState() => _MyTasksPageState();
// }

// class _MyTasksPageState extends State<MyTasksPage> {
//   File? _image;
//   Uint8List? _fileBytes;
//   String? _fileName;
//   bool _isImage = true;

//   String? assignedTask = "Complete the Flutter login screen by 5 PM";

//   Future<void> _pickImageFromCamera() async {
//     final picker = ImagePicker();
//     final XFile? pickedImage = await picker.pickImage(
//       source: ImageSource.camera,
//     );

//     if (pickedImage != null) {
//       setState(() {
//         _image = File(pickedImage.path);
//         _isImage = true;
//         _fileName = pickedImage.name;
//         _fileBytes = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Image captured from camera successfully"),
//         ),
//       );
//     }
//   }

//   Future<void> _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles(
//       withData: true,
//     );
//     if (result != null && result.files.single.bytes != null) {
//       setState(() {
//         _fileBytes = result.files.single.bytes;
//         _fileName = result.files.single.name;
//         _isImage =
//             _fileName!.endsWith(".png") ||
//             _fileName!.endsWith(".jpg") ||
//             _fileName!.endsWith(".jpeg");
//         _image = null;
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("File uploaded successfully")),
//       );
//     }
//   }

//   void _showUploadOptions() {
//     showModalBottomSheet(
//       context: context,
//       builder: (_) => Wrap(
//         children: [
//           ListTile(
//             leading: const Icon(Icons.camera_alt),
//             title: const Text('Take Photo'),
//             onTap: () {
//               Navigator.pop(context);
//               _pickImageFromCamera();
//             },
//           ),
//           ListTile(
//             leading: const Icon(Icons.upload_file),
//             title: const Text('Choose File'),
//             onTap: () {
//               Navigator.pop(context);
//               _pickFile();
//             },
//           ),
//         ],
//       ),
//     );
//   }

//   void _viewUploadedContent() {
//     if (_image != null) {
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text("Uploaded Image"),
//           content: Image.file(_image!, fit: BoxFit.cover),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Close"),
//             ),
//           ],
//         ),
//       );
//     } else if (_fileBytes != null) {
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: Text(_fileName ?? "Uploaded File"),
//           content: _isImage
//               ? Image.memory(_fileBytes!, fit: BoxFit.cover)
//               : const Icon(Icons.insert_drive_file, size: 60),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Close"),
//             ),
//           ],
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("No image or file uploaded yet.")),
//       );
//     }
//   }

//   void _viewTaskDetails() {
//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         title: const Text("Task Details"),
//         content: Text(assignedTask ?? "No task assigned."),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: const Text("Close"),
//           ),
//         ],
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final previewWidget = _image != null
//         ? Image.file(_image!, fit: BoxFit.cover)
//         : _fileBytes != null && _isImage
//         ? Image.memory(_fileBytes!, fit: BoxFit.cover)
//         : const Icon(Icons.cloud_upload, size: 60, color: Colors.purple);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("My Tasks"),
//         backgroundColor: const Color(0xFF8C6EAF),
//       ),
//       body: Container(
//         padding: const EdgeInsets.all(20),
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [Color(0xFFFFFFFF), Color(0xFFD1C4E9)],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             const SizedBox(height: 20),
//             GestureDetector(
//               onTap: _showUploadOptions,
//               child: Container(
//                 height: 150,
//                 width: 150,
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.purple),
//                   borderRadius: BorderRadius.circular(10),
//                 ),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(10),
//                   child: Center(child: previewWidget),
//                 ),
//               ),
//             ),
//             const SizedBox(height: 30),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.purple.shade100,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Text(
//                 "Task Assigned",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 10),
//             ElevatedButton(
//               onPressed: _viewTaskDetails,
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF655193),
//                 foregroundColor: Colors.white,
//               ),
//               child: const Text("View Task"),
//             ),
//             const SizedBox(height: 30),
//             Container(
//               width: double.infinity,
//               padding: const EdgeInsets.all(12),
//               decoration: BoxDecoration(
//                 color: Colors.purple.shade100,
//                 borderRadius: BorderRadius.circular(10),
//               ),
//               child: const Text(
//                 "Daily Update Upload",
//                 textAlign: TextAlign.center,
//                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//               ),
//             ),
//             const SizedBox(height: 10),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//               children: [
//                 ElevatedButton(
//                   onPressed: _showUploadOptions,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF655193),
//                     foregroundColor: Colors.white,
//                   ),
//                   child: const Text("Upload"),
//                 ),
//                 ElevatedButton(
//                   onPressed: _viewUploadedContent,
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: const Color(0xFF655193),
//                     foregroundColor: Colors.white,
//                   ),
//                   child: const Text("View"),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';
import 'dart:typed_data';

class MyTasksPage extends StatefulWidget {
  const MyTasksPage({super.key});

  @override
  State<MyTasksPage> createState() => _MyTasksPageState();
}

class _MyTasksPageState extends State<MyTasksPage> {
  File? _image;
  Uint8List? _fileBytes;
  String? _fileName;
  bool _isImage = true;

  String? assignedTask = "Complete the Flutter login screen by 5 PM";

  Future<void> _pickImageFromCamera() async {
    final picker = ImagePicker();
    final XFile? pickedImage = await picker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
        _isImage = true;
        _fileName = pickedImage.name;
        _fileBytes = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image captured from camera successfully")),
      );
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(withData: true);
    if (result != null && result.files.single.bytes != null) {
      setState(() {
        _fileBytes = result.files.single.bytes;
        _fileName = result.files.single.name;
        _isImage = _fileName!.endsWith(".png") || _fileName!.endsWith(".jpg") || _fileName!.endsWith(".jpeg");
        _image = null;
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("File uploaded successfully")),
      );
    }
  }

  void _showUploadOptions() {
    showModalBottomSheet(
      context: context,
      builder: (_) => Wrap(
        children: [
          ListTile(
            leading: const Icon(Icons.camera_alt),
            title: const Text('Take Photo'),
            onTap: () {
              Navigator.pop(context);
              _pickImageFromCamera();
            },
          ),
          ListTile(
            leading: const Icon(Icons.upload_file),
            title: const Text('Choose File'),
            onTap: () {
              Navigator.pop(context);
              _pickFile();
            },
          ),
        ],
      ),
    );
  }

  void _viewUploadedContent() {
    if (_image != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Uploaded Image"),
          content: Image.file(_image!, fit: BoxFit.cover),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))],
        ),
      );
    } else if (_fileBytes != null) {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text(_fileName ?? "Uploaded File"),
          content: _isImage ? Image.memory(_fileBytes!, fit: BoxFit.cover) : const Icon(Icons.insert_drive_file, size: 60),
          actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))],
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("No image or file uploaded yet.")),
      );
    }
  }

  void _viewTaskDetails() {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Task Details"),
        content: Text(assignedTask ?? "No task assigned."),
        actions: [TextButton(onPressed: () => Navigator.pop(context), child: const Text("Close"))],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final previewWidget = _image != null
        ? Image.file(_image!, fit: BoxFit.cover)
        : _fileBytes != null && _isImage
            ? Image.memory(_fileBytes!, fit: BoxFit.cover)
            : const Icon(Icons.cloud_upload, size: 60, color: Colors.purple);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Tasks"),
        backgroundColor: const Color(0xFF8C6EAF),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFFFFFFFF), Color(0xFFD1C4E9)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: _showUploadOptions,
                child: Container(
                  height: 150,
                  width: 150,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.purple),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Center(child: previewWidget),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Task Assigned",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: _viewTaskDetails,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF655193),
                  foregroundColor: Colors.white,
                ),
                child: const Text("View Task"),
              ),
              const SizedBox(height: 30),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.purple.shade100,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Text(
                  "Daily Update Upload",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: _showUploadOptions,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF655193),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Upload"),
                  ),
                  ElevatedButton(
                    onPressed: _viewUploadedContent,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF655193),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("View"),
                  ),
                ],
              ),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
