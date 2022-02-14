import 'package:firebasetask/domain/entities/food_item_entity.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';
import 'package:firebasetask/domain/respositories/firebase_repository.dart';

class GetFilteredFoodItemUseCase {

  final FirebaseRepository repository;

  GetFilteredFoodItemUseCase({required this.repository});

  Future<List<FoodItemsModel>> filteredData(String filter){
    return repository.getFilteredFoodItems(filter);
  }
}