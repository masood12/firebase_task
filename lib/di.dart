import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/presentation/cubit/home/home_cubit.dart';
import 'package:firebasetask/presentation/cubit/user/user_cubit.dart';
import 'package:get_it/get_it.dart';
import 'data/datasources/remote/firebase_remote_data_source.dart';
import 'data/datasources/remote/firebase_remote_data_source_impl.dart';
import 'data/reposotories/firebase_repository_impl.dart';
import 'domain/respositories/firebase_repository.dart';
import 'domain/use_cases/get_filtered_food_item_usecase.dart';
import 'domain/use_cases/get_food_item_usecase.dart';
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

  sl.registerFactory<UserCubit>(() => UserCubit(
        signInUseCase: sl.call(),
      ));
  sl.registerFactory<HomeCubit>(() => HomeCubit(
      foodItemUseCase: sl.call(),
      filteredFoodItemUseCase: sl.call()
  ));
}

void _useCases() {

  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetFoodItemUseCase>(
          () => GetFoodItemUseCase(repository: sl.call()));

  sl.registerLazySingleton<GetFilteredFoodItemUseCase>(
          () => GetFilteredFoodItemUseCase(repository: sl.call()));
}
