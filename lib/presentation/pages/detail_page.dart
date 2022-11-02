import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/commons/commons.dart';
import 'package:restaurant_app/domain/domain.dart';
import 'package:restaurant_app/presentation/presentation.dart';
import 'package:restaurant_app/provider/provider.dart';

class DetailPage extends StatelessWidget {
  static const routeName = '/restaurant_detail';
  final String id;
  const DetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    context.read<DetailProvider>().getRestaurantDetailData(id);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Consumer<DetailProvider>(
            builder: (context, value, child) {
              return _buildContent(
                apiState: value.restaurantDetailApiState,
                context: context,
              );
            },
          ),
        ),
      ),
      floatingActionButton: Consumer<DetailProvider>(
        builder: (context, value, child) {
          return _fabSection(
            value.restaurantDetailApiState,
            context,
          );
        },
      ),
    );
  }

  Widget _buildContent({
    required ApiState<RestaurantDetail> apiState,
    required BuildContext context,
  }) {
    if (apiState is OnDataLoaded<RestaurantDetail>) {
      return _mainSection(
        dataDetail: apiState,
        context: context,
      );
    } else if (apiState is OnFailure<RestaurantDetail>) {
      return OnFailureWidget(
        message: apiState.message,
        withRefreshButton: true,
        onTap: () {
          context.read<DetailProvider>().refreshDetailData();
        },
      );
    }
    return const CircularProgressIndicator();
  }

  Widget _mainSection({
    required OnDataLoaded<RestaurantDetail> dataDetail,
    required BuildContext context,
  }) {
    final RestaurantDetail restaurantDetail = dataDetail.data;
    context
        .read<ReviewProvider>()
        .setRestaurantReviewData(restaurantDetail.reviews);
    context.read<FavoriteProvider>().checkIsFavorited(restaurantDetail.id);

    TextTheme textTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        _heroSection(
          pictureId: restaurantDetail.pictureId,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720),
          child: Column(
            children: [
              _titleSection(
                name: restaurantDetail.name,
                textTheme: textTheme,
              ),
              _infoSection(
                city: restaurantDetail.city,
                rating: restaurantDetail.rating.toString(),
              ),
              _categoriesSection(
                categories: restaurantDetail.categories,
                textTheme: textTheme,
              ),
              _descriptionSection(
                description: restaurantDetail.description,
                context: context,
              ),
              _menusSection(
                menus: restaurantDetail.menus,
                textTheme: textTheme,
              ),
              _reviewsSection(
                restaurant: restaurantDetail,
                textTheme: textTheme,
                context: context,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _heroSection({required String pictureId}) => Image.network(
        Endpoint.smallPicture(pictureId),
        width: double.infinity,
        height: 320,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Icon(Icons.broken_image_outlined);
        },
      );

  Widget _titleSection({required String name, required TextTheme textTheme}) =>
      Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Text(
          name,
          style: textTheme.headlineLarge,
        ),
      );

  Widget _infoSection({required String city, required String rating}) =>
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextIconVertical(
              text: rating,
              icon: Icons.star,
              color: const Color(0xFFB3261E),
            ),
            TextIconVertical(
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
      padding: const EdgeInsets.fromLTRB(16.0, 32.0, 16.0, 72.0),
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

  Widget _fabSection(
    ApiState<RestaurantDetail> apiState,
    BuildContext context,
  ) {
    if (apiState is OnDataLoaded<RestaurantDetail>) {
      return Consumer<FavoriteProvider>(
        builder: (context, value, child) {
          return FloatingActionButton(
            onPressed: () {
              value.isFavoriteRestaurant
                  ? value.deleteFavoriteRestaurant(apiState.data.id)
                  : value.addRestaurantToFavorite(apiState.data);
            },
            child: Icon(
              value.isFavoriteRestaurant
                  ? Icons.favorite
                  : Icons.favorite_border,
            ),
          );
        },
      );
    }

    return const SizedBox();
  }
}
