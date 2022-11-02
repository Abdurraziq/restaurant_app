import 'package:flutter/material.dart';
import 'package:restaurant_app/presentation/presentation.dart';

Map<String, WidgetBuilder> get routes {
  return {
    MainPages.routeName: (_) => const MainPages(),
    DetailPage.routeName: (context) => DetailPage(
          id: ModalRoute.of(context)?.settings.arguments as String,
        )
  };
}
