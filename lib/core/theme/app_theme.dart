import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';
import 'app_typography.dart';
import 'app_theme_extensions.dart';

/// Splity's Material 3 theme — light and dark variants.
///
/// Usage in MaterialApp:
/// ```dart
/// MaterialApp(
///   theme: AppTheme.light,
///   darkTheme: AppTheme.dark,
///   themeMode: ThemeMode.system,
/// )
/// ```
abstract class AppTheme {
  static ThemeData get light => _build(Brightness.light);
  static ThemeData get dark => _build(Brightness.dark);

  static ThemeData _build(Brightness brightness) {
    final isDark = brightness == Brightness.dark;
    final scheme = isDark ? _darkScheme : _lightScheme;

    final bodyColor = isDark ? AppColors.neutral50 : AppColors.neutral900;
    final displayColor = isDark ? AppColors.neutral50 : AppColors.neutral900;

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,

      // ── Typography ─────────────────────────────────────────
      textTheme: AppTypography.textTheme.apply(
        bodyColor: bodyColor,
        displayColor: displayColor,
      ),
      primaryTextTheme: AppTypography.textTheme.apply(
        bodyColor: AppColors.white,
        displayColor: AppColors.white,
      ),

      // ── Scaffold ───────────────────────────────────────────
      scaffoldBackgroundColor:
          isDark ? AppColors.darkBackground : AppColors.neutral50,

      // ── AppBar ─────────────────────────────────────────────
      appBarTheme: AppBarTheme(
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor:
            isDark ? AppColors.darkSurface : AppColors.white,
        foregroundColor: bodyColor,
        centerTitle: false,
        systemOverlayStyle: (isDark
                ? SystemUiOverlayStyle.light
                : SystemUiOverlayStyle.dark)
            .copyWith(statusBarColor: Colors.transparent),
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          color: bodyColor,
        ),
        iconTheme: IconThemeData(
          color: isDark ? AppColors.neutral200 : AppColors.neutral700,
          size: 24,
        ),
      ),

      // ── Card ───────────────────────────────────────────────
      cardTheme: CardThemeData(
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
          side: BorderSide(
            color: isDark ? AppColors.darkSurface2 : AppColors.neutral200,
            width: 1,
          ),
        ),
        color: isDark ? AppColors.darkSurface : AppColors.white,
        clipBehavior: Clip.antiAlias,
      ),

      // ── Divider ────────────────────────────────────────────
      dividerTheme: DividerThemeData(
        color: isDark ? AppColors.darkSurface2 : AppColors.neutral200,
        thickness: 1,
        space: 1,
      ),

      // ── Bottom Navigation Bar ──────────────────────────────
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor:
            isDark ? AppColors.darkSurface : AppColors.white,
        selectedItemColor: isDark
            ? AppColors.primary400
            : AppColors.primary600,
        unselectedItemColor:
            isDark ? AppColors.neutral500 : AppColors.neutral400,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        selectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w500,
        ),
      ),

      // ── NavigationBar (M3) ─────────────────────────────────
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor:
            isDark ? AppColors.darkSurface : AppColors.white,
        indicatorColor: isDark
            ? AppColors.primary900
            : AppColors.primary100,
        iconTheme: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return IconThemeData(
              color: isDark ? AppColors.primary300 : AppColors.primary700,
              size: 22,
            );
          }
          return IconThemeData(
            color: isDark ? AppColors.neutral500 : AppColors.neutral400,
            size: 22,
          );
        }),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return GoogleFonts.plusJakartaSans(
            fontSize: 11,
            fontWeight: selected ? FontWeight.w600 : FontWeight.w500,
            color: selected
                ? (isDark ? AppColors.primary300 : AppColors.primary700)
                : (isDark ? AppColors.neutral500 : AppColors.neutral400),
          );
        }),
        elevation: 0,
        height: 72,
      ),

      // ── Input Decoration ───────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: isDark ? AppColors.darkSurface2 : AppColors.white,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkSurface3 : AppColors.neutral200,
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isDark ? AppColors.darkSurface3 : AppColors.neutral200,
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(
            color: isDark ? AppColors.primary400 : AppColors.primary600,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.error500,
            width: 1.5,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(
            color: AppColors.error500,
            width: 2,
          ),
        ),
        hintStyle: GoogleFonts.plusJakartaSans(
          fontSize: 15,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.neutral600 : AppColors.neutral400,
        ),
        labelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.neutral400 : AppColors.neutral500,
        ),
        floatingLabelStyle: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isDark ? AppColors.primary400 : AppColors.primary600,
        ),
        errorStyle: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          color: AppColors.error500,
        ),
      ),

      // ── Elevated Button (fallback) ─────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: isDark ? AppColors.primary500 : AppColors.primary600,
          foregroundColor: AppColors.white,
          elevation: 0,
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        ),
      ),

      // ── Text Button (fallback) ─────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor:
              isDark ? AppColors.primary400 : AppColors.primary600,
          shape: const StadiumBorder(),
          textStyle: GoogleFonts.plusJakartaSans(
            fontSize: 15,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),

      // ── Chip ───────────────────────────────────────────────
      chipTheme: ChipThemeData(
        backgroundColor:
            isDark ? AppColors.darkSurface2 : AppColors.neutral100,
        selectedColor: isDark ? AppColors.primary900 : AppColors.primary100,
        disabledColor:
            isDark ? AppColors.darkSurface3 : AppColors.neutral200,
        labelStyle: GoogleFonts.plusJakartaSans(fontSize: 13, fontWeight: FontWeight.w500),
        shape: const StadiumBorder(),
        side: BorderSide.none,
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      ),

      // ── Dialog ─────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor:
            isDark ? AppColors.darkSurface : AppColors.white,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        titleTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.2,
          color: bodyColor,
        ),
        contentTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: isDark ? AppColors.neutral400 : AppColors.neutral500,
        ),
      ),

      // ── Bottom Sheet ───────────────────────────────────────
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor:
            isDark ? AppColors.darkSurface : AppColors.white,
        elevation: 0,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
        ),
        showDragHandle: true,
        dragHandleColor:
            isDark ? AppColors.neutral600 : AppColors.neutral300,
        dragHandleSize: const Size(40, 4),
      ),

      // ── SnackBar ───────────────────────────────────────────
      snackBarTheme: SnackBarThemeData(
        backgroundColor:
            isDark ? AppColors.neutral800 : AppColors.neutral900,
        contentTextStyle: GoogleFonts.plusJakartaSans(
          fontSize: 13,
          fontWeight: FontWeight.w400,
          color: AppColors.neutral50,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
      ),

      // ── Switch ─────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) return AppColors.white;
          return isDark ? AppColors.neutral500 : AppColors.neutral300;
        }),
        trackColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return isDark ? AppColors.primary500 : AppColors.primary600;
          }
          return isDark ? AppColors.darkSurface3 : AppColors.neutral200;
        }),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),

      // ── Checkbox ───────────────────────────────────────────
      checkboxTheme: CheckboxThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return isDark ? AppColors.primary500 : AppColors.primary600;
          }
          return Colors.transparent;
        }),
        checkColor: WidgetStateProperty.all(AppColors.white),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        side: BorderSide(
          color: isDark ? AppColors.neutral600 : AppColors.neutral300,
          width: 1.5,
        ),
      ),

      // ── Radio ──────────────────────────────────────────────
      radioTheme: RadioThemeData(
        fillColor: WidgetStateProperty.resolveWith((states) {
          if (states.contains(WidgetState.selected)) {
            return isDark ? AppColors.primary400 : AppColors.primary600;
          }
          return isDark ? AppColors.neutral600 : AppColors.neutral300;
        }),
      ),

      // ── Floating Action Button ─────────────────────────────
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor:
            isDark ? AppColors.primary500 : AppColors.primary600,
        foregroundColor: AppColors.white,
        elevation: 0,
        shape: const CircleBorder(),
      ),

      // ── Custom extensions ──────────────────────────────────
      extensions: [
        isDark ? AppColorExtension.dark : AppColorExtension.light,
      ],
    );
  }

  // ─────────────────────────────────────────────────────────────
  //  COLOR SCHEMES
  // ─────────────────────────────────────────────────────────────

  static const ColorScheme _lightScheme = ColorScheme.light(
    primary: AppColors.primary600,
    onPrimary: AppColors.white,
    primaryContainer: AppColors.primary100,
    onPrimaryContainer: AppColors.primary900,
    primaryFixed: AppColors.primary50,
    primaryFixedDim: AppColors.primary200,
    secondary: AppColors.primary500,
    onSecondary: AppColors.white,
    secondaryContainer: AppColors.primary50,
    onSecondaryContainer: AppColors.primary800,
    tertiary: AppColors.info500,
    onTertiary: AppColors.white,
    tertiaryContainer: AppColors.info50,
    onTertiaryContainer: AppColors.info900,
    error: AppColors.error600,
    onError: AppColors.white,
    errorContainer: AppColors.error50,
    onErrorContainer: AppColors.error800,
    surface: AppColors.white,
    onSurface: AppColors.neutral900,
    surfaceContainerLowest: AppColors.neutral50,
    surfaceContainerLow: AppColors.neutral100,
    surfaceContainer: AppColors.neutral100,
    surfaceContainerHigh: AppColors.neutral200,
    surfaceContainerHighest: AppColors.neutral200,
    onSurfaceVariant: AppColors.neutral500,
    outline: AppColors.neutral300,
    outlineVariant: AppColors.neutral200,
    shadow: Color(0x1A000000),
    scrim: Color(0x80000000),
    inverseSurface: AppColors.neutral900,
    onInverseSurface: AppColors.neutral50,
    inversePrimary: AppColors.primary200,
  );

  static const ColorScheme _darkScheme = ColorScheme.dark(
    primary: AppColors.primary400,
    onPrimary: AppColors.neutral900,
    primaryContainer: AppColors.primary800,
    onPrimaryContainer: AppColors.primary100,
    primaryFixed: AppColors.primary900,
    primaryFixedDim: AppColors.primary700,
    secondary: AppColors.primary300,
    onSecondary: AppColors.neutral900,
    secondaryContainer: AppColors.primary900,
    onSecondaryContainer: AppColors.primary100,
    tertiary: AppColors.info400,
    onTertiary: AppColors.neutral900,
    tertiaryContainer: AppColors.info900,
    onTertiaryContainer: AppColors.info100,
    error: AppColors.error400,
    onError: AppColors.neutral900,
    errorContainer: AppColors.error900,
    onErrorContainer: AppColors.error200,
    surface: AppColors.darkSurface,
    onSurface: AppColors.neutral50,
    surfaceContainerLowest: AppColors.darkBackground,
    surfaceContainerLow: AppColors.darkSurface,
    surfaceContainer: AppColors.darkSurface2,
    surfaceContainerHigh: AppColors.darkSurface3,
    surfaceContainerHighest: AppColors.darkSurface4,
    onSurfaceVariant: AppColors.neutral400,
    outline: AppColors.darkSurface3,
    outlineVariant: AppColors.darkSurface2,
    shadow: Color(0x40000000),
    scrim: Color(0x80000000),
    inverseSurface: AppColors.neutral100,
    onInverseSurface: AppColors.neutral800,
    inversePrimary: AppColors.primary600,
  );
}
