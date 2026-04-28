import 'package:flutter/material.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/neon_card.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.contentPadding(context);
    final crossAxisCount = Responsive.projectCrossAxisCount(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      color: AppTheme.bgPrimary,
      child: Column(
        children: [
          const SectionTitle(title: 'Latest', highlight: 'Projects'),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              childAspectRatio: crossAxisCount == 1 ? 1.2 : 0.75,
            ),
            itemCount: AppConstants.projects.length,
            itemBuilder: (context, index) {
              return _ProjectCard(data: AppConstants.projects[index]);
            },
          ),
        ],
      ),
    );
  }
}

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({required this.data});
  final Map<String, dynamic> data;

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _ProjectDetailDialog(data: data),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _showDetails(context),
      borderRadius: BorderRadius.circular(20),
      child: NeonCard(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Container(
                height: 160,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppTheme.bgSecondary,
                  image: data['image'] != null
                      ? DecorationImage(
                          image: AssetImage(data['image']),
                          fit: BoxFit.cover,
                        )
                      : null,
                  gradient: data['image'] == null
                      ? LinearGradient(
                          colors: [
                            AppTheme.neonPurple.withOpacity(0.1),
                            AppTheme.neonBlue.withOpacity(0.1),
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        )
                      : null,
                ),
                child: data['image'] == null
                    ? Center(
                        child: Icon(
                          Icons.app_registration,
                          color: AppTheme.neonPurple.withOpacity(0.4),
                          size: 40,
                        ),
                      )
                    : null,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: Text(
                    data['name'],
                    style: const TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Icon(
                  Icons.arrow_forward_ios,
                  color: AppTheme.neonPurple,
                  size: 14,
                ),
              ],
            ),
            const SizedBox(height: 4),
            Text(
              data['subtitle'],
              style: const TextStyle(
                color: AppTheme.neonPurple,
                fontSize: 13,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 6,
              runSpacing: 6,
              children: data['tech'].toString().split(', ').take(3).map((tech) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: AppTheme.neonBlue.withOpacity(0.1),
                    border: Border.all(color: AppTheme.neonBlue.withOpacity(0.3)),
                  ),
                  child: Text(
                    tech.trim(),
                    style: const TextStyle(
                      color: AppTheme.neonBlue,
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 14),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                children: List<String>.from(data['points']).map((point) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 6),
                          width: 5,
                          height: 5,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppTheme.neonPurple.withOpacity(0.6),
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            point,
                            style: const TextStyle(
                              color: AppTheme.textSecondary,
                              fontSize: 12,
                              height: 1.4,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(height: 12),
            Center(
              child: Text(
                'Click to view gallery',
                style: TextStyle(
                  color: AppTheme.textMuted.withOpacity(0.5),
                  fontSize: 11,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProjectDetailDialog extends StatelessWidget {
  const _ProjectDetailDialog({required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(data['images'] ?? []);
    final isMobile = Responsive.isMobile(context);

    return Dialog(
      backgroundColor: AppTheme.bgPrimary,
      insetPadding: EdgeInsets.all(isMobile ? 10 : 40),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
      child: Container(
        width: isMobile ? double.infinity : 1000,
        height: isMobile ? double.infinity : 800,
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data['name'],
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        data['subtitle'],
                        style: const TextStyle(
                          color: AppTheme.neonPurple,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppTheme.textPrimary),
                ),
              ],
            ),
            const Divider(color: AppTheme.bgSecondary, height: 40),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'App Screenshots',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 20),
                    if (images.isEmpty)
                      const Center(
                        child: Text(
                          'No screenshots available for this project yet.',
                          style: TextStyle(color: AppTheme.textMuted),
                        ),
                      )
                    else
                      LayoutBuilder(builder: (context, constraints) {
                        return Wrap(
                          spacing: 16,
                          runSpacing: 16,
                          children: images.map((image) {
                            return ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Container(
                                width: isMobile
                                    ? (constraints.maxWidth - 16) / 2
                                    : (constraints.maxWidth - 48) / 4,
                                decoration: BoxDecoration(
                                  color: AppTheme.bgSecondary,
                                  border: Border.all(
                                    color: AppTheme.neonPurple.withOpacity(0.2),
                                  ),
                                ),
                                child: Image.asset(
                                  image,
                                  fit: BoxFit.contain,
                                ),
                              ),
                            );
                          }).toList(),
                        );
                      }),
                    const SizedBox(height: 40),
                    const Text(
                      'Technical Details',
                      style: TextStyle(
                        color: AppTheme.textPrimary,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 16),
                    ...List<String>.from(data['points']).map((point) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(
                              Icons.check_circle_outline,
                              color: AppTheme.neonBlue,
                              size: 20,
                            ),
                            const SizedBox(width: 12),
                            Expanded(
                              child: Text(
                                point,
                                style: const TextStyle(
                                  color: AppTheme.textSecondary,
                                  fontSize: 15,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                    const SizedBox(height: 24),
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.bgSecondary,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: AppTheme.neonBlue.withOpacity(0.2),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.code, color: AppTheme.neonBlue),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              'Tech Stack: ${data['tech']}',
                              style: const TextStyle(
                                color: AppTheme.textPrimary,
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
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
