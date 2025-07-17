// import 'package:flutter/material.dart';



// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Company Profile App',
//       theme: ThemeData(
//         primarySwatch: Colors.teal,
//       ),
//       home: CompanyDetailsPage(), // Directly opens the Company Profile page
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class CompanyDetailsPage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 185, 123, 221),
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         elevation: 1,
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.blue),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Text(
//           'Profile',
//           style: TextStyle(color: Colors.grey[600], fontSize: 16),
//         ),
//       ),
//       body: LayoutBuilder(
//         builder: (context, constraints) {
//           double maxWidth = constraints.maxWidth > 800 ? 800 : constraints.maxWidth;
//           bool isWeb = constraints.maxWidth > 600;

//           return Center(
//             child: Container(
//               width: maxWidth,
//               child: SingleChildScrollView(
//                 padding: EdgeInsets.symmetric(horizontal: isWeb ? 40 : 20, vertical: 20),
//                 child: Column(
//                   children: [
//                     Column(
//                       children: [
//                         ClipRRect(
//                           borderRadius: BorderRadius.circular(60),
//                           child: Image.asset(
//                             'assets/images/companylogo.png.jpeg', // Make sure this asset exists
//                             width: 80,
//                             height: 80,
//                             fit: BoxFit.cover,
//                           ),
//                         ),
//                         SizedBox(height: 15),
//                         Text(
//                           'Company Details',
//                           style: TextStyle(
//                             fontSize: isWeb ? 28 : 24,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.grey[800],
//                           ),
//                         ),
//                       ],
//                     ),
//                     SizedBox(height: 30),
//                     Container(
//                       width: double.infinity,
//                       padding: EdgeInsets.all(isWeb ? 30 : 20),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.1),
//                             spreadRadius: 2,
//                             blurRadius: 8,
//                             offset: Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _buildDetailField('Company Name', 'Myth Reality Tech Pvt Ltd', isWeb),
//                           SizedBox(height: 20),
//                           _buildDetailField('Mobile Number', '9042545259', isWeb),
//                           SizedBox(height: 20),
//                           _buildIndustryTypeField(isWeb),
//                           SizedBox(height: 20),
//                           _buildDetailField('Company Website', '—', isWeb),
//                           SizedBox(height: 20),
//                           _buildDetailField('Alternative Email', '—', isWeb),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 30),
//                   ],
//                 ),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }

//   Widget _buildDetailField(String label, String value, bool isWeb) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           label,
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: isWeb ? 16 : 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 6),
//         Text(
//           value,
//           style: TextStyle(
//             color: Colors.grey[600],
//             fontSize: isWeb ? 18 : 16,
//             fontWeight: FontWeight.normal,
//           ),
//         ),
//       ],
//     );
//   }

//   Widget _buildIndustryTypeField(bool isWeb) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           'Industry Type',
//           style: TextStyle(
//             color: Colors.black,
//             fontSize: isWeb ? 16 : 14,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//         SizedBox(height: 10),
//         Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             _buildIndustryType('IT', isWeb),
//             SizedBox(height: 8),
//             _buildIndustryType('Healthcare', isWeb),
//             SizedBox(height: 8),
//             _buildIndustryType('Organization', isWeb),
//             SizedBox(height: 8),
//             _buildIndustryType('Production', isWeb),
//           ],
//         ),
//       ],
//     );
//   }

//   Widget _buildIndustryType(String type, bool isWeb) {
//     return Row(
//       children: [
//         Container(
//           width: isWeb ? 8 : 6,
//           height: isWeb ? 8 : 6,
//           decoration: BoxDecoration(
//             color: Colors.blue,
//             shape: BoxShape.circle,
//           ),
//         ),
//         SizedBox(width: 10),
//         Flexible(
//           child: Text(
//             type,
//             style: TextStyle(
//               color: Colors.grey[600],
//               fontSize: isWeb ? 16 : 14,
//             ),
//             overflow: TextOverflow.ellipsis,
//           ),
//         ),
//       ],
//     );
//   }
// }


import 'package:flutter/material.dart';

// Your provided theme color constants
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Company Profile App',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: CompanyDetailsPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class CompanyDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: kAppBarColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: kTextColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Profile',
          style: TextStyle(color: kTextColor, fontSize: 16),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double maxWidth = constraints.maxWidth > 800 ? 800 : constraints.maxWidth;
            bool isWeb = constraints.maxWidth > 600;

            return Center(
              child: Container(
                width: maxWidth,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: isWeb ? 40 : 20, vertical: 20),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(60),
                            child: Image.asset(
                              'assets/images/companylogo.png.jpeg',
                              width: 80,
                              height: 80,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 15),
                          Text(
                            'Company Details',
                            style: TextStyle(
                              fontSize: isWeb ? 28 : 24,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 30),
                      Container(
                        width: double.infinity,
                        padding: EdgeInsets.all(isWeb ? 30 : 20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.1),
                              spreadRadius: 2,
                              blurRadius: 8,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            _buildDetailField('Company Name', 'Myth Reality Tech Pvt Ltd', isWeb),
                            SizedBox(height: 20),
                            _buildDetailField('Mobile Number', '9042545259', isWeb),
                            SizedBox(height: 20),
                            _buildIndustryTypeField(isWeb),
                            SizedBox(height: 20),
                            _buildDetailField('Company Website', '—', isWeb),
                            SizedBox(height: 20),
                            _buildDetailField('Alternative Email', '—', isWeb),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildDetailField(String label, String value, bool isWeb) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black,
            fontSize: isWeb ? 16 : 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 6),
        Text(
          value,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: isWeb ? 18 : 16,
            fontWeight: FontWeight.normal,
          ),
        ),
      ],
    );
  }

  Widget _buildIndustryTypeField(bool isWeb) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Industry Type',
          style: TextStyle(
            color: Colors.black,
            fontSize: isWeb ? 16 : 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildIndustryType('IT', isWeb),
            SizedBox(height: 8),
            _buildIndustryType('Healthcare', isWeb),
            SizedBox(height: 8),
            _buildIndustryType('Organization', isWeb),
            SizedBox(height: 8),
            _buildIndustryType('Production', isWeb),
          ],
        ),
      ],
    );
  }

  Widget _buildIndustryType(String type, bool isWeb) {
    return Row(
      children: [
        Container(
          width: isWeb ? 8 : 6,
          height: isWeb ? 8 : 6,
          decoration: BoxDecoration(
            color: kButtonColor,
            shape: BoxShape.circle,
          ),
        ),
        SizedBox(width: 10),
        Flexible(
          child: Text(
            type,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: isWeb ? 16 : 14,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
