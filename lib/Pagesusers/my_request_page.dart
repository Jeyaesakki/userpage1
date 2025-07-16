// import 'package:flutter/material.dart';

// class MyRequestPage extends StatefulWidget {
//   const MyRequestPage({super.key});

//   @override
//   State<MyRequestPage> createState() => _MyRequestPageState();
// }

// class _MyRequestPageState extends State<MyRequestPage> {
//   DateTime selectedDate = DateTime.now();
//   String selectedStatus = 'Status';

//   final List<String> statusOptions = [
//     'Status',
//     'Pending',
//     'Approved',
//     'Rejected',
//   ];

//   final List<Map<String, String>> allRequests = []; // Dynamic list

//   List<Map<String, String>> get filteredRequests {
//     if (selectedStatus == 'Status') return allRequests;
//     return allRequests.where((req) => req['status'] == selectedStatus).toList();
//   }

//   Future<void> _selectDate() async {
//     final DateTime? picked = await showDatePicker(
//       context: context,
//       initialDate: selectedDate,
//       firstDate: DateTime(2023),
//       lastDate: DateTime(2030),
//     );
//     if (picked != null) {
//       setState(() => selectedDate = picked);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     String formattedDate =
//         "${selectedDate.day} ${_getMonthName(selectedDate.month)} ${selectedDate.year}";

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // 🔙 Back Header
//               Container(
//                 width: double.infinity,
//                 padding: const EdgeInsets.symmetric(
//                   vertical: 15,
//                   horizontal: 20,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color.fromARGB(255, 0, 136, 102), // Greenish
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 child: GestureDetector(
//                   onTap: () => Navigator.pop(context),
//                   child: const Row(
//                     children: [
//                       Icon(Icons.arrow_back, color: Colors.black),
//                       SizedBox(width: 10),
//                       Text(
//                         "My Request",
//                         style: TextStyle(fontSize: 18, color: Colors.black),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),

//               const SizedBox(height: 20),

//               // 🔘 Date Picker + Dropdown
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   ElevatedButton(
//                     onPressed: _selectDate,
//                     style: ElevatedButton.styleFrom(
//                       backgroundColor: Colors.grey.shade200,
//                       foregroundColor: Colors.black,
//                       elevation: 0,
//                     ),
//                     child: Text(formattedDate),
//                   ),
//                   DropdownButton<String>(
//                     value: selectedStatus,
//                     items: statusOptions.map((value) {
//                       return DropdownMenuItem(value: value, child: Text(value));
//                     }).toList(),
//                     onChanged: (value) =>
//                         setState(() => selectedStatus = value!),
//                     underline: Container(),
//                     dropdownColor: Colors.white,
//                     style: const TextStyle(color: Colors.black),
//                   ),
//                 ],
//               ),

//               const SizedBox(height: 16),

//               Text("Total (${filteredRequests.length})"),

//               const SizedBox(height: 16),

//               // 📄 No data
//               if (filteredRequests.isEmpty)
//                 Expanded(
//                   child: Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: const [
//                         Icon(
//                           Icons.insert_drive_file_outlined,
//                           size: 60,
//                           color: Colors.grey,
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "NO data Available",
//                           style: TextStyle(fontSize: 16, color: Colors.black54),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   String _getMonthName(int month) {
//     const months = [
//       'Jan',
//       'Feb',
//       'Mar',
//       'Apr',
//       'May',
//       'Jun',
//       'Jul',
//       'Aug',
//       'Sep',
//       'Oct',
//       'Nov',
//       'Dec',
//     ];
//     return months[month - 1];
//   }
// }


import 'package:flutter/material.dart';

const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class MyRequestPage extends StatefulWidget {
  const MyRequestPage({super.key});

  @override
  State<MyRequestPage> createState() => _MyRequestPageState();
}

class _MyRequestPageState extends State<MyRequestPage> {
  DateTime selectedDate = DateTime.now();
  String selectedStatus = 'Status';

  final List<String> statusOptions = [
    'Status',
    'Pending',
    'Approved',
    'Rejected',
  ];

  final List<Map<String, String>> allRequests = [];

  List<Map<String, String>> get filteredRequests {
    if (selectedStatus == 'Status') return allRequests;
    return allRequests.where((req) => req['status'] == selectedStatus).toList();
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2023),
      lastDate: DateTime(2030),
    );
    if (picked != null) {
      setState(() => selectedDate = picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    String formattedDate =
        "${selectedDate.day} ${_getMonthName(selectedDate.month)} ${selectedDate.year}";

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [kPrimaryBackgroundTop, kPrimaryBackgroundBottom],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 🔙 Back Header
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 15,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: kAppBarColor,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Row(
                      children: [
                        Icon(Icons.arrow_back, color: kTextColor),
                        SizedBox(width: 10),
                        Text(
                          "My Request",
                          style: TextStyle(fontSize: 18, color: kTextColor),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // 🔘 Date Picker + Dropdown
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      onPressed: _selectDate,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kButtonColor.withOpacity(0.9),
                        foregroundColor: kTextColor,
                        elevation: 0,
                      ),
                      child: Text(formattedDate),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade400),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: selectedStatus,
                        items: statusOptions.map((value) {
                          return DropdownMenuItem(
                              value: value, child: Text(value));
                        }).toList(),
                        onChanged: (value) =>
                            setState(() => selectedStatus = value!),
                        underline: const SizedBox(),
                        dropdownColor: Colors.white,
                        style: const TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 16),
                Text("Total (${filteredRequests.length})",
                    style: const TextStyle(fontWeight: FontWeight.w500)),

                const SizedBox(height: 16),

                // 📄 No data
                if (filteredRequests.isEmpty)
                  Expanded(
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.insert_drive_file_outlined,
                            size: 60,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 10),
                          Text(
                            "NO data Available",
                            style: TextStyle(
                                fontSize: 16, color: Colors.black54),
                          ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String _getMonthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec',
    ];
    return months[month - 1];
  }
}
