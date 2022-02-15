import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebasetask/data/datasources/remote/firebase_remote_data_source.dart';
import 'package:firebasetask/domain/entities/food_item_entity.dart';
import 'package:firebasetask/domain/entities/user_entity.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';

class FirebaseRemoteDataSourceImpl implements FirebaseRemoteDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore fireStore;
  FirebaseRemoteDataSourceImpl({required this.auth, required this.fireStore});


  @override
  Future<UserCredential> signIn(UserEntity user) async {
    return auth.signInWithEmailAndPassword(
        email: user.email!, password: user.password!);
  }

  @override
  Future<void> signOut() async => auth.signOut();

  @override
  Stream<List<FoodItemsModel>> getFoodItems() {
    final noteCollectionRef=fireStore.collection("foodData").snapshots();

    return noteCollectionRef.map((querySnap) {

      return querySnap.docs.map((docSnap) => FoodItemsModel.fromSnapshot(docSnap)).toList();
    });
  }

  @override
  Future<List<FoodItemsModel>> getFilteredFoodItems(String filter) async {

     final result = await fireStore.collection("foodData").where("cusine",isEqualTo: filter).get();
    return result.docs.map((value) => FoodItemsModel.fromSnapshot(value)).toList();
  }
}
