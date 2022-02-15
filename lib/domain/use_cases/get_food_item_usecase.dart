import 'package:firebasetask/domain/model/food_items_model.dart';
import 'package:firebasetask/domain/respositories/firebase_repository.dart';

class GetFoodItemUseCase {

  final FirebaseRepository repository;

  GetFoodItemUseCase({required this.repository});

  Stream<List<FoodItemsModel>> call(){
    return repository.getFoodItems();
  }
}