import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/presentation/presentation.dart';
import 'package:restaurant_app/provider/provider.dart';

class RestaurantDetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';

  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<DetailProvider>(
            builder: (context, value, _) {
              final apiState = value.restaurantDetailApiState;
              if (apiState is OnDataLoaded<RestaurantDetail>) {
                final RestaurantDetail restaurant = apiState.data;
                context
                    .read<ReviewProvider>()
                    .setRestaurantReview(restaurant.reviews);

                return _buildContent(
                  restaurant: restaurant,
                  context: context,
                );
              } else if (apiState is OnFailure<RestaurantDetail>) {
                return OnFailureWidget(
                  message: apiState.message,
                  withRefreshButton: true,
                  onTap: () {
                    value.refreshDetailData();
                  },
                );
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }

  Widget _buildContent({
    required RestaurantDetail restaurant,
    required BuildContext context,
  }) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        _heroSection(
          pictureId: restaurant.pictureId,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            children: [
              _titleSection(
                name: restaurant.name,
                textTheme: textTheme,
              ),
              _infoSection(
                city: restaurant.city,
                rating: restaurant.rating.toString(),
              ),
              _categoriesSection(
                categories: restaurant.categories,
                textTheme: textTheme,
              ),
              _descriptionSection(
                description: restaurant.description,
                context: context,
              ),
              _menusSection(
                menus: restaurant.menus,
                textTheme: textTheme,
              ),
              _reviewsSection(
                restaurant: restaurant,
                textTheme: textTheme,
                context: context,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _heroSection({
    required String pictureId,
  }) =>
      Image.network(
        Endpoint.smallPicture(pictureId),
        width: double.infinity,
        height: 320,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image_outlined);
        },
      );

  Widget _titleSection({
    required String name,
    required TextTheme textTheme,
  }) =>
      Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Text(
          name,
          style: textTheme.headlineLarge,
        ),
      );

  Widget _infoSection({
    required String city,
    required String rating,
  }) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            VerticalTextIcon(
              text: rating,
              icon: Icons.star,
              color: const Color(0xFFB3261E),
            ),
            VerticalTextIcon(
              text: city,
              icon: Icons.place,
              color: const Color(0xFF6750A4),
            ),
          ],
        ),
      );

  Widget _categoriesSection({
    required List<Category>? categories,
    required TextTheme textTheme,
  }) =>
      Padding(
        padding: const EdgeInsets.only(bottom: 32.0),
        child: Column(
          children: [
            Text(
              "Category",
              style: textTheme.headlineSmall,
            ),
            categories != null
                ? CategoryChips(categories: categories)
                : const Text("No categories"),
          ],
        ),
      );

  Widget _descriptionSection({
    required String description,
    required BuildContext context,
  }) =>
      Padding(
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
                  description,
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

  Widget _menusSection({
    required Menus? menus,
    required TextTheme textTheme,
  }) =>
      Column(
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
            menus: menus?.foods,
            icon: Icons.restaurant_menu,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text("Drinks"),
          ),
          RestaurantMenuList(
            menus: menus?.drinks,
            icon: Icons.local_bar,
          ),
        ],
      );

  Widget _reviewsSection({
    required RestaurantDetail restaurant,
    required TextTheme textTheme,
    required BuildContext context,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 32.0, horizontal: 16.0),
      child: Column(
        children: [
          Text(
            "Review",
            style: textTheme.headlineSmall,
          ),
          ReviewForm(
            id: restaurant.id,
            submitCallback: (review) {
              context.read<ReviewProvider>().addNewReviews(review);
            },
          ),
          const SizedBox(height: 16.0),
          Consumer<ReviewProvider>(
            builder: (_, value, __) {
              return _reviewListSection(
                restaurant.reviews,
                value.restaurantReviewApiState,
                context,
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _reviewListSection(
    List<CustomerReview>? reviews,
    ApiState<List<CustomerReview>> reviewsState,
    BuildContext context,
  ) {
    if (reviewsState is OnDataLoaded<List<CustomerReview>>) {
      return ReviewList(reviews: reviewsState.data);
    } else if (reviewsState is OnFailure<List<CustomerReview>>) {
      return Text(reviewsState.message);
    }
    return const CircularProgressIndicator();
  }
}
