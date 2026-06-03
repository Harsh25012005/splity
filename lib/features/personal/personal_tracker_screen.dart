import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class PersonalTrackerScreen extends StatelessWidget {
  const PersonalTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Personal Tracker'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.account_balance_wallet_outlined,
              size: 64,
              color: isDark ? AppColors.neutral600 : AppColors.neutral300,
            ),
            const SizedBox(height: 16),
            Text(
              'Personal finance tracker',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.neutral400 : AppColors.neutral500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Keep track of your own personal budgets and spending.',
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
