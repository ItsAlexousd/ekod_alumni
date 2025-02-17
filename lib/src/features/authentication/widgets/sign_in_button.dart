import 'package:ekod_alumni/src/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({
    required this.onPressed,
    this.isLoading = false,
    super.key,
  });

  final void Function()? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      child: !isLoading
          ? const Text('Se connecter')
          : const ButtonProgressIndicator(),
    );
  }
}
