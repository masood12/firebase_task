import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';
import 'package:firebasetask/domain/respositories/firebase_repository.dart';

class SignInUseCase {
  final FirebaseRepository repository;

  SignInUseCase({required this.repository});

  Future<UserCredential> call(UserEntity user) async {
    return repository.signIn(user);
  }
}
