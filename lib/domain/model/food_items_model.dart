import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FoodItemsModel extends Equatable {
  final String? name;
  final String? cusine;
  final String? img;

  const FoodItemsModel({this.name, this.cusine, this.img});

  @override
  List<Object?> get props => [name, cusine, img];

  factory FoodItemsModel.fromSnapshot(DocumentSnapshot documentSnapshot){
    final dynamic data = documentSnapshot.data();
    print("data added : ${data['name']}");
    return FoodItemsModel(
      name: data["name"],
      cusine: data['cusine'],
      img: data['img'],

    );
  }
}

