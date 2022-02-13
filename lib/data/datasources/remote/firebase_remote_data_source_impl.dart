import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/data/datasources/remote/firebase_remote_data_source.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;
  FirebaseRemoteDataSourceImpl({required this.auth, required this.fireStore});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) {
    // TODO: implement getCreateCurrentUser
    throw UnimplementedError();
  }

  @override
  Future<String> getCurrentUId() async => auth.currentUser!.uid;

  @override
  Future<bool> isSignIn() async => auth.currentUser?.uid != null;

  @override
  Future<UserCredential> signIn(UserEntity user) async {
    return auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> signOut() async => auth.signOut();
}
