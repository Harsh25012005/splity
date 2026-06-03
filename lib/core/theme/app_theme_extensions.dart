import 'package:flutter/material.dart';
import 'app_colors.dart';

// ═══════════════════════════════════════════════════════════════
//  AppColorExtension — ThemeExtension holding Splity color tokens
//
//  Usage:
//    final colors = context.appColors;
//    colors.primary600, colors.success, colors.surface, etc.
// ═══════════════════════════════════════════════════════════════

@immutable
class AppColorExtension extends ThemeExtension<AppColorExtension> {
  const AppColorExtension({
    // Primary shades
    required this.primary50,
    required this.primary100,
    required this.primary200,
    required this.primary300,
    required this.primary400,
    required this.primary500,
    required this.primary600,
    required this.primary700,
    required this.primary800,
    required this.primary900,
    // Success shades
    required this.success50,
    required this.success100,
    required this.success200,
    required this.success300,
    required this.success400,
    required this.success500,
    required this.success600,
    required this.success700,
    required this.success800,
    required this.success900,
    // Warning shades
    required this.warning50,
    required this.warning100,
    required this.warning200,
    required this.warning300,
    required this.warning400,
    required this.warning500,
    required this.warning600,
    required this.warning700,
    required this.warning800,
    required this.warning900,
    // Error shades
    required this.error50,
    required this.error100,
    required this.error200,
    required this.error300,
    required this.error400,
    required this.error500,
    required this.error600,
    required this.error700,
    required this.error800,
    required this.error900,
    // Info shades
    required this.info50,
    required this.info100,
    required this.info200,
    required this.info300,
    required this.info400,
    required this.info500,
    required this.info600,
    required this.info700,
    required this.info800,
    required this.info900,
    // Neutral shades
    required this.neutral50,
    required this.neutral100,
    required this.neutral200,
    required this.neutral300,
    required this.neutral400,
    required this.neutral500,
    required this.neutral600,
    required this.neutral700,
    required this.neutral800,
    required this.neutral900,
    // Semantic surface tokens
    required this.background,
    required this.surface,
    required this.surface2,
    required this.surface3,
    required this.border,
    required this.borderStrong,
    required this.textPrimary,
    required this.textSecondary,
    required this.textDisabled,
    required this.textInverse,
    required this.textOnPrimary,
  });

  // ── Primary ──────────────────────────────────────────────────
  final Color primary50;
  final Color primary100;
  final Color primary200;
  final Color primary300;
  final Color primary400;
  final Color primary500;
  final Color primary600;
  final Color primary700;
  final Color primary800;
  final Color primary900;

  // ── Success ──────────────────────────────────────────────────
  final Color success50;
  final Color success100;
  final Color success200;
  final Color success300;
  final Color success400;
  final Color success500;
  final Color success600;
  final Color success700;
  final Color success800;
  final Color success900;

  // ── Warning ──────────────────────────────────────────────────
  final Color warning50;
  final Color warning100;
  final Color warning200;
  final Color warning300;
  final Color warning400;
  final Color warning500;
  final Color warning600;
  final Color warning700;
  final Color warning800;
  final Color warning900;

  // ── Error ────────────────────────────────────────────────────
  final Color error50;
  final Color error100;
  final Color error200;
  final Color error300;
  final Color error400;
  final Color error500;
  final Color error600;
  final Color error700;
  final Color error800;
  final Color error900;

  // ── Info ─────────────────────────────────────────────────────
  final Color info50;
  final Color info100;
  final Color info200;
  final Color info300;
  final Color info400;
  final Color info500;
  final Color info600;
  final Color info700;
  final Color info800;
  final Color info900;

  // ── Neutral ──────────────────────────────────────────────────
  final Color neutral50;
  final Color neutral100;
  final Color neutral200;
  final Color neutral300;
  final Color neutral400;
  final Color neutral500;
  final Color neutral600;
  final Color neutral700;
  final Color neutral800;
  final Color neutral900;

  // ── Semantic tokens ──────────────────────────────────────────
  final Color background;
  final Color surface;
  final Color surface2;
  final Color surface3;
  final Color border;
  final Color borderStrong;
  final Color textPrimary;
  final Color textSecondary;
  final Color textDisabled;
  final Color textInverse;
  final Color textOnPrimary;

  // ── Convenience semantic aliases ─────────────────────────────
  /// The default primary brand color (adapts to light/dark)
  Color get primary => primary600;

  /// Default success color
  Color get success => success500;

  /// Default warning color
  Color get warning => warning500;

  /// Default error color
  Color get error => error500;

  /// Default info color
  Color get info => info500;

  // ─────────────────────────────────────────────────────────────
  //  LIGHT preset
  // ─────────────────────────────────────────────────────────────
  static const AppColorExtension light = AppColorExtension(
    // Primary
    primary50: AppColors.primary50,
    primary100: AppColors.primary100,
    primary200: AppColors.primary200,
    primary300: AppColors.primary300,
    primary400: AppColors.primary400,
    primary500: AppColors.primary500,
    primary600: AppColors.primary600,
    primary700: AppColors.primary700,
    primary800: AppColors.primary800,
    primary900: AppColors.primary900,
    // Success
    success50: AppColors.success50,
    success100: AppColors.success100,
    success200: AppColors.success200,
    success300: AppColors.success300,
    success400: AppColors.success400,
    success500: AppColors.success500,
    success600: AppColors.success600,
    success700: AppColors.success700,
    success800: AppColors.success800,
    success900: AppColors.success900,
    // Warning
    warning50: AppColors.warning50,
    warning100: AppColors.warning100,
    warning200: AppColors.warning200,
    warning300: AppColors.warning300,
    warning400: AppColors.warning400,
    warning500: AppColors.warning500,
    warning600: AppColors.warning600,
    warning700: AppColors.warning700,
    warning800: AppColors.warning800,
    warning900: AppColors.warning900,
    // Error
    error50: AppColors.error50,
    error100: AppColors.error100,
    error200: AppColors.error200,
    error300: AppColors.error300,
    error400: AppColors.error400,
    error500: AppColors.error500,
    error600: AppColors.error600,
    error700: AppColors.error700,
    error800: AppColors.error800,
    error900: AppColors.error900,
    // Info
    info50: AppColors.info50,
    info100: AppColors.info100,
    info200: AppColors.info200,
    info300: AppColors.info300,
    info400: AppColors.info400,
    info500: AppColors.info500,
    info600: AppColors.info600,
    info700: AppColors.info700,
    info800: AppColors.info800,
    info900: AppColors.info900,
    // Neutral
    neutral50: AppColors.neutral50,
    neutral100: AppColors.neutral100,
    neutral200: AppColors.neutral200,
    neutral300: AppColors.neutral300,
    neutral400: AppColors.neutral400,
    neutral500: AppColors.neutral500,
    neutral600: AppColors.neutral600,
    neutral700: AppColors.neutral700,
    neutral800: AppColors.neutral800,
    neutral900: AppColors.neutral900,
    // Semantic
    background: AppColors.neutral50,
    surface: AppColors.white,
    surface2: AppColors.neutral100,
    surface3: AppColors.neutral200,
    border: AppColors.neutral200,
    borderStrong: AppColors.neutral300,
    textPrimary: AppColors.neutral900,
    textSecondary: AppColors.neutral500,
    textDisabled: AppColors.neutral400,
    textInverse: AppColors.white,
    textOnPrimary: AppColors.white,
  );

  // ─────────────────────────────────────────────────────────────
  //  DARK preset
  // ─────────────────────────────────────────────────────────────
  static const AppColorExtension dark = AppColorExtension(
    // Primary — same shades, but components pick lighter end
    primary50: AppColors.primary50,
    primary100: AppColors.primary100,
    primary200: AppColors.primary200,
    primary300: AppColors.primary300,
    primary400: AppColors.primary400,
    primary500: AppColors.primary500,
    primary600: AppColors.primary600,
    primary700: AppColors.primary700,
    primary800: AppColors.primary800,
    primary900: AppColors.primary900,
    // Success
    success50: AppColors.success50,
    success100: AppColors.success100,
    success200: AppColors.success200,
    success300: AppColors.success300,
    success400: AppColors.success400,
    success500: AppColors.success500,
    success600: AppColors.success600,
    success700: AppColors.success700,
    success800: AppColors.success800,
    success900: AppColors.success900,
    // Warning
    warning50: AppColors.warning50,
    warning100: AppColors.warning100,
    warning200: AppColors.warning200,
    warning300: AppColors.warning300,
    warning400: AppColors.warning400,
    warning500: AppColors.warning500,
    warning600: AppColors.warning600,
    warning700: AppColors.warning700,
    warning800: AppColors.warning800,
    warning900: AppColors.warning900,
    // Error
    error50: AppColors.error50,
    error100: AppColors.error100,
    error200: AppColors.error200,
    error300: AppColors.error300,
    error400: AppColors.error400,
    error500: AppColors.error500,
    error600: AppColors.error600,
    error700: AppColors.error700,
    error800: AppColors.error800,
    error900: AppColors.error900,
    // Info
    info50: AppColors.info50,
    info100: AppColors.info100,
    info200: AppColors.info200,
    info300: AppColors.info300,
    info400: AppColors.info400,
    info500: AppColors.info500,
    info600: AppColors.info600,
    info700: AppColors.info700,
    info800: AppColors.info800,
    info900: AppColors.info900,
    // Neutral
    neutral50: AppColors.neutral50,
    neutral100: AppColors.neutral100,
    neutral200: AppColors.neutral200,
    neutral300: AppColors.neutral300,
    neutral400: AppColors.neutral400,
    neutral500: AppColors.neutral500,
    neutral600: AppColors.neutral600,
    neutral700: AppColors.neutral700,
    neutral800: AppColors.neutral800,
    neutral900: AppColors.neutral900,
    // Semantic — dark-adapted surfaces
    background: AppColors.darkBackground,
    surface: AppColors.darkSurface,
    surface2: AppColors.darkSurface2,
    surface3: AppColors.darkSurface3,
    border: AppColors.darkSurface2,
    borderStrong: AppColors.darkSurface3,
    textPrimary: AppColors.neutral50,
    textSecondary: AppColors.neutral400,
    textDisabled: AppColors.neutral600,
    textInverse: AppColors.neutral900,
    textOnPrimary: AppColors.white,
  );

  // ─────────────────────────────────────────────────────────────
  //  ThemeExtension overrides
  // ─────────────────────────────────────────────────────────────
  @override
  AppColorExtension copyWith({
    Color? primary50, Color? primary100, Color? primary200, Color? primary300,
    Color? primary400, Color? primary500, Color? primary600, Color? primary700,
    Color? primary800, Color? primary900,
    Color? success50, Color? success100, Color? success200, Color? success300,
    Color? success400, Color? success500, Color? success600, Color? success700,
    Color? success800, Color? success900,
    Color? warning50, Color? warning100, Color? warning200, Color? warning300,
    Color? warning400, Color? warning500, Color? warning600, Color? warning700,
    Color? warning800, Color? warning900,
    Color? error50, Color? error100, Color? error200, Color? error300,
    Color? error400, Color? error500, Color? error600, Color? error700,
    Color? error800, Color? error900,
    Color? info50, Color? info100, Color? info200, Color? info300,
    Color? info400, Color? info500, Color? info600, Color? info700,
    Color? info800, Color? info900,
    Color? neutral50, Color? neutral100, Color? neutral200, Color? neutral300,
    Color? neutral400, Color? neutral500, Color? neutral600, Color? neutral700,
    Color? neutral800, Color? neutral900,
    Color? background, Color? surface, Color? surface2, Color? surface3,
    Color? border, Color? borderStrong,
    Color? textPrimary, Color? textSecondary, Color? textDisabled,
    Color? textInverse, Color? textOnPrimary,
  }) {
    return AppColorExtension(
      primary50: primary50 ?? this.primary50,
      primary100: primary100 ?? this.primary100,
      primary200: primary200 ?? this.primary200,
      primary300: primary300 ?? this.primary300,
      primary400: primary400 ?? this.primary400,
      primary500: primary500 ?? this.primary500,
      primary600: primary600 ?? this.primary600,
      primary700: primary700 ?? this.primary700,
      primary800: primary800 ?? this.primary800,
      primary900: primary900 ?? this.primary900,
      success50: success50 ?? this.success50,
      success100: success100 ?? this.success100,
      success200: success200 ?? this.success200,
      success300: success300 ?? this.success300,
      success400: success400 ?? this.success400,
      success500: success500 ?? this.success500,
      success600: success600 ?? this.success600,
      success700: success700 ?? this.success700,
      success800: success800 ?? this.success800,
      success900: success900 ?? this.success900,
      warning50: warning50 ?? this.warning50,
      warning100: warning100 ?? this.warning100,
      warning200: warning200 ?? this.warning200,
      warning300: warning300 ?? this.warning300,
      warning400: warning400 ?? this.warning400,
      warning500: warning500 ?? this.warning500,
      warning600: warning600 ?? this.warning600,
      warning700: warning700 ?? this.warning700,
      warning800: warning800 ?? this.warning800,
      warning900: warning900 ?? this.warning900,
      error50: error50 ?? this.error50,
      error100: error100 ?? this.error100,
      error200: error200 ?? this.error200,
      error300: error300 ?? this.error300,
      error400: error400 ?? this.error400,
      error500: error500 ?? this.error500,
      error600: error600 ?? this.error600,
      error700: error700 ?? this.error700,
      error800: error800 ?? this.error800,
      error900: error900 ?? this.error900,
      info50: info50 ?? this.info50,
      info100: info100 ?? this.info100,
      info200: info200 ?? this.info200,
      info300: info300 ?? this.info300,
      info400: info400 ?? this.info400,
      info500: info500 ?? this.info500,
      info600: info600 ?? this.info600,
      info700: info700 ?? this.info700,
      info800: info800 ?? this.info800,
      info900: info900 ?? this.info900,
      neutral50: neutral50 ?? this.neutral50,
      neutral100: neutral100 ?? this.neutral100,
      neutral200: neutral200 ?? this.neutral200,
      neutral300: neutral300 ?? this.neutral300,
      neutral400: neutral400 ?? this.neutral400,
      neutral500: neutral500 ?? this.neutral500,
      neutral600: neutral600 ?? this.neutral600,
      neutral700: neutral700 ?? this.neutral700,
      neutral800: neutral800 ?? this.neutral800,
      neutral900: neutral900 ?? this.neutral900,
      background: background ?? this.background,
      surface: surface ?? this.surface,
      surface2: surface2 ?? this.surface2,
      surface3: surface3 ?? this.surface3,
      border: border ?? this.border,
      borderStrong: borderStrong ?? this.borderStrong,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      textDisabled: textDisabled ?? this.textDisabled,
      textInverse: textInverse ?? this.textInverse,
      textOnPrimary: textOnPrimary ?? this.textOnPrimary,
    );
  }

  @override
  AppColorExtension lerp(ThemeExtension<AppColorExtension>? other, double t) {
    if (other is! AppColorExtension) return this;
    Color l(Color a, Color b) => Color.lerp(a, b, t)!;
    return AppColorExtension(
      primary50: l(primary50, other.primary50),
      primary100: l(primary100, other.primary100),
      primary200: l(primary200, other.primary200),
      primary300: l(primary300, other.primary300),
      primary400: l(primary400, other.primary400),
      primary500: l(primary500, other.primary500),
      primary600: l(primary600, other.primary600),
      primary700: l(primary700, other.primary700),
      primary800: l(primary800, other.primary800),
      primary900: l(primary900, other.primary900),
      success50: l(success50, other.success50),
      success100: l(success100, other.success100),
      success200: l(success200, other.success200),
      success300: l(success300, other.success300),
      success400: l(success400, other.success400),
      success500: l(success500, other.success500),
      success600: l(success600, other.success600),
      success700: l(success700, other.success700),
      success800: l(success800, other.success800),
      success900: l(success900, other.success900),
      warning50: l(warning50, other.warning50),
      warning100: l(warning100, other.warning100),
      warning200: l(warning200, other.warning200),
      warning300: l(warning300, other.warning300),
      warning400: l(warning400, other.warning400),
      warning500: l(warning500, other.warning500),
      warning600: l(warning600, other.warning600),
      warning700: l(warning700, other.warning700),
      warning800: l(warning800, other.warning800),
      warning900: l(warning900, other.warning900),
      error50: l(error50, other.error50),
      error100: l(error100, other.error100),
      error200: l(error200, other.error200),
      error300: l(error300, other.error300),
      error400: l(error400, other.error400),
      error500: l(error500, other.error500),
      error600: l(error600, other.error600),
      error700: l(error700, other.error700),
      error800: l(error800, other.error800),
      error900: l(error900, other.error900),
      info50: l(info50, other.info50),
      info100: l(info100, other.info100),
      info200: l(info200, other.info200),
      info300: l(info300, other.info300),
      info400: l(info400, other.info400),
      info500: l(info500, other.info500),
      info600: l(info600, other.info600),
      info700: l(info700, other.info700),
      info800: l(info800, other.info800),
      info900: l(info900, other.info900),
      neutral50: l(neutral50, other.neutral50),
      neutral100: l(neutral100, other.neutral100),
      neutral200: l(neutral200, other.neutral200),
      neutral300: l(neutral300, other.neutral300),
      neutral400: l(neutral400, other.neutral400),
      neutral500: l(neutral500, other.neutral500),
      neutral600: l(neutral600, other.neutral600),
      neutral700: l(neutral700, other.neutral700),
      neutral800: l(neutral800, other.neutral800),
      neutral900: l(neutral900, other.neutral900),
      background: l(background, other.background),
      surface: l(surface, other.surface),
      surface2: l(surface2, other.surface2),
      surface3: l(surface3, other.surface3),
      border: l(border, other.border),
      borderStrong: l(borderStrong, other.borderStrong),
      textPrimary: l(textPrimary, other.textPrimary),
      textSecondary: l(textSecondary, other.textSecondary),
      textDisabled: l(textDisabled, other.textDisabled),
      textInverse: l(textInverse, other.textInverse),
      textOnPrimary: l(textOnPrimary, other.textOnPrimary),
    );
  }
}

// ═══════════════════════════════════════════════════════════════
//  BuildContext extension — convenient access
// ═══════════════════════════════════════════════════════════════

extension AppThemeX on BuildContext {
  /// Access Splity color tokens: `context.appColors.primary600`
  AppColorExtension get appColors =>
      Theme.of(this).extension<AppColorExtension>()!;

  /// true when in dark mode
  bool get isDark => Theme.of(this).brightness == Brightness.dark;

  /// Shortcut to ColorScheme
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  /// Shortcut to TextTheme
  TextTheme get textTheme => Theme.of(this).textTheme;
}
