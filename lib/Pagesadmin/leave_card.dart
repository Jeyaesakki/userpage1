// // leave_card.dart
// import 'package:flutter/material.dart';

// class LeaveCard extends StatelessWidget {
//   final Map<String, dynamic> item;
//   final Function(String) onStatusChange;

//   const LeaveCard({super.key, required this.item, required this.onStatusChange});

//   @override
//   Widget build(BuildContext context) {
//     return Card(
//       color: Colors.deepPurple[100],
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ...item.entries
//                 .where((e) => e.key != 'status') // Skip status from list
//                 .map((e) => Text('${e.key} : ${e.value}')),
//             const SizedBox(height: 10),
//             if (item['status'] == 'pending') Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 ElevatedButton(
//                   onPressed: () => onStatusChange('approved'),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
//                   child: const Text('Approve'),
//                 ),
//                 const SizedBox(width: 8),
//                 ElevatedButton(
//                   onPressed: () => onStatusChange('rejected'),
//                   style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//                   child: const Text('Reject'),
//                 ),
//               ],
//             ),
//             if (item['status'] != 'pending') Text("Status: ${item['status'].toUpperCase()}"),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class LeaveCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final Function(String) onStatusChange;

  const LeaveCard({
    super.key,
    required this.item,
    required this.onStatusChange,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.deepPurple[100],
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ...item.entries
                .where((e) => e.key != 'status') // Skip status from list
                .map((e) => Text('${e.key} : ${e.value}')),
            const SizedBox(height: 10),
            if (item['status'] == 'pending')
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () => onStatusChange('approved'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      minimumSize: const Size(60, 30), // Button size reduced
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    child: const Text('Approve'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () => onStatusChange('rejected'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      minimumSize: const Size(60, 30), // Button size reduced
                      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                      textStyle: const TextStyle(fontSize: 12),
                    ),
                    child: const Text('Reject'),
                  ),
                ],
              ),
            if (item['status'] != 'pending')
              Text("Status: ${item['status'].toUpperCase()}"),
          ],
        ),
      ),
    );
  }
}