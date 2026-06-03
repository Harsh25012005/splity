import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/theme/app_theme_extensions.dart';

// ══════════════════════════════════════════════════════════════
//  AppAvatar — circular avatar for users
//
//  Types:  image | initials
//  Sizes:  xs (24) | sm (32) | md (40) | lg (56) | xl (72)
// ══════════════════════════════════════════════════════════════

enum AppAvatarSize { xs, sm, md, lg, xl }

class AppAvatar extends StatelessWidget {
  const AppAvatar({
    super.key,
    this.imageUrl,
    this.name,
    this.size = AppAvatarSize.md,
    this.backgroundColor,
    this.onTap,
    this.showBorder = false,
  });

  final String? imageUrl;
  /// Used for initials fallback (takes first 2 chars / initials from words)
  final String? name;
  final AppAvatarSize size;
  final Color? backgroundColor;
  final VoidCallback? onTap;
  final bool showBorder;

  double get _dimension => switch (size) {
        AppAvatarSize.xs => AppConstants.avatarXs,
        AppAvatarSize.sm => AppConstants.avatarSm,
        AppAvatarSize.md => AppConstants.avatarMd,
        AppAvatarSize.lg => AppConstants.avatarLg,
        AppAvatarSize.xl => AppConstants.avatarXl,
      };

  double get _fontSize => switch (size) {
        AppAvatarSize.xs => 9,
        AppAvatarSize.sm => 12,
        AppAvatarSize.md => 15,
        AppAvatarSize.lg => 20,
        AppAvatarSize.xl => 26,
      };

  String _initials() {
    if (name == null || name!.trim().isEmpty) return '?';
    final words = name!.trim().split(RegExp(r'\s+'));
    if (words.length == 1) {
      return words[0].substring(0, words[0].length.clamp(1, 2)).toUpperCase();
    }
    return '${words[0][0]}${words[1][0]}'.toUpperCase();
  }

  /// Generate a consistent color from the name string
  Color _colorFromName(BuildContext context) {
    if (name == null) return context.appColors.primary600;
    const seeds = [
      Color(0xFF4F46E5), // indigo
      Color(0xFF059669), // emerald
      Color(0xFF0284C7), // sky
      Color(0xFFD97706), // amber
      Color(0xFFE11D48), // rose
      Color(0xFFC026D3), // fuchsia
      Color(0xFF16A34A), // green
      Color(0xFF9333EA), // purple
    ];
    final hash = name!.codeUnits.fold(0, (a, b) => a + b);
    return seeds[hash % seeds.length];
  }

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    final d = _dimension;
    final bgColor = backgroundColor ?? _colorFromName(context);

    Widget content;
    if (imageUrl != null && imageUrl!.isNotEmpty) {
      content = Image.network(
        imageUrl!,
        width: d,
        height: d,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) => _initialsWidget(bgColor),
        loadingBuilder: (ctx, child, progress) {
          if (progress == null) return child;
          return _shimmerWidget(context);
        },
      );
    } else {
      content = _initialsWidget(bgColor);
    }

    Widget avatar = Container(
      width: d,
      height: d,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: showBorder
            ? Border.all(
                color: isDark ? c.surface2 : Colors.white,
                width: size == AppAvatarSize.xs || size == AppAvatarSize.sm
                    ? 2
                    : 3,
              )
            : null,
      ),
      child: ClipOval(child: content),
    );

    if (onTap != null) {
      avatar = GestureDetector(onTap: onTap, child: avatar);
    }

    return avatar;
  }

  Widget _initialsWidget(Color bgColor) {
    return Container(
      color: bgColor,
      alignment: Alignment.center,
      child: Text(
        _initials(),
        style: GoogleFonts.plusJakartaSans(
          fontSize: _fontSize,
          fontWeight: FontWeight.w700,
          color: Colors.white,
          height: 1,
        ),
      ),
    );
  }

  Widget _shimmerWidget(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    return Container(
      color: isDark ? c.surface3 : c.neutral200,
    );
  }
}

// ══════════════════════════════════════════════════════════════
//  AppAvatarGroup — overlapping avatar stack
// ══════════════════════════════════════════════════════════════

class AppAvatarGroup extends StatelessWidget {
  const AppAvatarGroup({
    super.key,
    required this.names,
    this.imageUrls,
    this.size = AppAvatarSize.sm,
    this.maxVisible = 4,
  });

  final List<String> names;
  final List<String?>? imageUrls;
  final AppAvatarSize size;
  final int maxVisible;

  double get _dimension => switch (size) {
        AppAvatarSize.xs => AppConstants.avatarXs,
        AppAvatarSize.sm => AppConstants.avatarSm,
        AppAvatarSize.md => AppConstants.avatarMd,
        AppAvatarSize.lg => AppConstants.avatarLg,
        AppAvatarSize.xl => AppConstants.avatarXl,
      };

  double get _overlap => _dimension * 0.35;

  @override
  Widget build(BuildContext context) {
    final c = context.appColors;
    final isDark = context.isDark;
    final visible = names.take(maxVisible).toList();
    final overflow = names.length - maxVisible;

    return SizedBox(
      height: _dimension,
      width: visible.length * (_dimension - _overlap) +
          _overlap +
          (overflow > 0 ? (_dimension - _overlap) + _overlap : 0),
      child: Stack(
        children: [
          for (int i = 0; i < visible.length; i++)
            Positioned(
              left: i * (_dimension - _overlap),
              child: AppAvatar(
                name: visible[i],
                imageUrl: imageUrls?.elementAtOrNull(i),
                size: size,
                showBorder: true,
              ),
            ),
          if (overflow > 0)
            Positioned(
              left: visible.length * (_dimension - _overlap),
              child: Container(
                width: _dimension,
                height: _dimension,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: isDark ? c.surface3 : c.neutral200,
                  border: Border.all(
                    color: isDark ? c.surface2 : Colors.white,
                    width: 2,
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  '+$overflow',
                  style: GoogleFonts.plusJakartaSans(
                    fontSize: _dimension * 0.28,
                    fontWeight: FontWeight.w700,
                    color: isDark ? c.neutral300 : c.neutral600,
                    height: 1,
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
