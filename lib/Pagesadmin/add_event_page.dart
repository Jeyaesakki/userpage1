


// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'event_model_page.dart';

// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF); // Light lavender
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9); // Deeper lavender
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class EventUploadPage extends StatefulWidget {
//   const EventUploadPage({super.key});

//   @override
//   State<EventUploadPage> createState() => _EventUploadPageState();
// }

// class _EventUploadPageState extends State<EventUploadPage> {
//   final nameCtrl = TextEditingController();
//   final fromDateCtrl = TextEditingController();
//   final toDateCtrl = TextEditingController();
//   final locationCtrl = TextEditingController();
//   final descCtrl = TextEditingController();

//   File? _image;
//   String? _fileName;

//   Future<void> _pickImage() async {
//     final pickedFile =
//         await ImagePicker().pickImage(source: ImageSource.gallery);
//     if (pickedFile != null) {
//       setState(() {
//         _image = File(pickedFile.path);
//       });
//     }
//   }

//   Future<void> _pickFile() async {
//     FilePickerResult? result = await FilePicker.platform.pickFiles();
//     if (result != null) {
//       setState(() {
//         _fileName = result.files.single.name;
//       });
//     }
//   }

//   Future<void> _selectDate(
//       BuildContext context, TextEditingController controller) async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: DateTime.now(),
//       firstDate: DateTime(2020),
//       lastDate: DateTime(2101),
//     );
//     if (picked != null) {
//       setState(() {
//         controller.text = DateFormat('yyyy-MM-dd').format(picked);
//       });
//     }
//   }

//   Widget _buildTextField(TextEditingController controller,
//       {required String label,
//       bool readOnly = false,
//       int maxLines = 1,
//       VoidCallback? onTap}) {
//     final labelParts = label.split('*');
//     final mainLabel = labelParts[0].trim();
//     final hasStar = label.contains('*');

//     return TextFormField(
//       controller: controller,
//       readOnly: readOnly,
//       maxLines: maxLines,
//       onTap: onTap,
//       decoration: InputDecoration(
//         label: RichText(
//           text: TextSpan(
//             children: [
//               TextSpan(
//                 text: mainLabel,
//                 style: const TextStyle(
//                   color: Colors.grey,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//               if (hasStar)
//                 const TextSpan(
//                   text: ' *',
//                   style: TextStyle(
//                     color: Colors.red,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         border: const OutlineInputBorder(),
//       ),
//     );
//   }

//   void _submitForm() {
//     if (nameCtrl.text.isEmpty ||
//         fromDateCtrl.text.isEmpty ||
//         toDateCtrl.text.isEmpty ||
//         locationCtrl.text.isEmpty ||
//         descCtrl.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Please fill all required fields.")),
//       );
//       return;
//     }

//     final event = EventModel(
//       name: nameCtrl.text,
//       fromDate: DateTime.parse(fromDateCtrl.text),
//       toDate: DateTime.parse(toDateCtrl.text),
//       location: locationCtrl.text,
//       description: descCtrl.text,
//       imagePath: _image?.path ?? '',
//     );

//     eventsList.add(event);

//     Navigator.pop(context); // Go back to EventUpdatesPage
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Upload Event Details"),
//         backgroundColor: kAppBarColor,
//         foregroundColor: kTextColor,
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               _buildTextField(nameCtrl, label: "Event Name *"),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 fromDateCtrl,
//                 label: "From Date *",
//                 readOnly: true,
//                 onTap: () => _selectDate(context, fromDateCtrl),
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(
//                 toDateCtrl,
//                 label: "To Date *",
//                 readOnly: true,
//                 onTap: () => _selectDate(context, toDateCtrl),
//               ),
//               const SizedBox(height: 10),
//               _buildTextField(locationCtrl, label: "Location *"),
//               const SizedBox(height: 10),
//               _buildTextField(descCtrl, label: "Description *", maxLines: 3),
//               const SizedBox(height: 20),

//               const Text(
//                 "Upload Event Banner (Image)",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 5),
//               Row(
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: _pickImage,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kButtonColor,
//                       foregroundColor: kTextColor,
//                     ),
//                     icon: const Icon(Icons.photo),
//                     label: const Text("Pick Image"),
//                   ),
//                   const SizedBox(width: 10),
//                   if (_image != null)
//                     const Text("Selected", style: TextStyle(color: Colors.green)),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               const Text(
//                 "Upload Related File (PDF, DOC, etc.)",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 5),
//               Row(
//                 children: [
//                   ElevatedButton.icon(
//                     onPressed: _pickFile,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kButtonColor,
//                       foregroundColor: kTextColor,
//                     ),
//                     icon: const Icon(Icons.attach_file),
//                     label: const Text("Pick File"),
//                   ),
//                   const SizedBox(width: 10),
//                   if (_fileName != null) Text(_fileName!),
//                 ],
//               ),
//               const SizedBox(height: 30),

//               Center(
//                 child: Container(
//                   width: double.infinity,
//                   height: 50,
//                   decoration: BoxDecoration(
//                     gradient: const LinearGradient(
//                       colors: [Color(0xFF8C6EAF), Color(0xFF655193)],
//                     ),
//                     borderRadius: BorderRadius.circular(8),
//                   ),
//                   child: ElevatedButton(
//                     onPressed: _submitForm,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.transparent,
//                       shadowColor: Colors.transparent,
//                       foregroundColor: Colors.white,
//                     ),
//                     child: const Text(
//                       "Submit",
//                       style: TextStyle(fontWeight: FontWeight.bold),
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'event_model_page.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF); // Light lavender
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9); // Deeper lavender
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
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
      if (controller == toDateCtrl && fromDateCtrl.text.isNotEmpty) {
        final fromDate = DateTime.tryParse(fromDateCtrl.text);
        if (fromDate != null && picked.isBefore(fromDate)) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("To Date cannot be before From Date."),
              backgroundColor: Colors.red,
            ),
          );
          return;
        }
      }

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
                  fontWeight: FontWeight.bold,
                ),
              ),
              if (hasStar)
                const TextSpan(
                  text: ' *',
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
            ],
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }

  void _submitForm() {
    if (nameCtrl.text.isEmpty ||
        fromDateCtrl.text.isEmpty ||
        toDateCtrl.text.isEmpty ||
        locationCtrl.text.isEmpty ||
        descCtrl.text.isEmpty ||
        _image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all required fields and upload an image."),
        ),
      );
      return;
    }

    final event = EventModel(
      name: nameCtrl.text,
      fromDate: DateTime.parse(fromDateCtrl.text),
      toDate: DateTime.parse(toDateCtrl.text),
      location: locationCtrl.text,
      description: descCtrl.text,
      imagePath: _image!.path,
    );

    eventsList.add(event);

    Navigator.pop(context); // Go back to EventUpdatesPage
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

              // ---------- Image Upload (with red star) ----------
              RichText(
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Upload Event Banner Image",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black, // default text color
                      ),
                    ),
                    TextSpan(
                      text: ' *',
                      style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
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
                    label: const Text("Upload Image"),
                  ),
                  const SizedBox(width: 10),
                  if (_image != null)
                    const Text("Selected", style: TextStyle(color: Color.fromARGB(255, 56, 58, 56))),
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
                    label: const Text("Upload File"),
                  ),
                  const SizedBox(width: 10),
                  if (_fileName != null) Text(_fileName!),
                ],
              ),
              const SizedBox(height: 30),

              Center(
                child: Container
                  (
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [Color(0xFF8C6EAF), Color(0xFF655193)],
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text(
                      "Submit",
                      style: TextStyle(fontWeight: FontWeight.bold),
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


