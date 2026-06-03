import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme_extensions.dart';

// ══════════════════════════════════════════════════════════════
//  AppBottomSheet — draggable bottom sheet wrapper
// ══════════════════════════════════════════════════════════════

class AppBottomSheet extends StatelessWidget {
  const AppBottomSheet({
    super.key,
    required this.child,
    this.title,
    this.subtitle,
    this.leadingAction,
    this.trailingAction,
    this.padding,
    this.maxHeightFraction = 0.92,
    this.minHeightFraction,
    this.showDragHandle = true,
    this.isScrollable = true,
  });

  final Widget child;
  final String? title;
  final String? subtitle;
  final Widget? leadingAction;
  final Widget? trailingAction;
  final EdgeInsetsGeometry? padding;
  /// Max height as fraction of screen height (0.0–1.0)
  final double maxHeightFraction;
  final double? minHeightFraction;
  final bool showDragHandle;
  final bool isScrollable;

  /// Show a standard bottom sheet. [builder] receives the sheet context.
  static Future<T?> show<T>(
    BuildContext context, {
    required Widget child,
    String? title,
    String? subtitle,
    Widget? trailingAction,
    EdgeInsetsGeometry? padding,
    double maxHeightFraction = 0.92,
    bool isScrollable = true,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    return showModalBottomSheet<T>(
      context: context,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      showDragHandle: false,
      backgroundColor: Colors.transparent,
      builder: (_) => AppBottomSheet(
        title: title,
        subtitle: subtitle,
        trailingAction: trailingAction,
        padding: padding,
        maxHeightFraction: maxHeightFraction,
        isScrollable: isScrollable,
        child: child,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    final screenHeight = MediaQuery.of(context).size.height;
    final bottomPadding = MediaQuery.of(context).viewInsets.bottom;

    final hasHeader = title != null || leadingAction != null || trailingAction != null;

    Widget content = Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // ── Drag handle ──────────────────────────────────────
        if (showDragHandle) ...[
          const SizedBox(height: 12),
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? c.neutral600 : c.neutral300,
                borderRadius: BorderRadius.circular(AppConstants.radiusFull),
              ),
            ),
          ),
          const SizedBox(height: 8),
        ],

        // ── Header row ───────────────────────────────────────
        if (hasHeader)
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 8, 20, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (leadingAction != null) ...[
                  leadingAction!,
                  const SizedBox(width: 12),
                ],
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (title != null)
                        Text(
                          title!,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.2,
                            color: c.textPrimary,
                          ),
                        ),
                      if (subtitle != null) ...[
                        const SizedBox(height: 2),
                        Text(
                          subtitle!,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                            color: c.textSecondary,
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
                if (trailingAction != null) ...[
                  const SizedBox(width: 12),
                  trailingAction!,
                ],
              ],
            ),
          ),

        const SizedBox(height: 16),

        // ── Body ─────────────────────────────────────────────
        isScrollable
            ? Flexible(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  padding: padding ??
                      EdgeInsets.fromLTRB(
                          20, 0, 20, bottomPadding + 24),
                  child: child,
                ),
              )
            : Padding(
                padding: padding ??
                    EdgeInsets.fromLTRB(20, 0, 20, bottomPadding + 24),
                child: child,
              ),
      ],
    );

    return Container(
      constraints: BoxConstraints(
        maxHeight: screenHeight * maxHeightFraction,
        minHeight: minHeightFraction != null
            ? screenHeight * minHeightFraction!
            : 0,
      ),
      decoration: BoxDecoration(
        color: isDark ? c.surface : Colors.white,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(28.0),
        ),
      ),
      child: content,
    );
  }
}
