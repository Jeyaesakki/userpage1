// // lib/pages/company_details_page.dart

// import 'dart:io';

// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:image_picker/image_picker.dart';
// // import 'package:flutter_application_1/pages/company_profile_page.dart';
// import 'package:serv_app/Pagesadmin/profile_page.dart';

// // Theme colors
// const Color kPrimaryBackgroundTop    = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor             = Color(0xFF8C6EAF);
// const Color kButtonColor             = Color(0xFF655193);
// const Color kTextColor               = Colors.white;

// class CompanyDetailsFormPage extends StatefulWidget {
//   const CompanyDetailsFormPage({Key? key}) : super(key: key);

//   @override
//   _CompanyDetailsFormPageState createState() => _CompanyDetailsFormPageState();
// }

// class _CompanyDetailsFormPageState extends State<CompanyDetailsFormPage> {
//   final _formKey               = GlobalKey<FormState>();
//   final _companyNameController = TextEditingController();
//   final _emailController       = TextEditingController();
//   final _phoneController       = TextEditingController();
//   final _websiteController     = TextEditingController();
//   final _adminNameController   = TextEditingController();
//   final _adminRoleController   = TextEditingController();

//   XFile? _logoFile;
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void dispose() {
//     _companyNameController.dispose();
//     _emailController.dispose();
//     _phoneController.dispose();
//     _websiteController.dispose();
//     _adminNameController.dispose();
//     _adminRoleController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickLogo() async {
//     final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() => _logoFile = picked);
//     }
//   }

//   String? _validateRequired(String? v) => v == null || v.trim().isEmpty ? 'Required' : null;
//   String? _validateEmail(String? v) {
//     if (v == null || v.trim().isEmpty) return 'Required';
//     final pattern = r'^[A-Za-z0-9]+([._-]?[A-Za-z0-9]+)*@[A-Za-z0-9-]+(\.[A-Za-z]{2,})+$';
//     return RegExp(pattern).hasMatch(v.trim()) ? null : 'Enter a valid email';
//   }
//   String? _validatePhone(String? v) {
//     if (v == null || v.trim().isEmpty) return 'Required';
//     return v.trim().length == 10 ? null : 'Must be 10 digits';
//   }
//   String? _validateUrl(String? v) {
//     if (v == null || v.trim().isEmpty) return null;
//     final uri = Uri.tryParse(v.trim());
//     return (uri != null && (uri.hasScheme && (uri.scheme=='http'||uri.scheme=='https')))
//         ? null : 'Enter a valid URL';
//   }

//   void _submit() {
//     if (_formKey.currentState?.validate() ?? false) {
//       Navigator.push(
//         context,
//         MaterialPageRoute(
//           builder: (_) => CompanyProfilePage(
//             companyName: _companyNameController.text.trim(),
//             email:       _emailController.text.trim(),
//             phone:       _phoneController.text.trim(),
//             website:     _websiteController.text.trim(),
//             adminName:   _adminNameController.text.trim(),
//             adminRole:   _adminRoleController.text.trim(),
//             logoFile:    _logoFile, altEmail: '',
//           ),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     final isWide  = MediaQuery.of(context).size.width > 600;
//     final spacing = isWide ? 24.0 : 16.0;

//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundTop,
//       appBar: AppBar(
//         backgroundColor: kAppBarColor,
//         title: const Text('Company Details', style: TextStyle(color: kTextColor)),
//       ),
//       body: Container(
//         decoration: const BoxDecoration(
//           gradient: LinearGradient(
//             colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//             begin: Alignment.topCenter,
//             end: Alignment.bottomCenter,
//           ),
//         ),
//         child: SafeArea(
//           child: SingleChildScrollView(
//             padding: EdgeInsets.all(spacing),
//             child: Form(
//               key: _formKey,
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   if (_logoFile != null) ...[
//                     Center(
//                       child: CircleAvatar(
//                         radius: 48,
//                         backgroundImage: kIsWeb
//                             ? NetworkImage(_logoFile!.path)
//                             : FileImage(File(_logoFile!.path)) as ImageProvider,
//                       ),
//                     ),
//                     const SizedBox(height: 12),
//                   ],
//                   Center(
//                     child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: kButtonColor,
//                         foregroundColor: kTextColor,
//                       ),
//                       onPressed: _pickLogo,
//                       child: const Text('Upload Logo'),
//                     ),
//                   ),
//                   SizedBox(height: spacing),

//                   TextFormField(
//                     controller: _companyNameController,
//                     decoration: const InputDecoration(labelText: 'Company Name'),
//                     validator: _validateRequired,
//                   ),
//                   SizedBox(height: spacing),

//                   TextFormField(
//                     controller: _emailController,
//                     decoration: const InputDecoration(labelText: 'Official Email Address'),
//                     keyboardType: TextInputType.emailAddress,
//                     validator: _validateEmail,
//                   ),
//                   SizedBox(height: spacing),

//                   TextFormField(
//                     controller: _phoneController,
//                     decoration: const InputDecoration(labelText: 'Phone Number'),
//                     keyboardType: TextInputType.phone,
//                     inputFormatters: [
//                       FilteringTextInputFormatter.digitsOnly,
//                       LengthLimitingTextInputFormatter(10),
//                     ],
//                     validator: _validatePhone,
//                   ),
//                   SizedBox(height: spacing),

//                   TextFormField(
//                     controller: _websiteController,
//                     decoration: const InputDecoration(labelText: 'Official Website (optional)'),
//                     keyboardType: TextInputType.url,
//                     validator: _validateUrl,
//                   ),
//                   SizedBox(height: spacing),

//                   TextFormField(
//                     controller: _adminNameController,
//                     decoration: const InputDecoration(labelText: 'Admin Full Name'),
//                     validator: _validateRequired,
//                   ),
//                   SizedBox(height: spacing),

//                   TextFormField(
//                     controller: _adminRoleController,
//                     decoration: const InputDecoration(labelText: 'Admin Designation'),
//                     validator: _validateRequired,
//                   ),
//                   SizedBox(height: spacing * 1.5),

//                   ElevatedButton(
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: kButtonColor,
//                       foregroundColor: kTextColor,
//                       padding: EdgeInsets.symmetric(vertical: spacing),
//                     ),
//                     onPressed: _submit,
//                     child: const Text('Submit'),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



// lib/pages/company_details_page.dart

import 'dart:io';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:serv_app/Pagesadmin/profile_page.dart' show CompanyProfilePage;
import 'package:serv_app/models/company_data.dart';

import 'package:serv_app/Pagesadmin/company_setup_page.dart';

// Theme colors
const Color kPrimaryBackgroundTop    = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor             = Color(0xFF8C6EAF);
const Color kButtonColor             = Color(0xFF655193);
const Color kTextColor               = Colors.white;

class CompanyDetailsFormPage extends StatefulWidget {
  const CompanyDetailsFormPage({Key? key}) : super(key: key);

  @override
  _CompanyDetailsFormPageState createState() => _CompanyDetailsFormPageState();
}

class _CompanyDetailsFormPageState extends State<CompanyDetailsFormPage> {
  final _formKey               = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _emailController       = TextEditingController();
  final _phoneController       = TextEditingController();
  final _websiteController     = TextEditingController();
  final _adminNameController   = TextEditingController();
  final _adminRoleController   = TextEditingController();

  XFile? _logoFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void dispose() {
    _companyNameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _websiteController.dispose();
    _adminNameController.dispose();
    _adminRoleController.dispose();
    super.dispose();
  }

  Future<void> _pickLogo() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) setState(() => _logoFile = picked);
  }

  String? _validateRequired(String? v) => v == null || v.trim().isEmpty ? 'Required' : null;
  String? _validateEmail(String? v) {
    if (v == null || v.trim().isEmpty) return 'Required';
    final pattern = r'^[A-Za-z0-9]+([._-]?[A-Za-z0-9]+)*@[A-Za-z0-9-]+(\.[A-Za-z]{2,})+$';
    return RegExp(pattern).hasMatch(v.trim()) ? null : 'Enter a valid email';
  }
  String? _validatePhone(String? v) {
    if (v == null || v.trim().isEmpty) return 'Required';
    return v.trim().length == 10 ? null : 'Must be 10 digits';
  }
  String? _validateUrl(String? v) {
    if (v == null || v.trim().isEmpty) return null;
    final uri = Uri.tryParse(v.trim());
    return (uri != null && uri.hasScheme && (uri.scheme == 'http' || uri.scheme == 'https'))
        ? null : 'Enter a valid URL';
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      // Save into global model
      CompanyData.companyName = _companyNameController.text.trim();
      CompanyData.email       = _emailController.text.trim();
      CompanyData.phone       = _phoneController.text.trim();
      CompanyData.website     = _websiteController.text.trim();
      CompanyData.adminName   = _adminNameController.text.trim();
      CompanyData.adminRole   = _adminRoleController.text.trim();
      CompanyData.logoFile    = _logoFile;

      // Navigate to profile first
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CompanyProfilePage()),
      );
      // Then navigate to setup
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const CompanySetupPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool isWide  = MediaQuery.of(context).size.width > 600;
    final double spacing = isWide ? 24.0 : 16.0;

    return Scaffold(
      backgroundColor: kPrimaryBackgroundTop,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        title: const Text('Company Details', style: TextStyle(color: kTextColor)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(spacing),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  if (_logoFile != null) ...[
                    Center(
                      child: CircleAvatar(
                        radius: 48,
                        backgroundImage: kIsWeb
                            ? NetworkImage(_logoFile!.path)
                            : FileImage(File(_logoFile!.path)) as ImageProvider,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor,
                        foregroundColor: kTextColor,
                      ),
                      onPressed: _pickLogo,
                      child: const Text('Upload Logo'),
                    ),
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: _companyNameController,
                    decoration: const InputDecoration(labelText: 'Company Name'),
                    validator: _validateRequired,
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(labelText: 'Official Email Address'),
                    keyboardType: TextInputType.emailAddress,
                    validator: _validateEmail,
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: _phoneController,
                    decoration: const InputDecoration(labelText: 'Phone Number'),
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                    validator: _validatePhone,
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: _websiteController,
                    decoration: const InputDecoration(labelText: 'Official Website (optional)'),
                    keyboardType: TextInputType.url,
                    validator: _validateUrl,
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: _adminNameController,
                    decoration: const InputDecoration(labelText: 'Admin Full Name'),
                    validator: _validateRequired,
                  ),
                  SizedBox(height: spacing),
                  TextFormField(
                    controller: _adminRoleController,
                    decoration: const InputDecoration(labelText: 'Admin Designation'),
                    validator: _validateRequired,
                  ),
                  SizedBox(height: spacing * 1.5),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kButtonColor,
                      foregroundColor: kTextColor,
                      padding: EdgeInsets.symmetric(vertical: spacing),
                    ),
                    onPressed: _submit,
                    child: const Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}