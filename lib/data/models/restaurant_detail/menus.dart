import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

import 'drink.dart';
import 'food.dart';

part 'menus.g.dart';

@JsonSerializable()
class MenusModel extends Equatable {
  final List<FoodModel>? foods;
  final List<DrinkModel>? drinks;

  const MenusModel({this.foods, this.drinks});

  factory MenusModel.fromJson(Map<String, dynamic> json) =>
      _$MenusModelFromJson(json);

  Map<String, dynamic> toJson() => _$MenusModelToJson(this);

  Menus toEntity() => Menus(
        foods: foods?.map((e) => e.toEntity()).toList(),
        drinks: drinks?.map((e) => e.toEntity()).toList(),
      );

  @override
  List<Object?> get props => [foods, drinks];
}
