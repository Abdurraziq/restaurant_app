import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_app/provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(
            Icons.notifications,
            size: 32.0,
          ),
          title: Text(
            'Restaurant suggestions',
            style: Theme.of(context).textTheme.headlineSmall,
          ),
          subtitle: Text(
            _noticationSettingInfo(
              context.select(
                (SettingsProvider p) => p.scheduleState,
              ),
            ),
          ),
          trailing: Switch(
            value: context.select(
              (SettingsProvider p) => p.scheduleState,
            ),
            onChanged: (value) {
              onSwitchChange(context, value);
            },
          ),
        )
      ],
    );
  }

  String _noticationSettingInfo(bool state) {
    return state
        ? 'You will receive a restaurant suggestion '
            'notification every 11.00 am.'
        : 'You will not receive a restaurant suggestion '
            'notification';
  }

  void onSwitchChange(BuildContext context, bool value) {
    if (Platform.isAndroid) {
      context.read<SettingsProvider>().settingSchedule(value);
    } else {
      final snackBar = SnackBar(
        content: const Text('Works only on Android'),
        action: SnackBarAction(
          label: 'Ok',
          onPressed: () {},
        ),
      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
