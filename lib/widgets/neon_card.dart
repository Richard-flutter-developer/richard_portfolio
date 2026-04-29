import 'package:flutter/material.dart';
import '../core/theme.dart';

class NeonCard extends StatefulWidget {
  const NeonCard({super.key, required this.child, this.padding});

  final Widget child;
  final EdgeInsetsGeometry? padding;

  @override
  State<NeonCard> createState() => _NeonCardState();
}

class _NeonCardState extends State<NeonCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
        transform: _hovered
            ? (Matrix4.identity()..scale(1.02))
            : Matrix4.identity(),
        transformAlignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: _hovered ? AppTheme.cardBorderGradient : null,
          border: _hovered
              ? null
              : Border.all(
                  color: AppTheme.textMuted.withOpacity(0.2),
                  width: 1,
                ),
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppTheme.accentCyan.withOpacity(0.2),
                    blurRadius: 30,
                    spreadRadius: 0,
                  ),
                ]
              : [],
        ),
        child: Container(
          margin: _hovered ? const EdgeInsets.all(1.5) : EdgeInsets.zero,
          padding: widget.padding ?? const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: AppTheme.bgCard,
            borderRadius: BorderRadius.circular(_hovered ? 19 : 20),
          ),
          child: widget.child,
        ),
      ),
    );
  }
}
