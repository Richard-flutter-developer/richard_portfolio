import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/section_title.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.contentPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      decoration: BoxDecoration(
        color: AppTheme.bgSecondary,
        gradient: RadialGradient(
          center: const Alignment(-0.5, 0),
          radius: 1.5,
          colors: [AppTheme.neonPurple.withOpacity(0.04), AppTheme.bgSecondary],
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(title: 'About', highlight: 'Me'),
          if (isMobile) _buildMobileLayout() else _buildDesktopLayout(),
        ],
      ),
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 3,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                AppConstants.aboutMe,
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 16,
                  height: 1.8,
                ),
              ),
              const SizedBox(height: 32),
              _buildInfoRow(Icons.phone_rounded, AppConstants.phone),
              const SizedBox(height: 12),
              _buildInfoRow(Icons.email_rounded, AppConstants.email),
              const SizedBox(height: 12),
              _buildInfoRow(Icons.location_on_rounded, AppConstants.location),
            ],
          ),
        ),
        const SizedBox(width: 60),
        Expanded(flex: 2, child: _buildStatsGrid()),
      ],
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        const Text(
          AppConstants.aboutMe,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 15,
            height: 1.8,
          ),
        ),
        const SizedBox(height: 32),
        _buildStatsGrid(),
        const SizedBox(height: 32),
        _buildInfoRow(Icons.phone_rounded, AppConstants.phone),
        const SizedBox(height: 12),
        _buildInfoRow(Icons.email_rounded, AppConstants.email),
        const SizedBox(height: 12),
        _buildInfoRow(Icons.location_on_rounded, AppConstants.location),
      ],
    );
  }

  Widget _buildStatsGrid() {
    return Wrap(
      spacing: 16,
      runSpacing: 16,
      alignment: WrapAlignment.center,
      children: AppConstants.stats.map((stat) {
        return _StatCard(count: stat['count']!, label: stat['label']!);
      }).toList(),
    );
  }

  Widget _buildInfoRow(IconData icon, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: AppTheme.neonPurple.withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: AppTheme.neonPurple, size: 18),
        ),
        const SizedBox(width: 12),
        Flexible(
          child: Text(
            text,
            style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class _StatCard extends StatefulWidget {
  const _StatCard({required this.count, required this.label});
  final String count;
  final String label;

  @override
  State<_StatCard> createState() => _StatCardState();
}

class _StatCardState extends State<_StatCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        width: 140,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: _hovered
                ? AppTheme.neonPurple
                : AppTheme.textMuted.withOpacity(0.3),
          ),
          color: _hovered
              ? AppTheme.neonPurple.withOpacity(0.08)
              : AppTheme.bgCard,
          boxShadow: _hovered
              ? [
                  BoxShadow(
                    color: AppTheme.neonPurple.withOpacity(0.2),
                    blurRadius: 15,
                  ),
                ]
              : [],
        ),
        child: Column(
          children: [
            GradientText(
              widget.count,
              gradient: AppTheme.neonGradient,
              style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.label,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: AppTheme.textSecondary,
                fontSize: 13,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
