import 'package:ekod_alumni/src/features/authentication/authentication.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'sign_in_controller.g.dart';

@riverpod
class SignInController extends _$SignInController {
  @override
  FutureOr<void> build() {
    // Nothing to do
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    final authRepository = ref.watch(authRepositoryProvider);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(
      () => authRepository.signInWithEmailAndPassword(email, password),
    );
  }
}
