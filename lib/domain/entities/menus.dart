import 'package:restaurant_app/domain/entities/menu.dart';

class Menus {
  final List<Menu>? foods;
  final List<Menu>? drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });
}
