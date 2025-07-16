import 'package:flutter/material.dart';

class ApplyLeaveFormPage extends StatefulWidget {
  const ApplyLeaveFormPage({super.key});

  @override
  State<ApplyLeaveFormPage> createState() => _ApplyLeaveFormPageState();
}

class _ApplyLeaveFormPageState extends State<ApplyLeaveFormPage> {
  String leaveType = 'Leave';
  String? selectedLeaveType;
  final TextEditingController causeController = TextEditingController();
  final TextEditingController fromDateController = TextEditingController();
  final TextEditingController toDateController = TextEditingController();
  final TextEditingController leaveFormatController = TextEditingController();

  Future<void> _selectDate(TextEditingController controller) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      controller.text = "${picked.day}/${picked.month}/${picked.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Apply leave"),
        backgroundColor: const Color(0xFF9DAAF2),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // Radio toggle
            Row(
              children: [
                Radio(
                  value: 'Leave',
                  groupValue: leaveType,
                  onChanged: (value) {
                    setState(() => leaveType = value.toString());
                  },
                ),
                const Text("Leave"),
                Radio(
                  value: 'Comp off',
                  groupValue: leaveType,
                  onChanged: (value) {
                    setState(() => leaveType = value.toString());
                  },
                ),
                const Text("Comp off"),
              ],
            ),
            const SizedBox(height: 8),

            // Leave Type Dropdown
            DropdownButtonFormField<String>(
              value: selectedLeaveType,
              hint: const Text("Choose Leave Type"),
              items: ['Casual Leave', 'Sick Leave', 'Planned Leave']
                  .map((type) => DropdownMenuItem(value: type, child: Text(type)))
                  .toList(),
              onChanged: (value) {
                setState(() => selectedLeaveType = value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Cause
            TextFormField(
              controller: causeController,
              decoration: const InputDecoration(
                labelText: "Cause",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // From Date
            TextFormField(
              controller: fromDateController,
              readOnly: true,
              onTap: () => _selectDate(fromDateController),
              decoration: const InputDecoration(
                labelText: "From Date",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // To Date
            TextFormField(
              controller: toDateController,
              readOnly: true,
              onTap: () => _selectDate(toDateController),
              decoration: const InputDecoration(
                labelText: "To Date",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Apply leave count
            TextFormField(
              controller: leaveFormatController,
              decoration: const InputDecoration(
                labelText: "Apply leave count 0",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),

            // Capture image button
            const Text("Capture Image"),
            const SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                // TODO: Camera integration
              },
              style: ElevatedButton.styleFrom(backgroundColor: Colors.black87),
              child: const Text("Capture"),
            ),
            const SizedBox(height: 20),

            // Submit button
            ElevatedButton(
              onPressed: () {
                // TODO: Submit logic
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
              ),
              child: const Text("Submit"),
            )
          ],
        ),
      ),
    );
  }
}

