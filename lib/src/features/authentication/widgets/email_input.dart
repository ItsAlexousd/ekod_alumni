import 'package:flutter/material.dart';

class EmailInput extends StatelessWidget {
  const EmailInput({
    required this.controller,
    required this.readOnly,
    super.key,
  });

  final TextEditingController controller;
  final bool readOnly;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const Text('Adresse email'),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.emailAddress,
          readOnly: readOnly,
        ),
      ],
    );
  }
}
