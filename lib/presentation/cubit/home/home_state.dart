part of 'home_cubit.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class Initial extends HomeState {
  @override
  List<Object> get props => [];
}

class LoadingState extends HomeState {

  @override
  List<Object> get props => [];
}
class FiltersLoadingState extends HomeState {

  @override
  List<Object> get props => [];
}

class LoadedState extends HomeState {
  final List<FoodItemsModel>? foodList;
  final List<String>? filterList;
   const LoadedState({required this.foodList,required this.filterList});
  @override
  List<Object> get props => [foodList!,filterList!];
}

class FilterStateLoaded extends HomeState {
  final List<FoodItemsModel>? foodList;

  const FilterStateLoaded({required this.foodList});
  @override
  List<Object> get props => [foodList!];
}

class ErrorState extends HomeState {
  final String? error;

  const ErrorState({required this.error});
  @override
  List<Object> get props => [];
}