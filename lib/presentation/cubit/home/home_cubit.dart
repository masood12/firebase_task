import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebasetask/domain/model/food_items_model.dart';
import 'package:firebasetask/domain/use_cases/get_current_uid_usecase.dart';
import 'package:firebasetask/domain/use_cases/get_filtered_food_item_usecase.dart';
import 'package:firebasetask/domain/use_cases/get_food_item_usecase.dart';
import 'package:firebasetask/domain/use_cases/is_sign_in_usecase.dart';
import 'package:firebasetask/domain/use_cases/sign_out_usecase.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  final GetFoodItemUseCase foodItemUseCase;
  final GetFilteredFoodItemUseCase filteredFoodItemUseCase;
  HomeCubit(
      {required this.foodItemUseCase,required this.filteredFoodItemUseCase})
      : super(Initial());

  Future<void> getData(String filter)async{
    emit(LoadingState());
    try{
      foodItemUseCase.call(filter).listen((foodList) {

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

    for(int i = 0;i<list!.length;i++){
      if(!filterList.contains(list[i].cusine)){
        filterList.add(list[i].cusine!);
      }
    }
    return filterList;
  }

  Future<void> getFilterData(String filter) async{
    emit(LoadingState());
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
