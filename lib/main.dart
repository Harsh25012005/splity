import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/theme/index.dart';
import 'shared/widgets/design_system_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: SplityApp()));
}

class SplityApp extends StatelessWidget {
  const SplityApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splity',
      debugShowCheckedModeBanner: false,

      // ── Theme ────────────────────────────────────────────
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      themeMode: ThemeMode.system, // follows device setting

      home: const DesignSystemPage(),
    );
  }
}
