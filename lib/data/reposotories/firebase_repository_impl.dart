import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/data/datasources/remote/firebase_remote_data_source.dart';
import 'package:firebasetask/domain/entities/food_item_entity.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';
import 'package:firebasetask/domain/respositories/firebase_repository.dart';

class FirebaseRepositoryImpl extends FirebaseRepository {
  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({required this.remoteDataSource});

  @override
  Future<void> getCreateCurrentUser(UserEntity user) async =>
      remoteDataSource.getCreateCurrentUser(user);

  @override
  Future<String> getCurrentUId() async => remoteDataSource.getCurrentUId();

  @override
  Future<bool> isSignIn() async => remoteDataSource.isSignIn();

  @override
  Future<UserCredential> signIn(UserEntity user) async =>
      remoteDataSource.signIn(user);

  @override
  Future<void> signOut() async => remoteDataSource.signOut();

  @override
  Stream<List<FoodItemsModel>> getFoodItems(String filter) {

   return remoteDataSource.getFoodItems(filter);
  }

  @override
  Future<List<FoodItemsModel>> getFilteredFoodItems(String filter) {
    return remoteDataSource.getFilteredFoodItems(filter);
  }
}
