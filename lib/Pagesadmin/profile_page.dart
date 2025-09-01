



// // lib/pages/company_profile_page.dart

// import 'dart:io' show File;
// import 'package:flutter/foundation.dart' show kIsWeb;
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:serv_app/models/company_data.dart';  // your shared model
// import 'company_details_page.dart';                  // for the edit form

// // Theme colors
// const Color kPrimaryBackgroundTop    = Color(0xFFFFFFFF);
// const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
// const Color kAppBarColor             = Color(0xFF8C6EAF);
// const Color kButtonColor             = Color(0xFF655193);
// const Color kTextColor               = Colors.white;

// class CompanyProfilePage extends StatefulWidget {
//   const CompanyProfilePage({Key? key}) : super(key: key);

//   @override
//   _CompanyProfilePageState createState() => _CompanyProfilePageState();
// }

// class _CompanyProfilePageState extends State<CompanyProfilePage> {
//   bool _isEditing = false;

//   late TextEditingController _nameCtrl;
//   late TextEditingController _emailCtrl;
//   late TextEditingController _phoneCtrl;
//   late TextEditingController _websiteCtrl;
//   late TextEditingController _adminNameCtrl;
//   late TextEditingController _adminRoleCtrl;

//   XFile? _logoFile;
//   final ImagePicker _picker = ImagePicker();

//   @override
//   void initState() {
//     super.initState();
//     // load from CompanyData
//     _logoFile      = CompanyData.logoFile;
//     _nameCtrl      = TextEditingController(text: CompanyData.companyName);
//     _emailCtrl     = TextEditingController(text: CompanyData.email);
//     _phoneCtrl     = TextEditingController(text: CompanyData.phone);
//     _websiteCtrl   = TextEditingController(text: CompanyData.website);
//     _adminNameCtrl = TextEditingController(text: CompanyData.adminName);
//     _adminRoleCtrl = TextEditingController(text: CompanyData.adminRole);
//   }

//   @override
//   void dispose() {
//     _nameCtrl.dispose();
//     _emailCtrl.dispose();
//     _phoneCtrl.dispose();
//     _websiteCtrl.dispose();
//     _adminNameCtrl.dispose();
//     _adminRoleCtrl.dispose();
//     super.dispose();
//   }

//   Future<void> _pickLogo() async {
//     final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
//     if (picked != null) {
//       setState(() {
//         _logoFile = picked;
//       });
//     }
//   }

//   void _toggleEdit() {
//     if (_isEditing) {
//       // save back into CompanyData
//       CompanyData.logoFile      = _logoFile;
//       CompanyData.companyName   = _nameCtrl.text.trim();
//       CompanyData.email         = _emailCtrl.text.trim();
//       CompanyData.phone         = _phoneCtrl.text.trim();
//       CompanyData.website       = _websiteCtrl.text.trim();
//       CompanyData.adminName     = _adminNameCtrl.text.trim();
//       CompanyData.adminRole     = _adminRoleCtrl.text.trim();
//     }
//     setState(() => _isEditing = !_isEditing);
//   }

//   @override
//   Widget build(BuildContext context) {
//     final bool isWide = MediaQuery.of(context).size.width > 600;
//     final double spacing = isWide ? 24.0 : 16.0;

//     ImageProvider? avatar;
//     if (_logoFile != null) {
//       avatar = kIsWeb
//           ? NetworkImage(_logoFile!.path)
//           : FileImage(File(_logoFile!.path));
//     }

//     return Scaffold(
//       backgroundColor: kPrimaryBackgroundTop,
//       appBar: AppBar(
//         backgroundColor: kAppBarColor,
//         title: const Text('Company Profile', style: TextStyle(color: kTextColor)),
//         iconTheme: const IconThemeData(color: kTextColor),
//         actions: [
//           IconButton(
//             icon: Icon(_isEditing ? Icons.check : Icons.edit, color: kTextColor),
//             onPressed: _toggleEdit,
//             tooltip: _isEditing ? 'Save' : 'Edit',
//           ),
//         ],
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(spacing),
//         child: Center(
//           child: Container(
//             width: isWide ? 600 : double.infinity,
//             padding: EdgeInsets.all(spacing),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
//                 begin: Alignment.topCenter,
//                 end: Alignment.bottomCenter,
//               ),
//               borderRadius: BorderRadius.circular(12),
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 // Avatar + camera button in edit mode
//                 if (_isEditing)
//                   Center(
//                     child: Stack(
//                       alignment: Alignment.bottomRight,
//                       children: [
//                         CircleAvatar(
//                           radius: 48,
//                           backgroundImage: avatar,
//                           backgroundColor: Colors.grey[200],
//                         ),
//                         Positioned(
//                           child: InkWell(
//                             onTap: _pickLogo,
//                             child: CircleAvatar(
//                               radius: 16,
//                               backgroundColor: kButtonColor,
//                               child: const Icon(Icons.camera_alt, size: 16, color: kTextColor),
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 else if (avatar != null)
//                   Center(
//                     child: CircleAvatar(
//                       radius: 48,
//                       backgroundImage: avatar,
//                     ),
//                   ),
//                 SizedBox(height: spacing),

//                 // Fields
//                 if (_isEditing) ...[
//                   _buildEditField('Company Name', _nameCtrl),
//                   SizedBox(height: spacing),
//                   _buildEditField('Official Email', _emailCtrl, keyboard: TextInputType.emailAddress),
//                   SizedBox(height: spacing),
//                   _buildEditField('Phone Number', _phoneCtrl, keyboard: TextInputType.phone),
//                   SizedBox(height: spacing),
//                   _buildEditField('Website', _websiteCtrl, keyboard: TextInputType.url),
//                   SizedBox(height: spacing),
//                   _buildEditField('Admin Full Name', _adminNameCtrl),
//                   SizedBox(height: spacing),
//                   _buildEditField('Admin Designation', _adminRoleCtrl),
//                 ] else ...[
//                   _buildDisplayField('Company Name',   CompanyData.companyName,  isWide),
//                   SizedBox(height: spacing),
//                   _buildDisplayField('Official Email', CompanyData.email,        isWide),
//                   SizedBox(height: spacing),
//                   _buildDisplayField('Phone Number',   CompanyData.phone,        isWide),
//                   SizedBox(height: spacing),
//                   _buildDisplayField('Website',        CompanyData.website.isNotEmpty ? CompanyData.website : '—', isWide),
//                   SizedBox(height: spacing),
//                   _buildDisplayField('Admin Full Name',CompanyData.adminName,    isWide),
//                   SizedBox(height: spacing),
//                   _buildDisplayField('Admin Designation',CompanyData.adminRole, isWide),
//                 ],
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildDisplayField(String label, String value, bool isWide) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isWide ? 16 : 14)),
//         const SizedBox(height: 4),
//         Text(value, style: TextStyle(fontSize: isWide ? 18 : 16)),
//       ],
//     );
//   }

//   Widget _buildEditField(String label, TextEditingController ctrl,
//       {TextInputType keyboard = TextInputType.text}) {
//     return TextFormField(
//       controller: ctrl,
//       keyboardType: keyboard,
//       decoration: InputDecoration(
//         labelText: label,
//         border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
//       ),
//     );
//   }
// }



import 'dart:convert';
import 'dart:io' show File;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:serv_app/models/company_data.dart';

class CompanyProfilePage extends StatefulWidget {
  const CompanyProfilePage({super.key});

  @override
  _CompanyProfilePageState createState() => _CompanyProfilePageState();
}

class _CompanyProfilePageState extends State<CompanyProfilePage> {
  bool _isEditing = false;

  late TextEditingController _nameCtrl;
  late TextEditingController _emailCtrl;
  late TextEditingController _phoneCtrl;
  late TextEditingController _websiteCtrl;
  late TextEditingController _adminNameCtrl;
  late TextEditingController _adminRoleCtrl;

  XFile? _logoFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _logoFile      = CompanyData.logoFile;
    _nameCtrl      = TextEditingController(text: CompanyData.companyName);
    _emailCtrl     = TextEditingController(text: CompanyData.email);
    _phoneCtrl     = TextEditingController(text: CompanyData.phone);
    _websiteCtrl   = TextEditingController(text: CompanyData.website);
    _adminNameCtrl = TextEditingController(text: CompanyData.adminName);
    _adminRoleCtrl = TextEditingController(text: CompanyData.adminRole);
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _websiteCtrl.dispose();
    _adminNameCtrl.dispose();
    _adminRoleCtrl.dispose();
    super.dispose();
  }

  Future<void> _pickLogo() async {
    final XFile? picked = await _picker.pickImage(source: ImageSource.gallery);
    if (picked != null) {
      setState(() {
        _logoFile = picked;
      });
    }
  }

  Future<void> uploadCompanyProfile() async {
    try {
      String? base64Image;
      if (_logoFile != null) {
        final bytes = await _logoFile!.readAsBytes();
        base64Image = base64Encode(bytes);
      }

      final body = {
        "companyName": _nameCtrl.text.trim(),
        "email": _emailCtrl.text.trim(),
        "phone": _phoneCtrl.text.trim(),
        "website": _websiteCtrl.text.trim(),
        "adminName": _adminNameCtrl.text.trim(),
        "adminRole": _adminRoleCtrl.text.trim(),
        if (base64Image != null) "logoBase64": base64Image,
      };

      final response = await http.post(
        Uri.parse('http://localhost:3000/api/company-profile'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(body),
      );

      if (response.statusCode == 200) {
        print("✅ Upload success: ${response.body}");
      } else {
        print("❌ Upload failed: ${response.statusCode} ${response.body}");
      }
    } catch (e) {
      print("⚠️ Error uploading: $e");
    }
  }

  void _toggleEdit() async {
    if (_isEditing) {
      await uploadCompanyProfile(); // send to backend
      CompanyData.logoFile    = _logoFile;
      CompanyData.companyName = _nameCtrl.text.trim();
      CompanyData.email       = _emailCtrl.text.trim();
      CompanyData.phone       = _phoneCtrl.text.trim();
      CompanyData.website     = _websiteCtrl.text.trim();
      CompanyData.adminName   = _adminNameCtrl.text.trim();
      CompanyData.adminRole   = _adminRoleCtrl.text.trim();
    }
    setState(() => _isEditing = !_isEditing);
  }

  @override
  Widget build(BuildContext context) {
    final bool isWide = MediaQuery.of(context).size.width > 600;
    final double spacing = isWide ? 24.0 : 16.0;

    ImageProvider<Object>? avatar;
    if (_logoFile != null) {
      avatar = (kIsWeb
          ? NetworkImage(_logoFile!.path)                 // web
          : FileImage(File(_logoFile!.path))) as ImageProvider<Object>?;             // mobile
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF8C6EAF),
        title: const Text('Company Profile', style: TextStyle(color: Colors.white)),
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          IconButton(
            icon: Icon(_isEditing ? Icons.check : Icons.edit, color: Colors.white),
            onPressed: _toggleEdit,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(spacing),
        child: Center(
          child: Container(
            width: isWide ? 600 : double.infinity,
            padding: EdgeInsets.all(spacing),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.white, Color(0xFFD1C4E9)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                if (_isEditing)
                  Center(
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          radius: 48,
                          backgroundImage: avatar,
                          backgroundColor: Colors.grey[200],
                        ),
                        Positioned(
                          child: InkWell(
                            onTap: _pickLogo,
                            child: CircleAvatar(
                              radius: 16,
                              backgroundColor: const Color(0xFF655193),
                              child: const Icon(Icons.camera_alt, size: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else if (avatar != null)
                  Center(child: CircleAvatar(radius: 48, backgroundImage: avatar)),
                SizedBox(height: spacing),
                if (_isEditing) ...[
                  _buildEditField('Company Name', _nameCtrl),
                  SizedBox(height: spacing),
                  _buildEditField('Official Email', _emailCtrl),
                  SizedBox(height: spacing),
                  _buildEditField('Phone Number', _phoneCtrl),
                  SizedBox(height: spacing),
                  _buildEditField('Website', _websiteCtrl),
                  SizedBox(height: spacing),
                  _buildEditField('Admin Full Name', _adminNameCtrl),
                  SizedBox(height: spacing),
                  _buildEditField('Admin Designation', _adminRoleCtrl),
                ] else ...[
                  _buildDisplayField('Company Name', CompanyData.companyName, isWide),
                  SizedBox(height: spacing),
                  _buildDisplayField('Official Email', CompanyData.email, isWide),
                  SizedBox(height: spacing),
                  _buildDisplayField('Phone Number', CompanyData.phone, isWide),
                  SizedBox(height: spacing),
                  _buildDisplayField('Website', CompanyData.website, isWide),
                  SizedBox(height: spacing),
                  _buildDisplayField('Admin Full Name', CompanyData.adminName, isWide),
                  SizedBox(height: spacing),
                  _buildDisplayField('Admin Designation', CompanyData.adminRole, isWide),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildDisplayField(String label, String value, bool isWide) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.bold, fontSize: isWide ? 16 : 14)),
        const SizedBox(height: 4),
        Text(value, style: TextStyle(fontSize: isWide ? 18 : 16)),
      ],
    );
  }

  Widget _buildEditField(String label, TextEditingController ctrl) {
    return TextFormField(
      controller: ctrl,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
      ),
    );
  }
}
