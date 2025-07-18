// import 'package:flutter/material.dart';

// class FeedbackPage extends StatefulWidget {
//   const FeedbackPage({super.key});

//   @override
//   State<FeedbackPage> createState() => _FeedbackPageState();
// }

// class _FeedbackPageState extends State<FeedbackPage> {
//   final TextEditingController _feedbackController = TextEditingController();
//   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

//   void _submitFeedback() {
//     if (_formKey.currentState!.validate()) {
//       _feedbackController.text.trim();

//       // You can send feedback to MySQL/Python backend here later
//       // For now, just show success message
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text('Feedback submitted successfully!')),
//       );

//       _feedbackController.clear(); // clear the text box
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Feedback'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             children: [
//               const Text(
//                 "Give us your valuable feedback",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 20),
//               TextFormField(
//                 controller: _feedbackController,
//                 maxLines: 5,
//                 decoration: const InputDecoration(
//                   hintText: "Type your feedback here...",
//                   border: OutlineInputBorder(),
//                 ),
//                 validator: (value) {
//                   if (value == null || value.trim().isEmpty) {
//                     return 'Please enter some feedback';
//                   }
//                   return null;
//                 },
//               ),
//               const SizedBox(height: 20),
//               ElevatedButton(
//                 onPressed: _submitFeedback,
//                 child: const Text('Submit'),
//               )
//             ],
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

class FeedbackPage extends StatefulWidget {
  const FeedbackPage({super.key});

  @override
  State<FeedbackPage> createState() => _FeedbackPageState();
}

class _FeedbackPageState extends State<FeedbackPage> {
  final TextEditingController _feedbackController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _submitFeedback() {
    if (_formKey.currentState!.validate()) {
      _feedbackController.text.trim();

      // Submit to backend here if needed
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Feedback submitted successfully!')),
      );

      _feedbackController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Feedback'),
        centerTitle: true,
        backgroundColor: kAppBarColor,
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
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const Text(
                "Give us your valuable feedback",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _feedbackController,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: "Type your feedback here...",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter some feedback';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _submitFeedback,
                child: const Text('Submit'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
