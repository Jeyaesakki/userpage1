


import 'package:flutter/material.dart';
import 'apply_half_day_form_page.dart';

// App-wide theme colors
const Color kPrimaryBackgroundTop = Color(0xFFFFFFFF);
const Color kPrimaryBackgroundBottom = Color(0xFFD1C4E9);
const Color kAppBarColor = Color(0xFF8C6EAF);
const Color kButtonColor = Color(0xFF655193);
const Color kTextColor = Colors.white;

class PermissionTimePage extends StatelessWidget {
  final bool isPopup;
  const PermissionTimePage({super.key, this.isPopup = false});

  @override
  Widget build(BuildContext context) {
    final int totalPT = 10;
    final int takenPT = 4;
    final String status = "Approved";

    final content = Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                // PT Summary Boxes
                Row(
                  children: [
                    Expanded(
                      child: _buildFixedBox(
                        "Total\nPT: $totalPT",
                        Colors.green,
                        const Color(0xFFE6F5E6),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _buildFixedBox(
                        "Taken\nPT: $takenPT",
                        Colors.red,
                        const Color(0xFFFFE6E6),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),

                // Status Box
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                  decoration: BoxDecoration(
                    color: kPrimaryBackgroundBottom,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Status: $status",
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Apply Button
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close popup first
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (_) => const ApplyHalfDayForm()),
                  );
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: kButtonColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: const Text(
                "Apply Request",
                style: TextStyle(fontSize: 18, color: kTextColor),
              ),
            ),
          ),
        ),
      ],
    );

    return isPopup
        ? Dialog(
            insetPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 24),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: SizedBox(
              height: 450,
              width: 360,
              child: content,
            ),
          )
        : Scaffold(
            backgroundColor: kPrimaryBackgroundTop,
            appBar: AppBar(
              title: const Text("Permission Time"),
              backgroundColor: kAppBarColor,
              leading: const BackButton(),
            ),
            body: content,
          );
  }

  Widget _buildFixedBox(String text, Color borderColor, Color bgColor) {
    return Container(
      height: 80,
      alignment: Alignment.center,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor),
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }
}