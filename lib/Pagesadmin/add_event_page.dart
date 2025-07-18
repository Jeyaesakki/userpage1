// import 'dart:io';
// import 'package:camera/camera.dart';
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'event_model_page.dart';

// class AddEventPage extends StatefulWidget {
//   const AddEventPage({Key? key}) : super(key: key);

//   @override
//   State<AddEventPage> createState() => _AddEventPageState();
// }

// class _AddEventPageState extends State<AddEventPage> {
//   final TextEditingController nameCtrl     = TextEditingController();
//   final TextEditingController locationCtrl = TextEditingController();
//   final TextEditingController descCtrl     = TextEditingController();
//   final TextEditingController fromDateCtrl = TextEditingController();
//   final TextEditingController toDateCtrl   = TextEditingController();

//   File? _selectedImage;
//   XFile? _webImage;
//   File? _selectedFile;

//   final picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     // re-render whenever a text field changes
//     for (var c in [nameCtrl, locationCtrl, descCtrl, fromDateCtrl, toDateCtrl]) {
//       c.addListener(_onFieldChanged);
//     }
//   }

//   @override
//   void dispose() {
//     nameCtrl.dispose();
//     locationCtrl.dispose();
//     descCtrl.dispose();
//     fromDateCtrl.dispose();
//     toDateCtrl.dispose();
//     super.dispose();
//   }

//   void _onFieldChanged() => setState(() {});

//   bool get _isFormValid {
//     return
//       nameCtrl.text.isNotEmpty &&
//       fromDateCtrl.text.isNotEmpty &&
//       toDateCtrl.text.isNotEmpty &&
//       locationCtrl.text.isNotEmpty &&
//       descCtrl.text.isNotEmpty &&
//       (_selectedImage != null || _webImage != null);
//   }

//   void _handleCreate() {
//     if (_isFormValid) {
//       final newEvent = Event(
//         name: nameCtrl.text,
//         fromDate: DateTime.tryParse(fromDateCtrl.text) ?? DateTime.now(),
//         toDate:   DateTime.tryParse(toDateCtrl.text)   ?? DateTime.now(),
//         location: locationCtrl.text,
//         imagePath: _selectedImage?.path ?? _webImage?.path ?? '',
//         filePath:  _selectedFile?.path,
//         description: descCtrl.text,
//       );
//       eventsList.add(newEvent);
//       Navigator.pop(context);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Please fill all required fields')),
//       );
//     }
//   }

//   Future<void> _pickImage(Function(File) onImagePicked) async {
//     await showModalBottomSheet(
//       context: context,
//       builder: (context) => SafeArea(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             ListTile(
//               leading: const Icon(Icons.camera_alt),
//               title: const Text('Take Photo'),
//               onTap: () async {
//                 Navigator.pop(context);
//                 if (kIsWeb) {
//                   _showWebCameraNotSupported();
//                   return;
//                 }
//                 if (await _requestPermission(Permission.camera)) {
//                   final file = await Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (_) => const CameraCapturePage()),
//                   );
//                   if (file != null && file is File) {
//                     onImagePicked(file);
//                     _onFieldChanged();
//                   }
//                 }
//               },
//             ),
//             ListTile(
//               leading: const Icon(Icons.photo_library),
//               title: const Text('Choose from Gallery'),
//               onTap: () async {
//                 Navigator.pop(context);
//                 if (kIsWeb) {
//                   final picked = await picker.pickImage(source: ImageSource.gallery);
//                   if (picked != null) {
//                     setState(() => _webImage = picked);
//                     _onFieldChanged();
//                   }
//                 } else {
//                   if (await _requestPermission(Permission.photos)) {
//                     final pickedFile = await picker.pickImage(source: ImageSource.gallery);
//                     if (pickedFile != null) {
//                       onImagePicked(File(pickedFile.path));
//                       _onFieldChanged();
//                     }
//                   }
//                 }
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future<void> _pickFile() async {
//     final result = await FilePicker.platform.pickFiles();
//     if (result != null && result.files.single.path != null) {
//       setState(() => _selectedFile = File(result.files.single.path!));
//     }
//   }

//   Future<bool> _requestPermission(Permission permission) async {
//     if (kIsWeb) return true;
//     if (await permission.isGranted) return true;
//     final result = await permission.request();
//     return result.isGranted;
//   }

//   Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
//     DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2000),
//       lastDate:  DateTime(2100),
//     );
//     if (picked != null) {
//       controller.text = DateFormat('yyyy-MM-dd').format(picked);
//       _onFieldChanged();
//     }
//   }

//   void _showWebCameraNotSupported() {
//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text('Camera is not supported on web')),
//     );
//   }

//   Widget _buildLabel(String text, {bool required = false}) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 15, bottom: 5),
//       child: RichText(
//         text: TextSpan(
//           style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
//           children: [
//             TextSpan(text: text),
//             if (required) TextSpan(text: ' *', style: const TextStyle(color: Colors.red)),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _buildTextField(
//       TextEditingController controller, {
//       String? hint,
//       bool readOnly = false,
//       int maxLines = 1,
//       VoidCallback? onTap,
//     }) {
//     return TextField(
//       controller: controller,
//       readOnly: readOnly,
//       maxLines: maxLines,
//       onTap: onTap,
//       decoration: InputDecoration(
//         hintText: hint,
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final uploadedImageWidget = kIsWeb
//         ? (_webImage != null
//             ? Image.network(_webImage!.path, height: 150, fit: BoxFit.cover)
//             : null)
//         : (_selectedImage != null
//             ? Image.file(_selectedImage!, height: 150, fit: BoxFit.cover)
//             : null);

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Event"),
//         backgroundColor: const Color.fromARGB(255, 82, 147, 180),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20),
//         child: ListView(
//           children: [
//             _buildLabel("Event Name", required: true),
//             _buildTextField(nameCtrl, hint: "Name"),

//             _buildLabel("From", required: true),
//             _buildTextField(
//               fromDateCtrl,
//               hint: "Choose date",
//               readOnly: true,
//               onTap: () => _selectDate(context, fromDateCtrl),
//             ),

//             _buildLabel("To", required: true),
//             _buildTextField(
//               toDateCtrl,
//               hint: "Choose date",
//               readOnly: true,
//               onTap: () => _selectDate(context, toDateCtrl),
//             ),

//             _buildLabel("Location", required: true),
//             _buildTextField(locationCtrl, hint: "Location"),

//             _buildLabel("Upload Image", required: true),
//             InkWell(
//               onTap: () => _pickImage((file) => setState(() => _selectedImage = file)),
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.grey),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.upload, color: Colors.deepPurple),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         (_selectedImage == null && _webImage == null)
//                             ? "Tap to Upload Image"
//                             : "Image Selected",
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             if (uploadedImageWidget != null)
//               Padding(
//                 padding: const EdgeInsets.only(top: 10),
//                 child: ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: uploadedImageWidget,
//                 ),
//               ),

//             _buildLabel("Upload File (Optional)"),
//             InkWell(
//               onTap: _pickFile,
//               child: Container(
//                 padding: const EdgeInsets.all(12),
//                 decoration: BoxDecoration(
//                   border: Border.all(color: Colors.teal),
//                   borderRadius: BorderRadius.circular(5),
//                 ),
//                 child: Row(
//                   children: [
//                     const Icon(Icons.attach_file, color: Colors.teal),
//                     const SizedBox(width: 10),
//                     Expanded(
//                       child: Text(
//                         _selectedFile == null
//                             ? "Tap to Select File"
//                             : _selectedFile!.path.split('/').last,
//                         style: const TextStyle(fontSize: 16),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             _buildLabel("Description", required: true),
//             _buildTextField(descCtrl, hint: "Enter Description", maxLines: 3),

//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 TextButton(
//                   onPressed: () => Navigator.pop(context),
//                   child: const Text("Cancel"),
//                 ),
//                 const SizedBox(width: 10),
//                 ElevatedButton(
//                   onPressed: _handleCreate,
//                   child: const Text("Create"),
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }


// /// ---- Your CameraCapturePage remains unchanged below ----

// class CameraCapturePage extends StatefulWidget {
//   const CameraCapturePage({Key? key}) : super(key: key);
//   @override
//   State<CameraCapturePage> createState() => _CameraCapturePageState();
// }

// class _CameraCapturePageState extends State<CameraCapturePage> {
//   CameraController? _controller;
//   List<CameraDescription>? _cameras;
//   bool _isCameraInitialized = false;
//   bool _isTakingPicture = false;

//   @override
//   void initState() {
//     super.initState();
//     _initCamera();
//   }

//   Future<void> _initCamera() async {
//     _cameras = await availableCameras();
//     if (_cameras != null && _cameras!.isNotEmpty) {
//       _controller = CameraController(_cameras![0], ResolutionPreset.medium);
//       await _controller!.initialize();
//       setState(() => _isCameraInitialized = true);
//     }
//   }

//   @override
//   void dispose() {
//     _controller?.dispose();
//     super.dispose();
//   }

//   Future<void> _takePicture() async {
//     if (_controller == null || !_controller!.value.isInitialized || _isTakingPicture) return;
//     setState(() => _isTakingPicture = true);
//     try {
//       final XFile file = await _controller!.takePicture();
//       Navigator.pop(context, File(file.path));
//     } catch (e) {
//       print("Error capturing image: $e");
//     }
//     setState(() => _isTakingPicture = false);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _isCameraInitialized
//           ? Stack(
//               children: [
//                 CameraPreview(_controller!),
//                 Positioned(
//                   bottom: 40,
//                   left: 0,
//                   right: 0,
//                   child: Center(
//                     child: FloatingActionButton(
//                       backgroundColor: Colors.white,
//                       onPressed: _takePicture,
//                       child: const Icon(Icons.camera, color: Colors.black),
//                     ),
//                   ),
//                 ),
//                 Positioned(
//                   top: 40,
//                   left: 20,
//                   child: IconButton(
//                     icon: const Icon(Icons.arrow_back, color: Colors.white),
//                     onPressed: () => Navigator.pop(context),
//                   ),
//                 ),
//               ],
//             )
//           : const Center(child: CircularProgressIndicator()),
//     );
//   }
// }



import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF); // Light lavender
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9); // Deeper lavender
const Color kAppBarColor = Color(0xFF8C6EAF); // Updated app bar color
const Color kButtonColor = Color(0xFF655193); // Updated button color
const Color kTextColor = Colors.white;

class EventUploadPage extends StatefulWidget {
  const EventUploadPage({super.key});

  @override
  State<EventUploadPage> createState() => _EventUploadPageState();
}

class _EventUploadPageState extends State<EventUploadPage> {
  final nameCtrl = TextEditingController();
  final fromDateCtrl = TextEditingController();
  final toDateCtrl = TextEditingController();
  final locationCtrl = TextEditingController();
  final descCtrl = TextEditingController();

  File? _image;
  String? _fileName;

  Future<void> _pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
      });
    }
  }

  Future<void> _selectDate(
      BuildContext context, TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      setState(() {
        controller.text = DateFormat('yyyy-MM-dd').format(picked);
      });
    }
  }

  Widget _buildTextField(TextEditingController controller,
      {required String label,
      bool readOnly = false,
      int maxLines = 1,
      VoidCallback? onTap}) {
    final labelParts = label.split('*');
    final mainLabel = labelParts[0].trim();
    final hasStar = label.contains('*');

    return TextFormField(
      controller: controller,
      readOnly: readOnly,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: mainLabel,
                style: const TextStyle(
                  color: Colors.grey,
                  fontWeight: FontWeight.bold, // ✅ Bold
                ),
              ),
              if (hasStar)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold, // ✅ Bold
                  ),
                ),
            ],
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Upload Event Details"),
        backgroundColor: kAppBarColor,
        foregroundColor: kTextColor,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField(nameCtrl, label: "Event Name *"),
              const SizedBox(height: 10),
              _buildTextField(
                fromDateCtrl,
                label: "From Date *",
                readOnly: true,
                onTap: () => _selectDate(context, fromDateCtrl),
              ),
              const SizedBox(height: 10),
              _buildTextField(
                toDateCtrl,
                label: "To Date *",
                readOnly: true,
                onTap: () => _selectDate(context, toDateCtrl),
              ),
              const SizedBox(height: 10),
              _buildTextField(locationCtrl, label: "Location *"),
              const SizedBox(height: 10),
              _buildTextField(descCtrl, label: "Description *", maxLines: 3),
              const SizedBox(height: 20),

              const Text(
                "Upload Event Banner (Image)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickImage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonColor,
                      foregroundColor: kTextColor,
                    ),
                    icon: const Icon(Icons.photo),
                    label: const Text("Pick Image"),
                  ),
                  const SizedBox(width: 10),
                  if (_image != null)
                    const Text("Selected",
                        style: TextStyle(color: Colors.green)),
                ],
              ),
              const SizedBox(height: 20),

              const Text(
                "Upload Related File (PDF, DOC, etc.)",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                children: [
                  ElevatedButton.icon(
                    onPressed: _pickFile,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonColor,
                      foregroundColor: kTextColor,
                    ),
                    icon: const Icon(Icons.attach_file),
                    label: const Text("Pick File"),
                  ),
                  const SizedBox(width: 10),
                  if (_fileName != null) Text(_fileName!),
                ],
              ),
              const SizedBox(height: 30),

              Center(
                child: Container(
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8C6EAF), Color(0xFF655193)],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("Submitted successfully")),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold), // ✅ Bold
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}