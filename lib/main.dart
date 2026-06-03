import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Splity',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0D0E12),
        useMaterial3: true,
      ),
      home: const SplityHomeScreen(),
    );
  }
}

class SplityHomeScreen extends StatelessWidget {
  const SplityHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment.center,
            radius: 1.2,
            colors: [
              Color(0xFF1E202C),
              Color(0xFF0D0E12),
            ],
          ),
        ),
        child: Center(
          child: TweenAnimationBuilder<double>(
            tween: Tween<double>(begin: 0.0, end: 1.0),
            duration: const Duration(milliseconds: 1200),
            curve: Curves.easeOutCubic,
            builder: (context, value, child) {
              return Transform.scale(
                scale: 0.95 + (0.05 * value),
                child: Opacity(
                  opacity: value,
                  child: child,
                ),
              );
            },
            child: const Text(
              'splity',
              style: TextStyle(
                fontSize: 54,
                fontWeight: FontWeight.w900,
                letterSpacing: -2.0,
                color: Colors.white,
                shadows: [
                  Shadow(
                    color: Color(0x40000000),
                    offset: Offset(0, 4),
                    blurRadius: 12,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
