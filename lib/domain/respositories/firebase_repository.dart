import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/domain/entities/food_item_entity.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';

abstract class FirebaseRepository {
  Future<bool> isSignIn();
  Future<UserCredential> signIn(UserEntity user);
  Future<void> signOut();
  Future<String> getCurrentUId();
  Future<void> getCreateCurrentUser(UserEntity user);
  Stream<List<FoodItemsModel>> getFoodItems(String filter);
  Future<List<FoodItemsModel>> getFilteredFoodItems(String filter);
}
