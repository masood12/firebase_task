import 'package:equatable/equatable.dart';

class FoodItemEntity extends Equatable {

  final String? filter;
  const FoodItemEntity({ this.filter});

  @override
  List<Object?> get props => [filter];
}
