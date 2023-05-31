import 'package:flutter/material.dart';
import 'package:test_vascomm/core/utils/res/app_string.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        AppString.settingPage,
      ),
    );
  }
}
