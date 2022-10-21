import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/presentation/widgets/restaurant_menu_list.dart';
import 'package:restaurant_app/presentation/widgets/vertical_text_icon.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  final Restaurant restaurant;

  const RestaurantDetailPage({super.key, required this.restaurant});

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text(restaurant.name),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _heroSection(),
            Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 720),
                child: Column(
                  children: [
                    _titleSection(textTheme: textTheme),
                    _infoSection(),
                    _descriptionSection(context: context),
                    _menusSection(textTheme: textTheme)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroSection() => Hero(
        tag: "img-${restaurant.id}",
        child: Image.network(
          restaurant.pictureId,
          width: double.infinity,
          height: 320,
          fit: BoxFit.cover,
        ),
      );

  Widget _titleSection({required TextTheme textTheme}) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Text(
        restaurant.name,
        style: textTheme.headlineLarge,
      ),
    );
  }

  Widget _infoSection() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VerticalTextIcon(
              text: restaurant.rating.toString(),
              icon: Icons.star,
              color: const Color(0xFFB3261E),
            ),
            VerticalTextIcon(
              text: restaurant.city,
              icon: Icons.place,
              color: const Color(0xFF6750A4),
            ),
          ],
        ),
      );

  Widget _descriptionSection({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Card(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                "About",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
              const SizedBox(
                height: 16.0,
              ),
              Text(
                restaurant.description,
                softWrap: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _menusSection({required TextTheme textTheme}) => Column(
        children: [
          const SizedBox(
            height: 32,
          ),
          Text(
            "Menus",
            style: textTheme.headlineSmall,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Foods"),
          ),
          RestaurantMenuList(
            menus: restaurant.menus?.foods,
            icon: Icons.restaurant_menu,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Drinks"),
          ),
          RestaurantMenuList(
            menus: restaurant.menus?.drinks,
            icon: Icons.local_bar,
          ),
        ],
      );
}
