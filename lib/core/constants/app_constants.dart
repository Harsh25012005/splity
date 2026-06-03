import 'package:flutter/material.dart';

/// Design system constants for Splity.
/// All sizing, spacing, radii, and animation values live here.
abstract class AppConstants {
  // ─────────────────── BORDER RADII ───────────────────
  static const double radiusNone = 0;
  static const double radiusXs = 4;
  static const double radiusSm = 8;
  static const double radiusMd = 12;
  static const double radiusLg = 16;
  static const double radiusXl = 20;
  static const double radius2xl = 24;
  static const double radius3xl = 32;
  /// Fully rounded — use for buttons, chips, badges, pills
  static const double radiusFull = 999;

  // ─────────────────── SPACING ───────────────────
  static const double sp2 = 2;
  static const double sp4 = 4;
  static const double sp6 = 6;
  static const double sp8 = 8;
  static const double sp10 = 10;
  static const double sp12 = 12;
  static const double sp14 = 14;
  static const double sp16 = 16;
  static const double sp20 = 20;
  static const double sp24 = 24;
  static const double sp28 = 28;
  static const double sp32 = 32;
  static const double sp40 = 40;
  static const double sp48 = 48;
  static const double sp56 = 56;
  static const double sp64 = 64;

  // ─────────────────── ICON SIZES ───────────────────
  static const double iconXs = 14;
  static const double iconSm = 16;
  static const double iconMd = 20;
  static const double iconLg = 24;
  static const double iconXl = 32;

  // ─────────────────── BUTTON ───────────────────
  static const double buttonHeightSm = 36;
  static const double buttonHeightMd = 44;
  static const double buttonHeightLg = 52;

  // ─────────────────── AVATAR ───────────────────
  static const double avatarXs = 24;
  static const double avatarSm = 32;
  static const double avatarMd = 40;
  static const double avatarLg = 56;
  static const double avatarXl = 72;

  // ─────────────────── ANIMATION ───────────────────
  static const Duration durationFast = Duration(milliseconds: 150);
  static const Duration durationNormal = Duration(milliseconds: 250);
  static const Duration durationSlow = Duration(milliseconds: 400);
  static const Duration durationVerySlow = Duration(milliseconds: 600);

  static const Curve curveDefault = Curves.easeInOut;
  static const Curve curveOut = Curves.easeOut;
  static const Curve curveIn = Curves.easeIn;
  static const Curve curveSpring = Curves.elasticOut;

  // ─────────────────── ELEVATION ───────────────────
  static const double elevationNone = 0;
  static const double elevationSm = 2;
  static const double elevationMd = 4;
  static const double elevationLg = 8;
  static const double elevationXl = 16;

  // ─────────────────── BORDER WIDTH ───────────────────
  static const double borderThin = 1;
  static const double borderNormal = 1.5;
  static const double borderThick = 2;
}
