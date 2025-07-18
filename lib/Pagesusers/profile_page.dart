// import 'package:flutter/material.dart';
// import 'change_password_page.dart';
// import 'multi_language_page.dart';
// import 'privacy_policy_page.dart';
// import 'terms_and_conditions_page.dart';
// import 'feedback_page.dart';
// import 'permissions_page.dart';
// import 'log_out_page.dart';

// class ProfilePage extends StatelessWidget {
//   const ProfilePage({super.key, required Map userData});

//   // Dummy user data added inside the widget
//   final Map<String, String> userData = const {
//     "name": "Divya D V",
//     "id": "AI2025",
//     "role": "Student",
//     "email": "divya.ai@gmail.com",
//     "phone": "9876543210",
//   };

//   final List<Map<String, dynamic>> settings = const [
//     {"icon": Icons.lock, "label": "Change Password"},
//     {"icon": Icons.language, "label": "Multi Language"},
//     {"icon": Icons.privacy_tip, "label": "Privacy Policy"},
//     {"icon": Icons.article, "label": "Terms & Conditions"},
//     {"icon": Icons.settings, "label": "Permissions"},
//     {"icon": Icons.feedback, "label": "Feedback"},
//     {"icon": Icons.logout, "label": "Log Out", "color": Colors.red},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Column(
//           children: [
//             // 🔙 Back Button
//             Align(
//               alignment: Alignment.topLeft,
//               child: IconButton(
//                 icon: const Icon(Icons.arrow_back),
//                 onPressed: () => Navigator.pop(context),
//               ),
//             ),

//             // 🧑‍🎓 Profile Header
//             Container(
//               color: Colors.cyanAccent[100],
//               padding: const EdgeInsets.all(20),
//               child: Row(
//                 children: [
//                   CircleAvatar(
//                     radius: 30,
//                     backgroundColor: Colors.pink[100],
//                     child: Text(
//                       userData['name']?.isNotEmpty == true
//                           ? userData['name']![0]
//                           : '?',
//                       style: const TextStyle(
//                         fontSize: 24,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   const SizedBox(width: 16),
//                   Expanded(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(userData['name'] ?? 'Name',
//                             style: const TextStyle(
//                                 fontSize: 18, fontWeight: FontWeight.bold)),
//                         Text(
//                           '${userData['id'] ?? '-'} | ${userData['role'] ?? '-'}',
//                           style: const TextStyle(fontSize: 14),
//                         ),
//                         Text(userData['email'] ?? 'No email',
//                             style: const TextStyle(fontSize: 14)),
//                         Text(userData['phone'] ?? 'No phone',
//                             style: const TextStyle(fontSize: 14)),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),

//             const Divider(height: 1),

//             // ⚙️ Settings List
//             Expanded(
//               child: ListView.builder(
//                 itemCount: settings.length,
//                 itemBuilder: (context, index) {
//                   final item = settings[index];
//                   final String label = item['label'];
//                   return Padding(
//                     padding:
//                         const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                     child: Container(
//                       padding: const EdgeInsets.symmetric(
//                           horizontal: 12, vertical: 12),
//                       decoration: BoxDecoration(
//                         color: Colors.grey[100],
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.05),
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           )
//                         ],
//                       ),
//                       child: ListTile(
//                         contentPadding: EdgeInsets.zero,
//                         leading: Icon(item['icon'],
//                             color: item['color'] ?? Colors.black),
//                         title: Text(
//                           label,
//                           style: TextStyle(
//                             color: item['color'] ?? Colors.black,
//                             fontWeight: label == "Log Out"
//                                 ? FontWeight.bold
//                                 : FontWeight.normal,
//                           ),
//                         ),
//                         trailing:
//                             const Icon(Icons.arrow_forward_ios, size: 14),
//                         onTap: () {
//                           if (label == "Change Password") {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const ChangePasswordPage()),
//                             );
//                           } else if (label == "Multi Language") {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const MultiLanguagePage()),
//                             );
//                           } else if (label == "Privacy Policy") {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const PrivacyPolicyPage()),
//                             );
//                           } else if (label == "Terms & Conditions") {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const TermsAndConditionsPage()),
//                             );
//                           } else if (label == "Permissions") {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) =>
//                                       const PermissionsPage()),
//                             );
//                           } else if (label == "Feedback") {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const FeedbackPage()),
//                             );
//                           } else if (label == "Log Out") {
//                             Navigator.push(
//                               context,
//                               MaterialPageRoute(
//                                   builder: (context) => const LogOutPage()),
//                             );
//                           } else {
//                             ScaffoldMessenger.of(context).showSnackBar(
//                               SnackBar(content: Text('$label tapped')),
//                             );
//                           }
//                         },
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// lib/profile_page.dart
import 'package:flutter/material.dart';
import 'change_password_page.dart';
import 'multi_language_page.dart';
import 'privacy_policy_page.dart';
import 'terms_and_conditions_page.dart';
import 'feedback_page.dart';
import 'permissions_page.dart';
import 'log_out_page.dart';
 // ✅ Import color constants




// Theme Colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key, required Map userData});

  final Map<String, String> userData = const {
    "name": "Divya D V",
    "id": "AI2025",
    "role": "Student",
    "email": "divya.ai@gmail.com",
    "phone": "9876543210",
  };

  final List<Map<String, dynamic>> settings = const [
    {"icon": Icons.lock, "label": "Change Password"},
    {"icon": Icons.language, "label": "Multi Language"},
    {"icon": Icons.privacy_tip, "label": "Privacy Policy"},
    {"icon": Icons.article, "label": "Terms & Conditions"},
    {"icon": Icons.settings, "label": "Permissions"},
    {"icon": Icons.feedback, "label": "Feedback"},
    {"icon": Icons.logout, "label": "Log Out", "color": Colors.red},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // 🔙 Back Button
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: () => Navigator.pop(context),
                ),
              ),

              // 🧑‍🎓 Profile Header
              Container(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: kButtonColor,
                      child: Text(
                        userData['name']?.isNotEmpty == true
                            ? userData['name']![0]
                            : '?',
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: kTextColor,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(userData['name'] ?? 'Name',
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold)),
                          Text(
                            '${userData['id'] ?? '-'} | ${userData['role'] ?? '-'}',
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(userData['email'] ?? 'No email',
                              style: const TextStyle(fontSize: 14)),
                          Text(userData['phone'] ?? 'No phone',
                              style: const TextStyle(fontSize: 14)),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // ⚙ Settings List
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.only(bottom: 16),
                  itemCount: settings.length,
                  itemBuilder: (context, index) {
                    final item = settings[index];
                    final String label = item['label'];
                    return Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: kPrimaryBackgroundTop.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.05),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            )
                          ],
                        ),
                        child: ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: Icon(item['icon'],
                              color: item['color'] ?? kAppBarColor),
                          title: Text(
                            label,
                            style: TextStyle(
                              color: item['color'] ?? kAppBarColor,
                              fontWeight: label == "Log Out"
                                  ? FontWeight.bold
                                  : FontWeight.normal,
                            ),
                          ),
                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 14),
                          onTap: () {
                            if (label == "Change Password") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChangePasswordPage()),
                              );
                            } else if (label == "Multi Language") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MultiLanguagePage()),
                              );
                            } else if (label == "Privacy Policy") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PrivacyPolicyPage()),
                              );
                            } else if (label == "Terms & Conditions") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const TermsAndConditionsPage()),
                              );
                            } else if (label == "Permissions") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const PermissionsPage()),
                              );
                            } else if (label == "Feedback") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const FeedbackPage()),
                              );
                            } else if (label == "Log Out") {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogOutPage()),
                              );
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('$label tapped')),
                              );
                            }
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
