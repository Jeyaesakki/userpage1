
// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:file_picker/file_picker.dart';
// import 'package:open_filex/open_filex.dart';
// import 'package:path_provider/path_provider.dart';

// const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor = Color(0xFF8C6EAF);
// const Color kButtonColor = Color(0xFF655193);
// const Color kTextColor = Colors.white;

// class ApplyHalfDayForm extends StatefulWidget {
//   const ApplyHalfDayForm({super.key});

//   @override
//   State<ApplyHalfDayForm> createState() => _ApplyHalfDayFormState();
// }

// class _ApplyHalfDayFormState extends State<ApplyHalfDayForm> {
//   final _formKey = GlobalKey<FormState>();
//   String? leaveType;
//   String? shift;
//   DateTime? selectedDate;
//   PlatformFile? pickedFile;

//   final TextEditingController shiftGroupController = TextEditingController();
//   final TextEditingController sessionController = TextEditingController();
//   final TextEditingController reasonController = TextEditingController();

//   final List<String> leaveTypes = [
//     'Permission Time',
//     'Over Time',
//     'Half Day Time',
//     'Comp Off',
//   ];

//   final List<String> shifts = ['Morning Shift', 'Evening Shift'];

//   Future<void> _pickDate() async {
//     final picked = await showDatePicker(
//       context: context,
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2100),
//       initialDate: DateTime.now(),
//     );

//     if (picked != null) {
//       setState(() {
//         selectedDate = picked;
//       });
//     }
//   }

//   Future<void> _pickFile() async {
//     final result = await FilePicker.platform.pickFiles(withData: true);
//     if (result != null && result.files.isNotEmpty) {
//       final file = result.files.first;

//       if (file.path == null && file.bytes != null) {
//         final tempDir = await getTemporaryDirectory();
//         final tempPath = "${tempDir.path}/${file.name}";
//         final tempFile = File(tempPath);
//         await tempFile.writeAsBytes(file.bytes!);

//         setState(() {
//           pickedFile = PlatformFile(
//             name: file.name,
//             size: file.size,
//             path: tempPath,
//             bytes: file.bytes,
//           );
//         });
//       } else {
//         setState(() {
//           pickedFile = file;
//         });
//       }
//     }
//   }

//   void _viewFile() {
//     final ext = pickedFile?.extension?.toLowerCase();

//     if (ext == 'jpg' || ext == 'jpeg' || ext == 'png') {
//       showDialog(
//         context: context,
//         builder: (_) => AlertDialog(
//           title: const Text("Image Preview"),
//           content: pickedFile?.bytes != null
//               ? Image.memory(pickedFile!.bytes!)
//               : pickedFile?.path != null
//                   ? Image.file(File(pickedFile!.path!))
//                   : const Text("Unable to preview image."),
//           actions: [
//             TextButton(
//               onPressed: () => Navigator.pop(context),
//               child: const Text("Close"),
//             ),
//           ],
//         ),
//       );
//     } else if (pickedFile?.path != null) {
//       OpenFilex.open(pickedFile!.path!);
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Cannot open this file.")),
//       );
//     }
//   }

//   Widget _buildDropdown({
//     required String label,
//     required String? value,
//     required List<String> items,
//     required void Function(String?) onChanged,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('$label *', style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 5),
//         DropdownButtonFormField<String>(
//           value: value,
//           decoration: const InputDecoration(border: OutlineInputBorder()),
//           hint: Text('Choose $label'),
//           items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
//           onChanged: onChanged,
//           validator: (val) => val == null ? 'Please select $label' : null,
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }

//   Widget _buildTextField({
//     required String label,
//     required TextEditingController controller,
//     TextInputType inputType = TextInputType.text,
//   }) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text('$label *', style: const TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 5),
//         TextFormField(
//           controller: controller,
//           keyboardType: inputType,
//           validator: (val) =>
//               val == null || val.trim().isEmpty ? 'Please enter $label' : null,
//           decoration: InputDecoration(
//             hintText: "Enter $label",
//             border: const OutlineInputBorder(),
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }

//   Widget _buildDateField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Date *", style: TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 5),
//         TextFormField(
//           readOnly: true,
//           onTap: _pickDate,
//           validator: (_) => selectedDate == null ? 'Please choose a date' : null,
//           decoration: InputDecoration(
//             border: const OutlineInputBorder(),
//             hintText: selectedDate == null
//                 ? 'Choose Date'
//                 : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
//           ),
//         ),
//         const SizedBox(height: 16),
//       ],
//     );
//   }

//   Widget _buildUploadSection() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         const Text("Upload File/Image *", style: TextStyle(fontWeight: FontWeight.bold)),
//         const SizedBox(height: 8),
//         Row(
//           children: [
//             ElevatedButton.icon(
//               onPressed: _pickFile,
//               icon: const Icon(Icons.upload_file),
//               label: const Text("Choose File"),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: kButtonColor.withOpacity(0.3),
//               ),
//             ),
//             const SizedBox(width: 10),
//             Expanded(
//               child: Text(
//                 pickedFile != null ? pickedFile!.name : "No file selected",
//                 style: const TextStyle(fontSize: 14),
//                 overflow: TextOverflow.ellipsis,
//               ),
//             ),
//           ],
//         ),
//         const SizedBox(height: 10),
//         if (pickedFile != null)
//           ElevatedButton.icon(
//             onPressed: _viewFile,
//             icon: const Icon(Icons.visibility),
//             label: const Text("View"),
//             style: ElevatedButton.styleFrom(
//               backgroundColor: kButtonColor.withOpacity(0.2),
//             ),
//           ),
//         const SizedBox(height: 20),
//       ],
//     );
//   }

//   void _handleSubmit() {
//     if (_formKey.currentState!.validate()) {
//       if (pickedFile == null) {
//         ScaffoldMessenger.of(context).showSnackBar(
//           const SnackBar(content: Text("Please upload a file.")),
//         );
//         return;
//       }

//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Form submitted successfully!")),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundBottom,
//       appBar: AppBar(
//         title: const Text("Apply"),
//         backgroundColor: kAppBarColor,
//         foregroundColor: kTextColor,
//         leading: BackButton(onPressed: () => Navigator.pop(context)),
//       ),
//       body: SingleChildScrollView(
//         padding: const EdgeInsets.all(16.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               _buildDropdown(
//                 label: "Leave Type",
//                 value: leaveType,
//                 items: leaveTypes,
//                 onChanged: (val) => setState(() => leaveType = val),
//               ),
//               _buildDropdown(
//                 label: "Shift",
//                 value: shift,
//                 items: shifts,
//                 onChanged: (val) => setState(() => shift = val),
//               ),
//               _buildTextField(label: "Shift Group", controller: shiftGroupController),
//               _buildTextField(
//                 label: "Session Time",
//                 controller: sessionController,
//                 inputType: TextInputType.datetime,
//               ),
//               _buildTextField(label: "Reason", controller: reasonController),
//               _buildDateField(),
//               _buildUploadSection(),
//               ElevatedButton(
//                 onPressed: _handleSubmit,
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: kButtonColor,
//                   foregroundColor: kTextColor,
//                   minimumSize: const Size.fromHeight(50),
//                 ),
//                 child: const Text("Submit"),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



import 'dart:io';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path_provider/path_provider.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class ApplyHalfDayForm extends StatefulWidget {
  const ApplyHalfDayForm({super.key});

  @override
  State<ApplyHalfDayForm> createState() => _ApplyHalfDayFormState();
}

class _ApplyHalfDayFormState extends State<ApplyHalfDayForm> {
  final _formKey = GlobalKey<FormState>();
  String? leaveType;
  String? shift;
  DateTime? selectedDate;
  PlatformFile? pickedFile;

  final TextEditingController shiftGroupController = TextEditingController();
  final TextEditingController sessionController = TextEditingController();
  final TextEditingController reasonController = TextEditingController();

  final List<String> leaveTypes = [
    'Permission Time',
    'Over Time',
    'Half Day Time',
    'Comp Off',
  ];

  final List<String> shifts = ['Morning Shift', 'Evening Shift'];

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
      initialDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> _pickFile() async {
    final result = await FilePicker.platform.pickFiles(withData: true);
    if (result != null && result.files.isNotEmpty) {
      final file = result.files.first;

      if (file.path == null && file.bytes != null) {
        final tempDir = await getTemporaryDirectory();
        final tempPath = "${tempDir.path}/${file.name}";
        final tempFile = File(tempPath);
        await tempFile.writeAsBytes(file.bytes!);

        setState(() {
          pickedFile = PlatformFile(
            name: file.name,
            size: file.size,
            path: tempPath,
            bytes: file.bytes,
          );
        });
      } else {
        setState(() {
          pickedFile = file;
        });
      }
    }
  }

  void _viewFile() {
    final ext = pickedFile?.extension?.toLowerCase();

    if (ext == 'jpg' || ext == 'jpeg' || ext == 'png') {
      showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: const Text("Image Preview"),
          content: pickedFile?.bytes != null
              ? Image.memory(pickedFile!.bytes!)
              : pickedFile?.path != null
                  ? Image.file(File(pickedFile!.path!))
                  : const Text("Unable to preview image."),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text("Close"),
            ),
          ],
        ),
      );
    } else if (pickedFile?.path != null) {
      OpenFilex.open(pickedFile!.path!);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Cannot open this file.")),
      );
    }
  }

  Widget _buildDropdown({
    required String label,
    required String? value,
    required List<String> items,
    required void Function(String?) onChanged,
  }) {
    return DropdownButtonFormField<String>(
      value: value,
      decoration: InputDecoration(
        border: const OutlineInputBorder(),
        label: RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
      ),
      hint: Text('Choose $label'),
      items: items.map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
      onChanged: onChanged,
      validator: (val) => val == null ? 'Please select $label' : null,
    );
  }

  Widget _buildTextField({
    required String label,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: inputType,
      validator: (val) =>
          val == null || val.trim().isEmpty ? 'Please enter $label' : null,
      decoration: InputDecoration(
        label: RichText(
          text: TextSpan(
            text: label,
            style: const TextStyle(color: Colors.black87, fontSize: 16),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        border: const OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDateField() {
    return TextFormField(
      readOnly: true,
      onTap: _pickDate,
      validator: (_) => selectedDate == null ? 'Please choose a date' : null,
      decoration: InputDecoration(
        label: RichText(
          text: const TextSpan(
            text: 'Date',
            style: TextStyle(color: Colors.black87, fontSize: 16),
            children: [
              TextSpan(
                text: ' *',
                style: TextStyle(color: Colors.red),
              ),
            ],
          ),
        ),
        border: const OutlineInputBorder(),
        hintText: selectedDate == null
            ? 'Choose Date'
            : "${selectedDate!.day}-${selectedDate!.month}-${selectedDate!.year}",
      ),
    );
  }

  Widget _buildUploadSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("Upload File/Image *", style: TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Row(
          children: [
            ElevatedButton.icon(
              onPressed: _pickFile,
              icon: const Icon(Icons.upload_file),
              label: const Text("Choose File"),
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor.withOpacity(0.3),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Text(
                pickedFile != null ? pickedFile!.name : "No file selected",
                style: const TextStyle(fontSize: 14),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        if (pickedFile != null)
          ElevatedButton.icon(
            onPressed: _viewFile,
            icon: const Icon(Icons.visibility),
            label: const Text("View"),
            style: ElevatedButton.styleFrom(
              backgroundColor: kButtonColor.withOpacity(0.2),
            ),
          ),
        const SizedBox(height: 20),
      ],
    );
  }

  void _handleSubmit() {
    if (_formKey.currentState!.validate()) {
      if (pickedFile == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Please upload a file.")),
        );
        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Form submitted successfully!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryBackgroundBottom,
      appBar: AppBar(
        title: const Text("Apply"),
        backgroundColor: kAppBarColor,
        foregroundColor: kTextColor,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _buildDropdown(
                label: "Leave Type",
                value: leaveType,
                items: leaveTypes,
                onChanged: (val) => setState(() => leaveType = val),
              ),
              const SizedBox(height: 16),
              _buildDropdown(
                label: "Shift",
                value: shift,
                items: shifts,
                onChanged: (val) => setState(() => shift = val),
              ),
              const SizedBox(height: 16),
              _buildTextField(label: "Shift Group", controller: shiftGroupController),
              const SizedBox(height: 16),
              _buildTextField(
                label: "Session Time",
                controller: sessionController,
                inputType: TextInputType.datetime,
              ),
              const SizedBox(height: 16),
              _buildTextField(label: "Reason", controller: reasonController),
              const SizedBox(height: 16),
              _buildDateField(),
              const SizedBox(height: 16),
              _buildUploadSection(),
              ElevatedButton(
                onPressed: _handleSubmit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: kButtonColor,
                  foregroundColor: kTextColor,
                  minimumSize: const Size.fromHeight(50),
                ),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}