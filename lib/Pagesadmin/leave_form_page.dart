import 'package:flutter/material.dart';
import 'package:serv_app/Pagesadmin/globals_page.dart';


class LeaveFormPage extends StatefulWidget {
  const LeaveFormPage({super.key});

  @override
  State<LeaveFormPage> createState() => _LeaveFormPageState();
}

class _LeaveFormPageState extends State<LeaveFormPage> {
  final _formKey = GlobalKey<FormState>();

  final typeCtrl = TextEditingController();
  final deptCtrl = TextEditingController();
  final fromCtrl = TextEditingController();
  final toCtrl = TextEditingController();
  final daysCtrl = TextEditingController();

  Future<void> _selectDate(TextEditingController ctrl) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2022),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      ctrl.text = "${picked.day}-${picked.month}-${picked.year}";
    }
  }

  void _saveLeave() {
    if (_formKey.currentState!.validate()) {
      leaveList.add({
        'type': typeCtrl.text,
        'dept': deptCtrl.text,
        'from': fromCtrl.text,
        'to': toCtrl.text,
        'days': daysCtrl.text,
      });
      Navigator.pop(context, true);
    }
  }

  @override
  Widget build(BuildContext context) {
    final purple = Colors.deepPurple;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Leave Type"),
        backgroundColor: purple,
      ),
      backgroundColor: const Color(0xFFF3E5F5), // light purple
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _buildField("Leave Type", typeCtrl),
              _buildField("Department", deptCtrl),
              _buildDateField("From Date", fromCtrl),
              _buildDateField("To Date", toCtrl),
              _buildField("Number of Days", daysCtrl, TextInputType.number),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: purple,
                      side: BorderSide(color: purple),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: purple,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _saveLeave,
                    child: const Text("Create"),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildField(String label, TextEditingController ctrl, [TextInputType? inputType]) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Focus(
        child: TextFormField(
          controller: ctrl,
          keyboardType: inputType,
          style: const TextStyle(color: Colors.deepPurple),
          decoration: _getDecor(label),
          validator: (value) => value == null || value.isEmpty ? 'Required' : null,
        ),
      ),
    );
  }

  Widget _buildDateField(String label, TextEditingController ctrl) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Focus(
        child: TextFormField(
          controller: ctrl,
          readOnly: true,
          style: const TextStyle(color: Colors.deepPurple),
          decoration: _getDecor(label).copyWith(
            suffixIcon: IconButton(
              icon: const Icon(Icons.calendar_today, color: Colors.deepPurple),
              onPressed: () => _selectDate(ctrl),
            ),
          ),
          validator: (value) => value == null || value.isEmpty ? 'Select date' : null,
        ),
      ),
    );
  }

  InputDecoration _getDecor(String label) {
    return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(color: Colors.deepPurple),
      filled: true,
      fillColor: Colors.white,
      focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.deepPurple, width: 1.5),
        borderRadius: BorderRadius.circular(25),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.deepPurple, width: 1),
        borderRadius: BorderRadius.circular(25),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(25),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
    );
  }
}