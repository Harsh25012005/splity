import 'package:flutter/material.dart';
import '../../../core/theme/app_theme_extensions.dart';

// ══════════════════════════════════════════════════════════════
//  AppCard — container with fully-rounded corners
//
//  Variants:  elevated | outlined | filled
// ══════════════════════════════════════════════════════════════

enum AppCardVariant { elevated, outlined, filled }

class AppCard extends StatelessWidget {
  const AppCard({
    super.key,
    required this.child,
    this.variant = AppCardVariant.elevated,
    this.padding,
    this.onTap,
    this.borderRadius,
    this.color,
  });

  final Widget child;
  final AppCardVariant variant;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final double? borderRadius;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    final radius = borderRadius ?? 28.0;

    late Color bg;
    Color? border;
    List<BoxShadow>? shadows;

    switch (variant) {
      case AppCardVariant.elevated:
        bg = color ?? (isDark ? c.surface : c.surface);
        border = isDark ? c.border : c.neutral200;
        shadows = null;

      case AppCardVariant.outlined:
        bg = color ?? (isDark ? c.surface : c.surface);
        border = isDark ? c.border : c.neutral200;

      case AppCardVariant.filled:
        bg = color ?? (isDark ? c.surface2 : c.neutral100);
    }

    Widget card = Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(radius),
        border: border != null
            ? Border.all(color: border, width: 1)
            : null,
        boxShadow: shadows,
      ),
      clipBehavior: Clip.antiAlias,
      child: padding != null
          ? Padding(padding: padding!, child: child)
          : child,
    );

    if (onTap != null) {
      card = Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(radius),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(radius),
          splashColor: c.primary600.withValues(alpha: 0.06),
          highlightColor: c.primary600.withValues(alpha: 0.03),
          child: card,
        ),
      );
    }

    return card;
  }
}
