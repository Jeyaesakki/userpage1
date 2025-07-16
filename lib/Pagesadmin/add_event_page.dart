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
import 'package:camera/camera.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:file_picker/file_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'event_model_page.dart';

const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class AddEventPage extends StatefulWidget {
  const AddEventPage({Key? key}) : super(key: key);

  @override
  State<AddEventPage> createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController locationCtrl = TextEditingController();
  final TextEditingController descCtrl = TextEditingController();
  final TextEditingController fromDateCtrl = TextEditingController();
  final TextEditingController toDateCtrl = TextEditingController();

  File? _selectedImage;
  XFile? _webImage;
  File? _selectedFile;

  final picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    for (var c in [nameCtrl, locationCtrl, descCtrl, fromDateCtrl, toDateCtrl]) {
      c.addListener(_onFieldChanged);
    }
  }

  @override
  void dispose() {
    nameCtrl.dispose();
    locationCtrl.dispose();
    descCtrl.dispose();
    fromDateCtrl.dispose();
    toDateCtrl.dispose();
    super.dispose();
  }

  void _onFieldChanged() => setState(() {});

  bool get _isFormValid {
    return nameCtrl.text.isNotEmpty &&
        fromDateCtrl.text.isNotEmpty &&
        toDateCtrl.text.isNotEmpty &&
        locationCtrl.text.isNotEmpty &&
        descCtrl.text.isNotEmpty &&
        (_selectedImage != null || _webImage != null);
  }

  void _handleCreate() {
    if (_isFormValid) {
      final newEvent = Event(
        name: nameCtrl.text,
        fromDate: DateTime.tryParse(fromDateCtrl.text) ?? DateTime.now(),
        toDate: DateTime.tryParse(toDateCtrl.text) ?? DateTime.now(),
        location: locationCtrl.text,
        imagePath: _selectedImage?.path ?? _webImage?.path ?? '',
        filePath: _selectedFile?.path,
        description: descCtrl.text,
      );
      eventsList.add(newEvent);
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fill all required fields')),
      );
    }
  }

  Future<void> _pickImage(Function(File) onImagePicked) async {
    await showModalBottomSheet(
      context: context,
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.camera_alt),
              title: const Text('Take Photo'),
              onTap: () async {
                Navigator.pop(context);
                if (kIsWeb) {
                  _showWebCameraNotSupported();
                  return;
                }
                if (await _requestPermission(Permission.camera)) {
                  final file = await Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const CameraCapturePage()),
                  );
                  if (file != null && file is File) {
                    onImagePicked(file);
                    _onFieldChanged();
                  }
                }
              },
            ),
            ListTile(
              leading: const Icon(Icons.photo_library),
              title: const Text('Choose from Gallery'),
              onTap: () async {
                Navigator.pop(context);
                if (kIsWeb) {
                  final picked = await picker.pickImage(source: ImageSource.gallery);
                  if (picked != null) {
                    setState(() => _webImage = picked);
                    _onFieldChanged();
                  }
                } else {
                  if (await _requestPermission(Permission.photos)) {
                    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
                    if (pickedFile != null) {
                      onImagePicked(File(pickedFile.path));
                      _onFieldChanged();
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result != null && result.files.single.path != null) {
      setState(() => _selectedFile = File(result.files.single.path!));
    }
  }

  Future<bool> _requestPermission(Permission permission) async {
    if (kIsWeb) return true;
    if (await permission.isGranted) return true;
    final result = await permission.request();
    return result.isGranted;
  }

  Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = DateFormat('yyyy-MM-dd').format(picked);
      _onFieldChanged();
    }
  }

  void _showWebCameraNotSupported() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Camera is not supported on web')),
    );
  }

  Widget _buildLabel(String text, {bool required = false}) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 5),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          children: [
            TextSpan(text: text),
            if (required) TextSpan(text: ' *', style: const TextStyle(color: Colors.red)),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller,
      {String? hint, bool readOnly = false, int maxLines = 1, VoidCallback? onTap}) {
    return TextField(
      controller: controller,
      readOnly: readOnly,
      maxLines: maxLines,
      onTap: onTap,
      decoration: InputDecoration(
        hintText: hint,
        border: const OutlineInputBorder(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final uploadedImageWidget = kIsWeb
        ? (_webImage != null
            ? Image.network(_webImage!.path, height: 150, fit: BoxFit.cover)
            : null)
        : (_selectedImage != null
            ? Image.file(_selectedImage!, height: 150, fit: BoxFit.cover)
            : null);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Event"),
        backgroundColor: kAppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            _buildLabel("Event Name", required: true),
            _buildTextField(nameCtrl, hint: "Name"),

            _buildLabel("From", required: true),
            _buildTextField(
              fromDateCtrl,
              hint: "Choose date",
              readOnly: true,
              onTap: () => _selectDate(context, fromDateCtrl),
            ),

            _buildLabel("To", required: true),
            _buildTextField(
              toDateCtrl,
              hint: "Choose date",
              readOnly: true,
              onTap: () => _selectDate(context, toDateCtrl),
            ),

            _buildLabel("Location", required: true),
            _buildTextField(locationCtrl, hint: "Location"),

            _buildLabel("Upload Image", required: true),
            InkWell(
              onTap: () => _pickImage((file) => setState(() => _selectedImage = file)),
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: kButtonColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(Icons.upload, color: kButtonColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        (_selectedImage == null && _webImage == null)
                            ? "Tap to Upload Image"
                            : "Image Selected",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (uploadedImageWidget != null)
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: uploadedImageWidget,
                ),
              ),

            _buildLabel("Upload File (Optional)"),
            InkWell(
              onTap: _pickFile,
              child: Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  border: Border.all(color: kButtonColor),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Icon(Icons.attach_file, color: kButtonColor),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        _selectedFile == null
                            ? "Tap to Select File"
                            : _selectedFile!.path.split('/').last,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            _buildLabel("Description", required: true),
            _buildTextField(descCtrl, hint: "Enter Description", maxLines: 3),

            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel", style: TextStyle(color: kButtonColor)),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _handleCreate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kButtonColor,
                    foregroundColor: kTextColor,
                  ),
                  child: const Text("Create"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class CameraCapturePage extends StatefulWidget {
  const CameraCapturePage({Key? key}) : super(key: key);

  @override
  State<CameraCapturePage> createState() => _CameraCapturePageState();
}

class _CameraCapturePageState extends State<CameraCapturePage> {
  CameraController? _controller;
  List<CameraDescription>? _cameras;
  bool _isCameraInitialized = false;
  bool _isTakingPicture = false;

  @override
  void initState() {
    super.initState();
    _initCamera();
  }

  Future<void> _initCamera() async {
    _cameras = await availableCameras();
    if (_cameras != null && _cameras!.isNotEmpty) {
      _controller = CameraController(_cameras![0], ResolutionPreset.medium);
      await _controller!.initialize();
      setState(() => _isCameraInitialized = true);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  Future<void> _takePicture() async {
    if (_controller == null || !_controller!.value.isInitialized || _isTakingPicture) return;
    setState(() => _isTakingPicture = true);
    try {
      final XFile file = await _controller!.takePicture();
      Navigator.pop(context, File(file.path));
    } catch (e) {
      print("Error capturing image: $e");
    }
    setState(() => _isTakingPicture = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isCameraInitialized
          ? Stack(
              children: [
                CameraPreview(_controller!),
                Positioned(
                  bottom: 40,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: FloatingActionButton(
                      backgroundColor: Colors.white,
                      onPressed: _takePicture,
                      child: const Icon(Icons.camera, color: Colors.black),
                    ),
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
