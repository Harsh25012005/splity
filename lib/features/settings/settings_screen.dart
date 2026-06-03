import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.settings_outlined,
              size: 64,
              color: isDark ? AppColors.neutral600 : AppColors.neutral300,
            ),
            const SizedBox(height: 16),
            Text(
              'App Settings',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.neutral400 : AppColors.neutral500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Manage your profile, theme preferences, and UPI ID.',
              style: TextStyle(
                fontSize: 14,
                color: isDark ? AppColors.neutral500 : AppColors.neutral400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
