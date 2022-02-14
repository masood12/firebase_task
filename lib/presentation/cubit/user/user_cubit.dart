import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/core/utils/pref_utils.dart';
import 'package:firebasetask/core/utils/pref_utils.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';
import 'package:firebasetask/domain/use_cases/get_create_current_user_usecase.dart';
import 'package:firebasetask/domain/use_cases/sign_in_usecase.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final SignInUseCase signInUseCase;
  final GetCreateCurrentUserUseCase getCreateCurrentUserUseCase;
  UserCubit(
      {required this.signInUseCase, required this.getCreateCurrentUserUseCase})
      : super(UserInitial());

  String error = "";
  Future<void> submitSignIn({required UserEntity user}) async {
    emit(UserLoading());
    try {
      UserCredential userCredential = await signInUseCase.call(user);
      PreferenceUtils.saveBool("isLoggedId",true);
      emit(UserSuccess());
    } on FirebaseAuthException catch (e) {
      emit(UserFailure(error: e.message));
    } on SocketException catch (e) {
      emit(UserFailure(error: e.message));
    } catch (e) {
      emit(UserFailure(error: e.toString()));
    }
  }
}
