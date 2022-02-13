import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/presentation/cubit/auth/auth_cubit.dart';
import 'package:firebasetask/presentation/cubit/user/user_cubit.dart';
import 'package:get_it/get_it.dart';

import 'data/datasources/remote/firebase_remote_data_source.dart';
import 'data/datasources/remote/firebase_remote_data_source_impl.dart';
import 'data/reposotories/firebase_repository_impl.dart';
import 'domain/respositories/firebase_repository.dart';
import 'domain/use_cases/get_create_current_user_usecase.dart';
import 'domain/use_cases/get_current_uid_usecase.dart';
import 'domain/use_cases/is_sign_in_usecase.dart';
import 'domain/use_cases/sign_in_usecase.dart';
import 'domain/use_cases/sign_out_usecase.dart';

final GetIt sl = GetIt.instance;

Future<void> initDI() async {
  //Cubits
  _cubits();
  //useCase
  _useCases();
  //repositories
  _repoIntialization();
  //dataSources
  _dataSources();
  //external
  _external();
}

void _external() {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance;

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => fireStore);
}

void _dataSources() {
  sl.registerLazySingleton<FirebaseRemoteDataSource>(() =>
      FirebaseRemoteDataSourceImpl(auth: sl.call(), fireStore: sl.call()));
}

void _repoIntialization() {
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));
}

void _cubits() {
  sl.registerFactory<AuthCubit>(() => AuthCubit(
      isSignInUseCase: sl.call(),
      signOutUseCase: sl.call(),
      getCurrentUidUseCase: sl.call()));
  sl.registerFactory<UserCubit>(() => UserCubit(
        getCreateCurrentUserUseCase: sl.call(),
        signInUseCase: sl.call(),
      ));
}

void _useCases() {
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUidUseCase>(
      () => GetCurrentUidUseCase(repository: sl.call()));

  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
}
