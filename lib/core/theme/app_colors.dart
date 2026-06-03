import 'package:flutter/material.dart';

/// Complete Splity color palette.
/// Each semantic group has 10 shades (50 → 900), following the Tailwind scale.
abstract class AppColors {
  // ═══════════════════════════════════════════════════
  //  PRIMARY — Royal Blue family
  // ═══════════════════════════════════════════════════
  static const Color primary50 = Color(0xFFEEF0FC);
  static const Color primary100 = Color(0xFFD6DBF9);
  static const Color primary200 = Color(0xFFB5BEF5);
  static const Color primary300 = Color(0xFF8B9BEF);
  static const Color primary400 = Color(0xFF6275E9); // ← Accent / Dark mode brand
  static const Color primary500 = Color(0xFF4256E6);
  static const Color primary600 = Color(0xFF2F2FE4); // ← Light mode brand (requested)
  static const Color primary700 = Color(0xFF2626C4);
  static const Color primary800 = Color(0xFF1E1E9E);
  static const Color primary900 = Color(0xFF161678);

  // ═══════════════════════════════════════════════════
  //  SUCCESS — Emerald (money / positive)
  // ═══════════════════════════════════════════════════
  static const Color success50 = Color(0xFFECFDF5);
  static const Color success100 = Color(0xFFD1FAE5);
  static const Color success200 = Color(0xFFA7F3D0);
  static const Color success300 = Color(0xFF6EE7B7);
  static const Color success400 = Color(0xFF34D399);
  static const Color success500 = Color(0xFF10B981);
  static const Color success600 = Color(0xFF059669);
  static const Color success700 = Color(0xFF047857);
  static const Color success800 = Color(0xFF065F46);
  static const Color success900 = Color(0xFF064E3B);

  // ═══════════════════════════════════════════════════
  //  WARNING — Amber (attention / pending)
  // ═══════════════════════════════════════════════════
  static const Color warning50 = Color(0xFFFFFBEB);
  static const Color warning100 = Color(0xFFFEF3C7);
  static const Color warning200 = Color(0xFFFDE68A);
  static const Color warning300 = Color(0xFFFCD34D);
  static const Color warning400 = Color(0xFFFBBF24);
  static const Color warning500 = Color(0xFFF59E0B);
  static const Color warning600 = Color(0xFFD97706);
  static const Color warning700 = Color(0xFFB45309);
  static const Color warning800 = Color(0xFF92400E);
  static const Color warning900 = Color(0xFF78350F);

  // ═══════════════════════════════════════════════════
  //  ERROR — Rose (danger / overdue / declined)
  // ═══════════════════════════════════════════════════
  static const Color error50 = Color(0xFFFFF1F2);
  static const Color error100 = Color(0xFFFFE4E6);
  static const Color error200 = Color(0xFFFECDD3);
  static const Color error300 = Color(0xFFFDA4AF);
  static const Color error400 = Color(0xFFFB7185);
  static const Color error500 = Color(0xFFF43F5E);
  static const Color error600 = Color(0xFFE11D48);
  static const Color error700 = Color(0xFFBE123C);
  static const Color error800 = Color(0xFF9F1239);
  static const Color error900 = Color(0xFF881337);

  // ═══════════════════════════════════════════════════
  //  INFO — Sky (informational / neutral actions)
  // ═══════════════════════════════════════════════════
  static const Color info50 = Color(0xFFF0F9FF);
  static const Color info100 = Color(0xFFE0F2FE);
  static const Color info200 = Color(0xFFBAE6FD);
  static const Color info300 = Color(0xFF7DD3FC);
  static const Color info400 = Color(0xFF38BDF8);
  static const Color info500 = Color(0xFF0EA5E9);
  static const Color info600 = Color(0xFF0284C7);
  static const Color info700 = Color(0xFF0369A1);
  static const Color info800 = Color(0xFF075985);
  static const Color info900 = Color(0xFF0C4A6E);

  // ═══════════════════════════════════════════════════
  //  NEUTRAL — Slate (text, borders, surfaces)
  // ═══════════════════════════════════════════════════
  static const Color neutral50 = Color(0xFFF8FAFC);
  static const Color neutral100 = Color(0xFFF1F5F9);
  static const Color neutral200 = Color(0xFFE2E8F0);
  static const Color neutral300 = Color(0xFFCBD5E1);
  static const Color neutral400 = Color(0xFF94A3B8);
  static const Color neutral500 = Color(0xFF64748B);
  static const Color neutral600 = Color(0xFF475569);
  static const Color neutral700 = Color(0xFF334155);
  static const Color neutral800 = Color(0xFF1E293B);
  static const Color neutral900 = Color(0xFF0F172A);

  // ═══════════════════════════════════════════════════
  //  DARK MODE SURFACES (Royal Blue-tinted dark)
  // ═══════════════════════════════════════════════════
  static const Color darkBackground = Color(0xFF080912);
  static const Color darkSurface = Color(0xFF0F111E);
  static const Color darkSurface2 = Color(0xFF171A2C);
  static const Color darkSurface3 = Color(0xFF20233B);
  static const Color darkSurface4 = Color(0xFF2A2E4C);

  // ═══════════════════════════════════════════════════
  //  MISC
  // ═══════════════════════════════════════════════════
  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color transparent = Color(0x00000000);
}
