import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/entities/menus.dart';

import 'drink_model.dart';
import 'food_model.dart';

part 'menus_model.g.dart';

@JsonSerializable()
class MenusModel {
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
}
