import 'package:flutter/material.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _oldPassController = TextEditingController();
  final TextEditingController _newPassController = TextEditingController();
  final TextEditingController _confirmPassController = TextEditingController();

  bool _isOldObscure = true;
  bool _isNewObscure = true;
  bool _isConfirmObscure = true;

  void _changePassword() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Password changed successfully")),
      );
      _oldPassController.clear();
      _newPassController.clear();
      _confirmPassController.clear();
    }
  }

  // ✅ Strong password validation
  String? validateStrongPassword(String? value) {
    if (value == null || value.isEmpty) return 'Enter new password';
    if (value.length < 8) return 'Minimum 8 characters required';
    if (!RegExp(r'[a-z]').hasMatch(value)) return 'Include at least one lowercase letter';
    if (!RegExp(r'[A-Z]').hasMatch(value)) return 'Include at least one uppercase letter';
    if (!RegExp(r'[0-9]').hasMatch(value)) return 'Include at least one number';
    if (!RegExp(r'[!@#\$%^&*(),.?":{}|<>]').hasMatch(value)) {
      return 'Include at least one special character';
    }
    return null;
  }

  Widget buildPasswordInput({
    required String labelText,
    required String hintText,
    required TextEditingController controller,
    required bool obscureText,
    required VoidCallback toggleObscure,
    required String? Function(String?) validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Label with red star
        Text.rich(
          TextSpan(
            text: labelText,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            children: const [
              TextSpan(text: ' *', style: TextStyle(color: Colors.red)),
            ],
          ),
        ),
        const SizedBox(height: 6),

        // Input container
        Container(
          margin: const EdgeInsets.only(bottom: 16),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.grey.shade400),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              suffixIcon: IconButton(
                icon: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: toggleObscure,
              ),
            ),
            validator: validator,
          ),
        ),
      ],
    );
  }

  Widget buildPasswordRules() {
    return Container(
      margin: const EdgeInsets.only(top: 10, bottom: 30),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Password must contain:', style: TextStyle(fontWeight: FontWeight.bold)),
          SizedBox(height: 8),
          Text('• Minimum of 8 characters'),
          Text('• At least one lowercase letter (a-z)'),
          Text('• At least one uppercase letter (A-Z)'),
          Text('• At least one number (0-9)'),
          Text('• At least one special character (!@#...)'),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _oldPassController.dispose();
    _newPassController.dispose();
    _confirmPassController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Password'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              buildPasswordInput(
                labelText: 'Old Password',
                hintText: 'Old Password',
                controller: _oldPassController,
                obscureText: _isOldObscure,
                toggleObscure: () => setState(() => _isOldObscure = !_isOldObscure),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Enter old password' : null,
              ),

              buildPasswordInput(
                labelText: 'New Password',
                hintText: 'New Password',
                controller: _newPassController,
                obscureText: _isNewObscure,
                toggleObscure: () => setState(() => _isNewObscure = !_isNewObscure),
                validator: validateStrongPassword,
              ),

              buildPasswordInput(
                labelText: 'Confirm New Password',
                hintText: 'Confirm New Password',
                controller: _confirmPassController,
                obscureText: _isConfirmObscure,
                toggleObscure: () => setState(() => _isConfirmObscure = !_isConfirmObscure),
                validator: (value) {
                  if (value == null || value.isEmpty) return 'Confirm your password';
                  if (value != _newPassController.text) return 'Passwords do not match';
                  return null;
                },
              ),

              buildPasswordRules(),

              ElevatedButton(
                onPressed: _changePassword,
                child: const Text('Change Password'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}