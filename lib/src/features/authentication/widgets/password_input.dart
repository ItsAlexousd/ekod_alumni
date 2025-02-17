import 'package:flutter/material.dart';

class PasswordInput extends StatelessWidget {
  const PasswordInput({
    required this.controller,
    required this.onTogglePasswordVisibility,
    required this.obscureText,
    required this.readOnly,
    super.key,
  });

  final TextEditingController controller;
  final void Function() onTogglePasswordVisibility;
  final bool obscureText;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Mot de passe'),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          decoration: InputDecoration(
            suffixIcon: Padding(
              padding: const EdgeInsets.only(right: 4),
              child: IconButton(
                onPressed: onTogglePasswordVisibility,
                icon: Icon(
                  obscureText
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
              ),
            ),
          ),
          keyboardType: TextInputType.visiblePassword,
          obscureText: obscureText,
          readOnly: readOnly,
        ),
      ],
    );
  }
}
