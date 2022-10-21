import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/entities/menu.dart';

part 'food_model.g.dart';

@JsonSerializable()
class FoodModel {
  final String? name;

  const FoodModel({this.name});

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);

  Menu toEntity() => Menu(name: name ?? "");
}
