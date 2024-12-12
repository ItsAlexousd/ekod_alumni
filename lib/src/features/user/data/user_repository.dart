import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ekod_alumni/src/features/user/user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'user_repository.g.dart';

/// {@template user_repository}
/// Provides an interface to interact with the user data.
/// {@endtemplate}
class UserRepository {
  /// {@macro user_repository}
  UserRepository({
    required FirebaseFirestore firestore,
  }) : _firestore = firestore;

  final FirebaseFirestore _firestore;

  static String userPath(UserID id) => 'users/$id';

  Future<User?> fetchUser(UserID id) async {
    final ref = _userRef(id);
    final snapshot = await ref.get();
    return snapshot.data();
  }

  Stream<User?> watchUser(UserID id) {
    final ref = _userRef(id);
    return ref.snapshots().map((snapshot) => snapshot.data());
  }

  DocumentReference<User> _userRef(UserID id) {
    return _firestore.doc(userPath(id)).withConverter(
          fromFirestore: (doc, _) => User.fromJson(doc.data()!),
          toFirestore: (user, _) => user.toJson(),
        );
  }
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) {
  return UserRepository(firestore: FirebaseFirestore.instance);
}
