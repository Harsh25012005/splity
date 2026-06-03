import 'package:flutter/material.dart';
import '../../core/theme/app_colors.dart';

class GroupsListScreen extends StatelessWidget {
  const GroupsListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Office Groups'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.group_outlined,
              size: 64,
              color: isDark ? AppColors.neutral600 : AppColors.neutral300,
            ),
            const SizedBox(height: 16),
            Text(
              'No groups created yet',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: isDark ? AppColors.neutral400 : AppColors.neutral500,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Create a group to start splitting office expenses.',
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
