import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme_extensions.dart';

// ══════════════════════════════════════════════════════════════
//  AppTextField — premium fully-rounded text input
// ══════════════════════════════════════════════════════════════

class AppTextField extends StatefulWidget {
  const AppTextField({
    super.key,
    this.controller,
    this.label,
    this.hint,
    this.helperText,
    this.errorText,
    this.prefixIcon,
    this.suffixIcon,
    this.onSuffixTap,
    this.isPassword = false,
    this.isMultiline = false,
    this.maxLines,
    this.minLines,
    this.enabled = true,
    this.readOnly = false,
    this.keyboardType,
    this.textInputAction,
    this.onChanged,
    this.onSubmitted,
    this.onTap,
    this.focusNode,
    this.autofocus = false,
    this.maxLength,
  });

  final TextEditingController? controller;
  final String? label;
  final String? hint;
  final String? helperText;
  final String? errorText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final VoidCallback? onSuffixTap;
  final bool isPassword;
  final bool isMultiline;
  final int? maxLines;
  final int? minLines;
  final bool enabled;
  final bool readOnly;
  final TextInputType? keyboardType;
  final TextInputAction? textInputAction;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final bool autofocus;
  final int? maxLength;

  @override
  State<AppTextField> createState() => _AppTextFieldState();
}

class _AppTextFieldState extends State<AppTextField> {
  bool _obscureText = true;
  late FocusNode _focusNode;
  late TextEditingController _controller;
  bool _isFocused = false;
  bool _hasText = false;

  @override
  void initState() {
    super.initState();
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_onFocusChange);
    _controller = widget.controller ?? TextEditingController();
    _controller.addListener(_onTextChange);
    _hasText = _controller.text.isNotEmpty;
  }

  @override
  void dispose() {
    if (widget.focusNode == null) _focusNode.dispose();
    if (widget.controller == null) _controller.dispose();
    super.dispose();
  }

  void _onFocusChange() => setState(() => _isFocused = _focusNode.hasFocus);
  void _onTextChange() => setState(() => _hasText = _controller.text.isNotEmpty);

  void _clearText() {
    _controller.clear();
    widget.onChanged?.call('');
    setState(() => _hasText = false);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    final hasError = widget.errorText != null;

    // ── Border colors based on state ───────────────────────
    final Color borderColor;
    if (!widget.enabled) {
      borderColor = isDark ? c.surface3 : c.neutral200;
    } else if (hasError) {
      borderColor = c.error500;
    } else if (_isFocused) {
      borderColor = isDark ? c.primary400 : c.primary600;
    } else {
      borderColor = isDark ? c.surface3 : c.neutral200;
    }

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(AppConstants.radiusFull),
      borderSide: BorderSide.none,
    );

    // ── Suffix widget ───────────────────────────────────────
    Widget? suffix;
    if (widget.isPassword) {
      suffix = GestureDetector(
        onTap: () => setState(() => _obscureText = !_obscureText),
        child: Icon(
          _obscureText ? Iconsax.eye : Iconsax.eye_slash,
          size: AppConstants.iconMd,
          color: isDark ? c.neutral400 : c.neutral500,
        ),
      );
    } else if (widget.enabled && _hasText && _isFocused && !widget.isMultiline) {
      suffix = GestureDetector(
        onTap: _clearText,
        child: Icon(
          Iconsax.close_circle,
          size: AppConstants.iconMd,
          color: isDark ? c.neutral400 : c.neutral500,
        ),
      );
    } else if (widget.suffixIcon != null) {
      suffix = GestureDetector(
        onTap: widget.onSuffixTap,
        child: Icon(
          widget.suffixIcon,
          size: AppConstants.iconMd,
          color: isDark ? c.neutral400 : c.neutral500,
        ),
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        // ── Label row with word counter if applicable ───────
        if (widget.label != null || widget.maxLength != null) ...[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.label != null)
                Text(
                  widget.label!,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    color: hasError
                        ? c.error500
                        : (_isFocused
                            ? (isDark ? c.primary400 : c.primary600)
                            : (isDark ? c.neutral300 : c.neutral700)),
                  ),
                ),
              if (widget.maxLength != null && _isFocused)
                Text(
                  '${_controller.text.length}/${widget.maxLength}',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                    color: isDark ? c.neutral500 : c.neutral400,
                  ),
                ),
            ],
          ),
          const SizedBox(height: AppConstants.sp8),
        ],

        // ── Input field ───────────────────────────────────
        AnimatedContainer(
          duration: AppConstants.durationFast,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppConstants.radiusFull),
            color: !widget.enabled
                ? (isDark ? c.surface3 : c.neutral100)
                : (isDark ? c.surface2.withValues(alpha: 0.7) : c.surface),
            border: Border.all(color: borderColor, width: _isFocused || hasError ? 1.5 : 1.0),
            boxShadow: null,
          ),
          child: TextField(
            controller: _controller,
            focusNode: _focusNode,
            enabled: widget.enabled,
            readOnly: widget.readOnly,
            obscureText: widget.isPassword && _obscureText,
            maxLines: widget.isPassword
                ? 1
                : (widget.isMultiline ? (widget.maxLines ?? 5) : 1),
            minLines: widget.isMultiline ? (widget.minLines ?? 3) : null,
            keyboardType: widget.keyboardType ??
                (widget.isMultiline ? TextInputType.multiline : null),
            textInputAction: widget.textInputAction,
            onChanged: (val) {
              widget.onChanged?.call(val);
              setState(() => _hasText = val.isNotEmpty);
            },
            onSubmitted: widget.onSubmitted,
            onTap: widget.onTap,
            autofocus: widget.autofocus,
            maxLength: widget.maxLength,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: widget.enabled
                  ? (isDark ? c.neutral50 : c.neutral900)
                  : c.textDisabled,
            ),
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: GoogleFonts.plusJakartaSans(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: isDark ? c.neutral600 : c.neutral400,
              ),
              filled: false,
              prefixIcon: widget.prefixIcon != null
                  ? TweenAnimationBuilder<double>(
                      tween: Tween(begin: 1.0, end: _isFocused ? 1.15 : 1.0),
                      duration: AppConstants.durationFast,
                      builder: (context, scale, child) {
                        return Transform.scale(
                          scale: scale,
                          child: child,
                        );
                      },
                      child: Icon(
                        widget.prefixIcon,
                        size: AppConstants.iconMd,
                        color: _isFocused
                            ? (isDark ? c.primary400 : c.primary600)
                            : (isDark ? c.neutral400 : c.neutral500),
                      ),
                    )
                  : null,
              suffixIcon: suffix != null
                  ? Padding(
                      padding: const EdgeInsets.only(right: 14),
                      child: suffix,
                    )
                  : null,
              suffixIconConstraints:
                  const BoxConstraints(minWidth: 40, minHeight: 40),
              prefixIconConstraints:
                  const BoxConstraints(minWidth: 48, minHeight: 48),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 18,
                vertical: 14,
              ),
              border: border,
              enabledBorder: border,
              focusedBorder: border,
              errorBorder: border,
              focusedErrorBorder: border,
              disabledBorder: border,
              counterText: '',
            ),
          ),
        ),

        // ── Helper / Error text ───────────────────────────
        if (widget.errorText != null) ...[
          const SizedBox(height: AppConstants.sp6),
          Row(
            children: [
              Icon(Iconsax.info_circle, size: 14, color: c.error500),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  widget.errorText!,
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: c.error500,
                  ),
                ),
              ),
            ],
          ),
        ] else if (widget.helperText != null) ...[
          const SizedBox(height: AppConstants.sp6),
          Text(
            widget.helperText!,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: isDark ? c.neutral500 : c.neutral400,
            ),
          ),
        ],
      ],
    );
  }
}
