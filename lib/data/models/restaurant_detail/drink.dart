import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

part 'drink.g.dart';

@JsonSerializable()
class DrinkModel {
  String? name;

  DrinkModel({this.name});

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);

  Menu toEntity() => Menu(name: "$name");
}
