import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

part 'drink.g.dart';

@JsonSerializable()
class DrinkModel extends Equatable {
  final String? name;

  const DrinkModel({this.name});

  factory DrinkModel.fromJson(Map<String, dynamic> json) =>
      _$DrinkModelFromJson(json);

  Map<String, dynamic> toJson() => _$DrinkModelToJson(this);

  Menu toEntity() => Menu(name: "$name");

  @override
  List<Object?> get props => [name];
}
