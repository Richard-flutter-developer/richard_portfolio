import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // ── Core Palette (inspired by Dribbble reference) ──
  static const Color bgPrimary = Color(0xFF0C0D1E);
  static const Color bgSecondary = Color(0xFF111227);
  static const Color bgCard = Color(0xFF151636);
  static const Color bgSurface = Color(0xFF1A1B3A);

  // Accent Colors
  static const Color accentCyan = Color(0xFF0CC0DF);
  static const Color accentMagenta = Color(0xFFE040FB);
  static const Color accentPurple = Color(0xFF7C4DFF);
  static const Color accentBlue = Color(0xFF448AFF);

  // Text
  static const Color textPrimary = Color(0xFFF5F5F7);
  static const Color textSecondary = Color(0xFFA0A1B5);
  static const Color textMuted = Color(0xFF5A5B70);

  // ── Gradients ──
  static const LinearGradient neonGradient = LinearGradient(
    colors: [accentCyan, accentPurple, accentMagenta],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentCyan, accentPurple],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [accentCyan, accentPurple],
  );

  static const LinearGradient cardBorderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [accentCyan, accentPurple, accentMagenta],
  );

  static const LinearGradient subtleGlow = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0x220CC0DF), Color(0x00000000)],
  );

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgPrimary,
      textTheme: GoogleFonts.interTextTheme(ThemeData.dark().textTheme),
      colorScheme: const ColorScheme.dark(
        primary: accentCyan,
        secondary: accentPurple,
        surface: bgSecondary,
      ),
    );
  }
}

class GradientText extends StatelessWidget {
  const GradientText(
    this.text, {
    super.key,
    required this.gradient,
    this.style,
  });

  final String text;
  final Gradient gradient;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (bounds) => gradient.createShader(
        Rect.fromLTWH(0, 0, bounds.width, bounds.height),
      ),
      child: Text(text, style: style),
    );
  }
}
