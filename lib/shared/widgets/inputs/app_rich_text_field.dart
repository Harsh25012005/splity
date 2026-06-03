import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_theme_extensions.dart';

// ══════════════════════════════════════════════════════════════
//  AppRichTextField — text input with highlight styling and toolbar
// ══════════════════════════════════════════════════════════════

class AppRichTextField extends StatefulWidget {
  const AppRichTextField({
    super.key,
    this.controller,
    this.label,
    this.hint = 'Write rich content, use #tags or @mentions...',
    this.enabled = true,
    this.minLines = 4,
    this.maxLines = 10,
    this.onChanged,
  });

  final TextEditingController? controller;
  final String? label;
  final String hint;
  final bool enabled;
  final int minLines;
  final int maxLines;
  final ValueChanged<String>? onChanged;

  @override
  State<AppRichTextField> createState() => _AppRichTextFieldState();
}

class _AppRichTextFieldState extends State<AppRichTextField> {
  late RichTextEditingController _controller;
  late FocusNode _focusNode;
  bool _isFocused = false;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();
    _focusNode.addListener(() => setState(() => _isFocused = _focusNode.hasFocus));
    _controller = RichTextEditingController(
      controller: widget.controller,
    );
  }

  @override
  void dispose() {
    _focusNode.dispose();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    
    final borderColor = !widget.enabled
        ? (isDark ? c.surface3 : c.neutral200)
        : (_isFocused
            ? (isDark ? c.primary400 : c.primary600)
            : (isDark ? c.surface3 : c.neutral200));

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (widget.label != null) ...[
          Text(
            widget.label!,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: _isFocused
                  ? (isDark ? c.primary400 : c.primary600)
                  : (isDark ? c.neutral300 : c.neutral700),
            ),
          ),
          const SizedBox(height: AppConstants.sp8),
        ],

        // ── Main Card Containing Editor & Toolbar ──────────────────
        AnimatedContainer(
          duration: AppConstants.durationFast,
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28.0),
            color: !widget.enabled
                ? (isDark ? c.surface3 : c.neutral100)
                : (isDark ? c.surface2 : c.surface),
            border: Border.all(color: borderColor, width: _isFocused ? 1.5 : 1.0),
            boxShadow: null,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // ── Input area ────────────────────────────────────────
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: TextField(
                  controller: _controller,
                  focusNode: _focusNode,
                  enabled: widget.enabled,
                  maxLines: widget.maxLines,
                  minLines: widget.minLines,
                  keyboardType: TextInputType.multiline,
                  textInputAction: TextInputAction.newline,
                  onChanged: widget.onChanged,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 14,
                    color: widget.enabled
                        ? (isDark ? c.neutral50 : c.neutral900)
                        : c.textDisabled,
                    height: 1.5,
                  ),
                  decoration: InputDecoration(
                    hintText: widget.hint,
                    hintStyle: GoogleFonts.plusJakartaSans(
                      fontSize: 14,
                      color: isDark ? c.neutral600 : c.neutral400,
                    ),
                    filled: false,
                    contentPadding: EdgeInsets.zero,
                    border: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    focusedErrorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

// ── Custom controller for syntax highlighting ──────────────────
class RichTextEditingController extends TextEditingController {
  RichTextEditingController({TextEditingController? controller})
      : super(text: controller?.text);

  @override
  TextSpan buildTextSpan({
    required BuildContext context,
    TextStyle? style,
    required bool withComposing,
  }) {
    final List<TextSpan> children = [];
    final c = context.appColors;
    final isDark = context.isDark;

    // Rules for styling text
    final primaryColor = isDark ? c.primary400 : c.primary600;
    final mentionColor = isDark ? c.info400 : c.info600;
    final tagColor = isDark ? AppColors.success400 : AppColors.success600;
    
    // Regular expression matching:
    // Group 1: Mentions (@username)
    // Group 2: Tags (#tag)
    // Group 3: Links (http/https/www)
    final regex = RegExp(r'(@\w+)|(#\w+)|(https?:\/\/[^\s]+|www\.[^\s]+)');
    text.splitMapJoin(
      regex,
      onMatch: (Match match) {
        final String matchText = match[0]!;
        TextStyle matchStyle;

        if (matchText.startsWith('@')) {
          matchStyle = style?.copyWith(color: mentionColor, fontWeight: FontWeight.w600) ??
              TextStyle(color: mentionColor, fontWeight: FontWeight.w600);
        } else if (matchText.startsWith('#')) {
          matchStyle = style?.copyWith(color: tagColor, fontWeight: FontWeight.w600) ??
              TextStyle(color: tagColor, fontWeight: FontWeight.w600);
        } else {
          matchStyle = style?.copyWith(
                color: primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: primaryColor,
              ) ??
              TextStyle(
                color: primaryColor,
                decoration: TextDecoration.underline,
                decorationColor: primaryColor,
              );
        }

        children.add(TextSpan(text: matchText, style: matchStyle));
        return matchText;
      },
      onNonMatch: (String nonMatch) {
        children.add(TextSpan(text: nonMatch, style: style));
        return nonMatch;
      },
    );

    return TextSpan(style: style, children: children);
  }
}
