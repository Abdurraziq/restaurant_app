import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

part 'food.g.dart';

@JsonSerializable()
class FoodModel {
  String? name;

  FoodModel({this.name});

  factory FoodModel.fromJson(Map<String, dynamic> json) =>
      _$FoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodModelToJson(this);

  Menu toEntity() => Menu(name: "$name");
}
