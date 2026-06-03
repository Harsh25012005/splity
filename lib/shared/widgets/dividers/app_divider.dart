import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme_extensions.dart';

// ══════════════════════════════════════════════════════════════
//  AppDivider — horizontal and vertical dividers
// ══════════════════════════════════════════════════════════════

class AppDivider extends StatelessWidget {
  const AppDivider({
    super.key,
    this.label,
    this.thickness = 1,
    this.indent = 0,
    this.endIndent = 0,
    this.color,
  });

  final String? label;
  final double thickness;
  final double indent;
  final double endIndent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    final dividerColor = color ?? (isDark ? c.border : c.neutral200);

    if (label == null) {
      return Divider(
        thickness: thickness,
        indent: indent,
        endIndent: endIndent,
        color: dividerColor,
        height: 1,
      );
    }

    // Divider with centered label
    return Row(
      children: [
        if (indent > 0) SizedBox(width: indent),
        Expanded(
          child: Container(
            height: thickness,
            color: dividerColor,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppConstants.sp12),
          child: Text(
            label!,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: isDark ? c.neutral500 : c.neutral400,
              letterSpacing: 0.5,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: thickness,
            color: dividerColor,
          ),
        ),
        if (endIndent > 0) SizedBox(width: endIndent),
      ],
    );
  }
}

// ── Vertical divider ──────────────────────────────────────────

class AppVerticalDivider extends StatelessWidget {
  const AppVerticalDivider({
    super.key,
    this.thickness = 1,
    this.height = double.infinity,
    this.color,
  });

  final double thickness;
  final double height;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    return Container(
      width: thickness,
      height: height,
      color: color ?? (isDark ? c.border : c.neutral200),
    );
  }
}
