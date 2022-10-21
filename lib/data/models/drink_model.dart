import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/entities/menu.dart';

part 'drink_model.g.dart';

@JsonSerializable()
class DrinkModel {
  final String? name;

  const DrinkModel({this.name});

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);

  Menu toEntity() => Menu(name: name ?? "");
}