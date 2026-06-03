import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Splity typography system using Inter font.
/// Maps to Material 3's complete TextTheme scale.
abstract class AppTypography {
  /// Returns the complete Inter-based TextTheme.
  /// Apply `.apply(bodyColor: ..., displayColor: ...)` when building ThemeData.
  static TextTheme get textTheme => TextTheme(
        // ── Display ─────────────────────────────────
        displayLarge: GoogleFonts.plusJakartaSans(
          fontSize: 57,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.25,
          height: 1.12,
        ),
        displayMedium: GoogleFonts.plusJakartaSans(
          fontSize: 45,
          fontWeight: FontWeight.w300,
          letterSpacing: -0.15,
          height: 1.15,
        ),
        displaySmall: GoogleFonts.plusJakartaSans(
          fontSize: 36,
          fontWeight: FontWeight.w400,
          height: 1.22,
        ),

        // ── Headline ────────────────────────────────
        headlineLarge: GoogleFonts.plusJakartaSans(
          fontSize: 32,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
          height: 1.25,
        ),
        headlineMedium: GoogleFonts.plusJakartaSans(
          fontSize: 28,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.4,
          height: 1.28,
        ),
        headlineSmall: GoogleFonts.plusJakartaSans(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.3,
          height: 1.3,
        ),

        // ── Title ───────────────────────────────────
        titleLarge: GoogleFonts.plusJakartaSans(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          height: 1.35,
        ),
        titleMedium: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.1,
          height: 1.4,
        ),
        titleSmall: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          letterSpacing: 0,
          height: 1.42,
        ),

        // ── Body ────────────────────────────────────
        bodyLarge: GoogleFonts.plusJakartaSans(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
          height: 1.5,
        ),
        bodyMedium: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.1,
          height: 1.5,
        ),
        bodySmall: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.2,
          height: 1.5,
        ),

        // ── Label ───────────────────────────────────
        labelLarge: GoogleFonts.plusJakartaSans(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.1,
          height: 1.42,
        ),
        labelMedium: GoogleFonts.plusJakartaSans(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
          height: 1.33,
        ),
        labelSmall: GoogleFonts.plusJakartaSans(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.4,
          height: 1.45,
        ),
      );
}
