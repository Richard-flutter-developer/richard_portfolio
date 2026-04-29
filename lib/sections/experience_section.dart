import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/section_title.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.contentPadding(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      decoration: BoxDecoration(
        color: AppTheme.bgSecondary,
        gradient: RadialGradient(
          center: const Alignment(0.5, 0.5),
          radius: 1.5,
          colors: [AppTheme.accentCyan.withOpacity(0.03), AppTheme.bgSecondary],
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(
            title: 'Work',
            highlight: 'Experience',
            subtitle: 'My professional journey in Flutter development',
          ),
          ...AppConstants.experiences.asMap().entries.map(
            (entry) => _ExperienceCard(
              data: entry.value,
              isLast: entry.key == AppConstants.experiences.length - 1,
            ),
          ),
        ],
      ),
    );
  }
}

class _ExperienceCard extends StatefulWidget {
  const _ExperienceCard({required this.data, this.isLast = false});
  final Map<String, dynamic> data;
  final bool isLast;

  @override
  State<_ExperienceCard> createState() => _ExperienceCardState();
}

class _ExperienceCardState extends State<_ExperienceCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: Padding(
        padding: const EdgeInsets.only(bottom: 32),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (!isMobile) ...[
              // Timeline dot + line
              Column(
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    width: 16,
                    height: 16,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: _hovered ? AppTheme.accentGradient : null,
                      border: _hovered
                          ? null
                          : Border.all(color: AppTheme.accentCyan, width: 2),
                      boxShadow: _hovered
                          ? [
                              BoxShadow(
                                color: AppTheme.accentCyan.withOpacity(0.4),
                                blurRadius: 12,
                              ),
                            ]
                          : [],
                    ),
                  ),
                  if (!widget.isLast)
                    Container(
                      width: 2,
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            AppTheme.accentCyan.withOpacity(0.3),
                            AppTheme.textMuted.withOpacity(0.1),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
              const SizedBox(width: 28),
            ],
            Expanded(
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: _hovered
                        ? AppTheme.accentCyan.withOpacity(0.4)
                        : AppTheme.textMuted.withOpacity(0.12),
                  ),
                  color: _hovered
                      ? AppTheme.accentCyan.withOpacity(0.04)
                      : AppTheme.bgCard,
                  boxShadow: _hovered
                      ? [
                          BoxShadow(
                            color: AppTheme.accentCyan.withOpacity(0.1),
                            blurRadius: 24,
                          ),
                        ]
                      : [],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            widget.data['role'],
                            style: const TextStyle(
                              color: AppTheme.textPrimary,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            gradient: AppTheme.buttonGradient,
                          ),
                          child: Text(
                            widget.data['period'],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '${widget.data['company']} • ${widget.data['location']}',
                      style: const TextStyle(
                        color: AppTheme.accentCyan,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 20),
                    ...List<String>.from(widget.data['points']).map(
                      (point) => Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: const EdgeInsets.only(top: 7),
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppTheme.accentCyan.withOpacity(0.6),
                              ),
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                point,
                                style: const TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 14,
                                  height: 1.6,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
