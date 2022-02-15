import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';
import 'package:firebasetask/domain/use_cases/get_filtered_food_item_usecase.dart';
import 'package:firebasetask/domain/use_cases/get_food_item_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetFoodItemUseCase foodItemUseCase;
  final GetFilteredFoodItemUseCase filteredFoodItemUseCase;
  HomeCubit(
      {required this.foodItemUseCase,required this.filteredFoodItemUseCase})
      : super(Initial());

  Future<void> getData()async{
    emit(LoadingState());
    try{
      print("load all data");
      foodItemUseCase.call().listen((foodList) {

        emit(LoadedState(foodList: foodList,filterList: getFilteredList(foodList)));
      });
    }on SocketException catch(e){
      emit(ErrorState(error: e.toString()));
    }catch(e){
      emit(ErrorState(error: e.toString()));
    }
  }

  List<String> getFilteredList(List<FoodItemsModel>? list){

    List<String>? filterList = [];

    filterList.clear();
    for(int i = 0;i<list!.length;i++){

      if(!filterList.contains(list[i].cusine)){
        filterList.add(list[i].cusine!);
      }
    }
    if(filterList.length>1){
      filterList.insert(0, "All");
    }
    return filterList;
  }

  Future<void> getFilterData(String filter) async{
    emit(FiltersLoadingState());
    try{
      {
        var list =  await filteredFoodItemUseCase.filteredData(filter);
        emit(FilterStateLoaded(
            foodList: list));
      }

    }on SocketException catch(e){
      emit(ErrorState(error: e.toString()));
    }catch(e){
      emit(ErrorState(error: e.toString()));
    }
  }



}
