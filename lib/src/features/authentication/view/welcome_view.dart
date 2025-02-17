import 'package:ekod_alumni/src/app/app.dart';
import 'package:ekod_alumni/src/features/authentication/authentication.dart';
import 'package:ekod_alumni/src/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayoutBuilder(
        small: (context, _) {
          return ScrollableColumn(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            padding: const EdgeInsets.all(32),
            children: [
              const Spacer(),
              const EkodLogo(height: 150),
              const SizedBox(height: 32),
              const WelcomeTitle(),
              const SizedBox(height: 16),
              const WelcomeDescription(),
              const Spacer(),
              SignInButton(
                onPressed: () {
                  context.pushNamed(AppRoute.signIn.name);
                },
              ),
              const SizedBox(height: 8),
              SignUpButton(
                onPressed: () {
                  context.pushNamed(AppRoute.signUp.name);
                },
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
                const EkodLogo(),
                const SizedBox(height: 32),
                const WelcomeTitle(),
                const SizedBox(height: 16),
                const WelcomeDescription(),
                const SizedBox(height: 64),
                SignInButton(
                  onPressed: () {
                    context.goNamed(AppRoute.signIn.name);
                  },
                ),
                const SizedBox(height: 8),
                SignUpButton(
                  onPressed: () {
                    context.goNamed(AppRoute.signUp.name);
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
