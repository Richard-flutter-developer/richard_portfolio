import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/section_title.dart';

class EducationSection extends StatelessWidget {
  const EducationSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.contentPadding(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      color: AppTheme.bgSecondary,
      child: Column(
        children: [
          const SectionTitle(title: 'My', highlight: 'Education'),
          Center(
            child: Container(
              constraints: const BoxConstraints(maxWidth: 560),
              padding: const EdgeInsets.all(2),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: AppTheme.accentGradient,
              ),
              child: Container(
                padding: const EdgeInsets.all(36),
                decoration: BoxDecoration(
                  color: AppTheme.bgCard,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Column(children: [
                  Container(
                    padding: const EdgeInsets.all(18),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: AppTheme.accentCyan.withOpacity(0.08),
                    ),
                    child: const Icon(Icons.school_rounded,
                        color: AppTheme.accentCyan, size: 36),
                  ),
                  const SizedBox(height: 24),
                  Text(AppConstants.education['degree']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppTheme.textPrimary,
                          fontSize: 20, fontWeight: FontWeight.w700)),
                  const SizedBox(height: 12),
                  Text(AppConstants.education['institution']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppTheme.accentCyan,
                          fontSize: 16, fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8),
                  Text(AppConstants.education['location']!,
                      textAlign: TextAlign.center,
                      style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14)),
                  const SizedBox(height: 20),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      gradient: AppTheme.buttonGradient,
                    ),
                    child: Text(AppConstants.education['period']!,
                        style: const TextStyle(color: Colors.white,
                            fontSize: 13, fontWeight: FontWeight.w600)),
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
