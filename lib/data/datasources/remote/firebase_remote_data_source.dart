import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/domain/entities/food_item_entity.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';

abstract class FirebaseRemoteDataSource {
  Future<UserCredential> signIn(UserEntity user);
  Future<void> signOut();
  Stream<List<FoodItemsModel>> getFoodItems();
  Future<List<FoodItemsModel>> getFilteredFoodItems(String filter);
}