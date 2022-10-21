import 'package:flutter/material.dart';
import 'package:restaurant_app/domain/entities/restaurant.dart';
import 'package:restaurant_app/presentation/widgets/horizontal_text_icon.dart';

class RestaurantListItem extends StatelessWidget {
  const RestaurantListItem({
    super.key,
    required this.restaurant,
    required this.onTap,
  });

  final Restaurant restaurant;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: SizedBox(
          height: 100,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 1,
                child: Hero(
                  tag: "img-${restaurant.id}",
                  child: Image.network(
                    restaurant.pictureId,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                child: _ShortDetailSection(
                  name: restaurant.name,
                  description: restaurant.description,
                  city: restaurant.city,
                  rating: restaurant.rating,
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        onTap();
      },
    );
  }
}

class _ShortDetailSection extends StatelessWidget {
  const _ShortDetailSection({
    required this.name,
    required this.description,
    required this.city,
    required this.rating,
  });

  final String name;
  final String description;
  final String city;
  final double rating;

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _name(textTheme.titleMedium),
          HorizontalTextIcon(
            text: "$rating",
            textStyle: textTheme.bodySmall,
            iconData: Icons.star,
            iconColor: const Color(0xFFB3261E),
          ),
          HorizontalTextIcon(
            text: city,
            textStyle: textTheme.labelSmall,
            iconData: Icons.place,
            iconColor: const Color(0xFF6750A4),
          ),
          _shortDescription(textTheme.bodySmall)
        ],
      ),
    );
  }

  Widget _name(TextStyle? textStyle) => Padding(
        padding: const EdgeInsets.only(bottom: 4),
        child: Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        ),
      );

  Widget _shortDescription(TextStyle? textStyle) => Padding(
        padding: const EdgeInsets.only(top: 6.0),
        child: Text(
          description,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: textStyle,
        ),
      );
}
