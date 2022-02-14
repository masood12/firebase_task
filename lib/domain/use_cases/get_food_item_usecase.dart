import 'package:firebasetask/domain/entities/food_item_entity.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';
import 'package:firebasetask/domain/respositories/firebase_repository.dart';

class GetFoodItemUseCase {

  final FirebaseRepository repository;

  GetFoodItemUseCase({required this.repository});

  Stream<List<FoodItemsModel>> call(String filter){
    return repository.getFoodItems(filter);
  }
}