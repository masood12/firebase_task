import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';

abstract class FirebaseRemoteDataSource {
  Future<bool> isSignIn();
  Future<UserCredential> signIn(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
  //Stream<List<NoteEntity>> getNotes(String uid);
}
