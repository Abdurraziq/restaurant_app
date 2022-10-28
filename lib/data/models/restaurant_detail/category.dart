import 'package:json_annotation/json_annotation.dart';
import 'package:restaurant_app/domain/domain.dart';

part 'category.g.dart';

@JsonSerializable()
class CategoryModel {
  String? name;

  CategoryModel({this.name});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return _$CategoryModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);

  Category toEntity() => Category(name: "$name");
}
