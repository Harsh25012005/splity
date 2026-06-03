import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme_extensions.dart';

// ══════════════════════════════════════════════════════════════
//  AppBadge — status indicator pill
//
//  Types:  primary | success | warning | error | info | neutral
//  Sizes:  sm | md
// ══════════════════════════════════════════════════════════════

enum AppBadgeType { primary, success, warning, error, info, neutral }

enum AppBadgeSize { sm, md }

class AppBadge extends StatelessWidget {
  const AppBadge({
    super.key,
    required this.label,
    this.type = AppBadgeType.neutral,
    this.size = AppBadgeSize.md,
    this.leadingDot = false,
    this.icon,
  });

  final String label;
  final AppBadgeType type;
  final AppBadgeSize size;
  /// Shows a colored dot before the label
  final bool leadingDot;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;

    // ── Resolve colors ─────────────────────────────────────
    late Color bg;
    late Color fg;

    switch (type) {
      case AppBadgeType.primary:
        bg = isDark ? c.primary900.withValues(alpha: 0.6) : c.primary100;
        fg = isDark ? c.primary300 : c.primary700;
      case AppBadgeType.success:
        bg = isDark ? c.success900.withValues(alpha: 0.5) : c.success100;
        fg = isDark ? c.success400 : c.success700;
      case AppBadgeType.warning:
        bg = isDark ? c.warning900.withValues(alpha: 0.5) : c.warning100;
        fg = isDark ? c.warning400 : c.warning700;
      case AppBadgeType.error:
        bg = isDark ? c.error900.withValues(alpha: 0.5) : c.error100;
        fg = isDark ? c.error400 : c.error700;
      case AppBadgeType.info:
        bg = isDark ? c.info900.withValues(alpha: 0.5) : c.info100;
        fg = isDark ? c.info400 : c.info700;
      case AppBadgeType.neutral:
        bg = isDark ? c.surface3 : c.neutral100;
        fg = isDark ? c.neutral300 : c.neutral600;
    }

    // ── Sizing ─────────────────────────────────────────────
    final fontSize = size == AppBadgeSize.sm ? 11.0 : 12.0;
    final padding = size == AppBadgeSize.sm
        ? const EdgeInsets.symmetric(horizontal: 8, vertical: 3)
        : const EdgeInsets.symmetric(horizontal: 10, vertical: 4);
    final dotSize = size == AppBadgeSize.sm ? 5.0 : 6.0;
    final iconSize = size == AppBadgeSize.sm ? 11.0 : 13.0;

    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(AppConstants.radiusFull),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (leadingDot) ...[
            Container(
              width: dotSize,
              height: dotSize,
              decoration: BoxDecoration(shape: BoxShape.circle, color: fg),
            ),
            const SizedBox(width: 5),
          ] else if (icon != null) ...[
            Icon(icon, size: iconSize, color: fg),
            const SizedBox(width: 4),
          ],
          Text(
            label,
            style: GoogleFonts.plusJakartaSans(
              fontSize: fontSize,
              fontWeight: FontWeight.w600,
              color: fg,
              letterSpacing: 0.1,
            ),
          ),
        ],
      ),
    );
  }
}
