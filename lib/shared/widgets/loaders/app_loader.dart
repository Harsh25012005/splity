import 'package:flutter/material.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme_extensions.dart';

// ══════════════════════════════════════════════════════════════
//  AppLoader — animated loading indicators
//
//  Types:  spinner | shimmer
//  Sizes:  sm | md | lg
// ══════════════════════════════════════════════════════════════

enum AppLoaderType { spinner, shimmer }

enum AppLoaderSize { sm, md, lg }

// ── Spinner ───────────────────────────────────────────────────

class AppLoader extends StatelessWidget {
  const AppLoader({
    super.key,
    this.type = AppLoaderType.spinner,
    this.size = AppLoaderSize.md,
    this.color,
  });

  final AppLoaderType type;
  final AppLoaderSize size;
  final Color? color;

  double get _spinnerSize => switch (size) {
        AppLoaderSize.sm => 18,
        AppLoaderSize.md => 28,
        AppLoaderSize.lg => 40,
      };

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      AppLoaderType.spinner => _SpinnerLoader(
          size: _spinnerSize,
          color: color,
        ),
      AppLoaderType.shimmer => const SizedBox.shrink(),
    };
  }
}

class _SpinnerLoader extends StatelessWidget {
  const _SpinnerLoader({required this.size, this.color});

  final double size;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    final loaderColor = color ?? (isDark ? c.primary400 : c.primary600);

    return SizedBox.square(
      dimension: size,
      child: CircularProgressIndicator(
        strokeWidth: size < 24 ? 2.5 : 3,
        valueColor: AlwaysStoppedAnimation(loaderColor),
        strokeCap: StrokeCap.round,
      ),
    );
  }
}

// ── Shimmer ───────────────────────────────────────────────────

/// Animated shimmer container — use for skeleton loading states.
class AppShimmer extends StatefulWidget {
  const AppShimmer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius,
    this.isCircle = false,
  });

  final double width;
  final double height;
  final double? borderRadius;
  final bool isCircle;

  @override
  State<AppShimmer> createState() => _AppShimmerState();
}

class _AppShimmerState extends State<AppShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _ctrl;
  late Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1400),
    )..repeat();
    _anim = Tween<double>(begin: -2, end: 2).animate(
      CurvedAnimation(parent: _ctrl, curve: Curves.easeInOutSine),
    );
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;

    final baseColor = isDark ? c.surface2 : c.neutral200;
    final shimmerColor = isDark ? c.surface3 : c.neutral100;

    return AnimatedBuilder(
      animation: _anim,
      builder: (ctx, _) {
        return Container(
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
            shape: widget.isCircle ? BoxShape.circle : BoxShape.rectangle,
            borderRadius: widget.isCircle
                ? null
                : BorderRadius.circular(
                    widget.borderRadius ?? AppConstants.radiusMd),
            gradient: LinearGradient(
              begin: Alignment(_anim.value - 1, 0),
              end: Alignment(_anim.value + 1, 0),
              colors: [baseColor, shimmerColor, baseColor],
              stops: const [0.0, 0.5, 1.0],
            ),
          ),
        );
      },
    );
  }
}

// ── Full-screen loading overlay ───────────────────────────────

class AppLoadingOverlay extends StatelessWidget {
  const AppLoadingOverlay({super.key, this.message});

  final String? message;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;

    return Container(
      color: Colors.black.withValues(alpha: 0.4),
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: isDark ? c.surface : Colors.white,
          borderRadius: BorderRadius.circular(AppConstants.radius2xl),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const AppLoader(size: AppLoaderSize.lg),
            if (message != null) ...[
              const SizedBox(height: 16),
              Text(
                message!,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: c.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ],
        ),
      ),
    );
  }
}
