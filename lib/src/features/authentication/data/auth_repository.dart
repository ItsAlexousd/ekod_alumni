import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

/// {@template auth_repository}
/// Provides an interface to interact with the Firebase Authentication API.
/// {@endtemplate}
class AuthRepository {
  /// {@macro auth_repository}
  AuthRepository({
    required FirebaseAuth auth,
  }) : _auth = auth;

  final FirebaseAuth _auth;

  User? get currentUser => _auth.currentUser;

  /// Notifies about changes to the user's sign-in state (such as sign-in or
  /// sign-out).
  Stream<User?> authStateChanges() => _auth.authStateChanges();

  /// Tries to create a new user account with the given email address and
  /// password.
  Future<void> signUpWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  /// Attempts to sign in a user with the given email address and password.
  ///
  /// If successful, it also signs the user in into the app and updates
  /// [authStateChanges] stream listener.
  Future<void> signInWithEmailAndPassword(String email, String password) {
    throw UnimplementedError();
  }

  /// Signs out the current user.
  ///
  /// If successful, it also updates [authStateChanges] stream listener.
  Future<void> signOut() {
    throw UnimplementedError();
  }
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(Ref ref) {
  return AuthRepository(auth: FirebaseAuth.instance);
}

@Riverpod(keepAlive: true)
Stream<User?> authStateChanges(Ref ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
}
