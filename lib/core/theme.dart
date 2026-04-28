import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Colors
  static const Color bgPrimary = Color(0xFF0A0E21);
  static const Color bgSecondary = Color(0xFF111328);
  static const Color bgCard = Color(0xFF151830);
  static const Color neonPink = Color(0xFFFF006E);
  static const Color neonPurple = Color(0xFF8338EC);
  static const Color neonBlue = Color(0xFF3A86FF);
  static const Color textPrimary = Colors.white;
  static const Color textSecondary = Color(0xFFB0B0C3);
  static const Color textMuted = Color(0xFF6C6C80);

  static const LinearGradient neonGradient = LinearGradient(
    colors: [neonPink, neonPurple, neonBlue],
  );

  static const LinearGradient buttonGradient = LinearGradient(
    colors: [neonPink, neonPurple],
  );

  static const LinearGradient cardBorderGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [neonPink, neonPurple, neonBlue],
  );

  static ThemeData get darkTheme {
    return ThemeData.dark().copyWith(
      scaffoldBackgroundColor: bgPrimary,
      textTheme: GoogleFonts.poppinsTextTheme(ThemeData.dark().textTheme),
      colorScheme: const ColorScheme.dark(
        primary: neonPurple,
        secondary: neonBlue,
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
