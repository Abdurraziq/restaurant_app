// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menus.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenusModel _$MenusModelFromJson(Map<String, dynamic> json) => MenusModel(
      foods: (json['foods'] as List<dynamic>?)
          ?.map((e) => FoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinks: (json['drinks'] as List<dynamic>?)
          ?.map((e) => DrinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MenusModelToJson(MenusModel instance) =>
    <String, dynamic>{
      'foods': instance.foods,
      'drinks': instance.drinks,
    };
