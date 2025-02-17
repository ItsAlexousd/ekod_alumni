import 'package:ekod_alumni/src/features/authentication/authentication.dart';
import 'package:ekod_alumni/src/utils/utils.dart';
import 'package:ekod_alumni/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SignInView extends ConsumerStatefulWidget {
  const SignInView({super.key});

  @override
  ConsumerState<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends ConsumerState<SignInView> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController(text: 'alexis@ekod.school');
  final _passwordController = TextEditingController(text: 'Test123?');
  bool _obscurePassword = true;

  String get email => _emailController.text;
  String get password => _passwordController.text;

  void _togglePasswordVisibility() {
    setState(() {
      _obscurePassword = !_obscurePassword;
    });
  }

  Future<void> _signIn() {
    return ref
        .read(signInControllerProvider.notifier)
        .signInWithEmailAndPassword(email, password);
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      signInControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(signInControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connexion'),
      ),
      body: Form(
        key: _formKey,
        child: ResponsiveLayoutBuilder(
          small: (context, _) {
            return ScrollableColumn(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              padding: const EdgeInsets.all(32),
              children: [
                EmailInput(
                  controller: _emailController,
                  readOnly: state.isLoading,
                ),
                const SizedBox(height: 16),
                PasswordInput(
                  controller: _passwordController,
                  onTogglePasswordVisibility: _togglePasswordVisibility,
                  obscureText: _obscurePassword,
                  readOnly: state.isLoading,
                ),
                const SizedBox(height: 32),
                const Spacer(),
                SignInButton(
                  onPressed: _signIn,
                  isLoading: state.isLoading,
                ),
              ],
            );
          },
          large: (context, _) {
            return Center(
              child: ScrollableColumn(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                padding: const EdgeInsets.all(32),
                maxWidth: 600,
                children: [
                  EmailInput(
                    controller: _emailController,
                    readOnly: state.isLoading,
                  ),
                  const SizedBox(height: 16),
                  PasswordInput(
                    controller: _passwordController,
                    onTogglePasswordVisibility: _togglePasswordVisibility,
                    obscureText: _obscurePassword,
                    readOnly: state.isLoading,
                  ),
                  const SizedBox(height: 32),
                  SignInButton(
                    onPressed: _signIn,
                    isLoading: state.isLoading,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
