// import 'package:flutter/material.dart';

// class TermsAndConditionsPage extends StatelessWidget {
//   const TermsAndConditionsPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
          
//           'Terms & Conditions',
//           style: TextStyle(fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: const Padding(
//         padding: EdgeInsets.all(16.0),
//         child: SingleChildScrollView(
//           child: Text(
//             '''
// By using this Attendance Management App, you agree to the following Terms and Conditions:

// 1. **Usage Agreement**
// You must use the app only for official attendance and tracking purposes.

// 2. **Account Responsibility**
// You are responsible for maintaining the confidentiality of your login credentials.

// 3. **Data Accuracy**
// You must ensure the accuracy of the information you provide during check-in or check-out.

// 4. **Prohibited Activities**
// Any misuse of the app, including false attendance marking or tampering with location data, is strictly prohibited.

// 5. **Termination**
// We reserve the right to suspend access to users who violate these terms.

// 6. **Modifications**
// These terms may be updated from time to time. Continued use of the app implies acceptance of any changes.

// 7. **Limitation of Liability**
// We are not liable for any indirect or incidental damages caused due to usage of this app.

// Please review these terms carefully. If you do not agree, please refrain from using the app.

// Thank you for your cooperation.
//             ''',
//             style: TextStyle(fontSize: 16, height: 1.5),
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

// Theme Colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);

class TermsAndConditionsPage extends StatelessWidget {
  const TermsAndConditionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Terms & Conditions',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: kAppBarColor,
        centerTitle: true,
      ),
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
        child: const Padding(
          padding: EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Text(
              '''
Welcome to Serv!!Please read these Terms and Conditions carefully before using our Attendance and Payroll App. By accessing or using the app, you agree to be bound by these Terms.



1. Acceptance of Terms

By registering, accessing, or using [App Name], you confirm that you are legally competent and authorized to enter into this agreement on behalf of yourself or your organization.


---

2. User Responsibilities

You agree to use the app only for lawful purposes.

You are responsible for maintaining the confidentiality of your login credentials.

Users must ensure accuracy in reporting attendance and personal information.



---

3. Attendance Tracking

The app collects employee attendance data through methods such as geolocation, QR scan, or biometric input (depending on your plan).

Employees must mark attendance within designated hours and at authorized locations.

Any fraudulent or false check-in attempts may lead to disciplinary action.



---

4. Payroll Management

Payroll is generated based on attendance records, leaves, overtime, and organizational rules.

The app calculates salaries, deductions, and bonuses as per the company's policy.

The company is responsible for reviewing and approving final payroll details before disbursing salaries.



---

5. Data Privacy and Security

We collect and store personal and organizational data to provide our services.

All user data is encrypted and handled according to our [Privacy Policy].

We do not share your information with third parties without consent, unless required by law.



---

6. Modifications and Updates

We reserve the right to update or modify these Terms at any time. Continued use of the app after such changes constitutes your agreement to the new Terms.


---

7. Termination

We may suspend or terminate your account if you violate these Terms.

Upon termination, all rights granted to you will cease immediately.


8. Limitation of Liability

We are not liable for:

Any loss of data caused by user error or technical issues.

Payroll miscalculations resulting from incorrect attendance inputs.

Any indirect, incidental, or consequential damages arising from your use of the app

9. Governing Law

These Terms shall be governed by and interpreted in accordance with the laws of India/TamilNadu


10. Contact Us

For questions or support, contact us at:
📧 Info@serv.co.in
📞9042525258
              ''',
              style: TextStyle(fontSize: 16, height: 1.5),
            ),
          ),
        ),
      ),
    );
  }
}
