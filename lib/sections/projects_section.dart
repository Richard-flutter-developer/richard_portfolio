import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/section_title.dart';
import '../widgets/neon_card.dart';
import 'package:flutter/foundation.dart' show kIsWeb, TargetPlatform;

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
              childAspectRatio: crossAxisCount == 1 ? 1.0 : 0.68,
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

/// Helper to detect the user's platform and launch the correct store link.
class _StoreHelper {
  /// Returns true if the user is on iOS/macOS (Apple ecosystem)
  static bool _isApplePlatform(BuildContext context) {
    final platform = Theme.of(context).platform;
    return platform == TargetPlatform.iOS ||
        platform == TargetPlatform.macOS;
  }

  /// Returns true if the user is on Android
  static bool _isAndroidPlatform(BuildContext context) {
    final platform = Theme.of(context).platform;
    return platform == TargetPlatform.android;
  }

  /// Launches the best URL based on the user's device.
  /// On iOS/macOS → App Store link first, fall back to Play Store.
  /// On Android → Play Store link first, fall back to App Store.
  /// On web/desktop → opens the Play Store link (more universal).
  static Future<void> launchSmartLink(
    BuildContext context, {
    String? playStoreUrl,
    String? appStoreUrl,
  }) async {
    String? targetUrl;

    if (_isApplePlatform(context) && appStoreUrl != null) {
      targetUrl = appStoreUrl;
    } else if (_isAndroidPlatform(context) && playStoreUrl != null) {
      targetUrl = playStoreUrl;
    } else {
      // Web or other desktop: prefer Play Store as it's browser-friendly
      targetUrl = playStoreUrl ?? appStoreUrl;
    }

    if (targetUrl != null) {
      final uri = Uri.parse(targetUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      }
    }
  }

  /// Launches a specific URL
  static Future<void> launchLink(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    }
  }
}

// ─────────────────────────────────────────────
//  Store Link Button Widgets
// ─────────────────────────────────────────────

class _PlayStoreButton extends StatefulWidget {
  const _PlayStoreButton({required this.url, this.compact = false});
  final String url;
  final bool compact;

  @override
  State<_PlayStoreButton> createState() => _PlayStoreButtonState();
}

class _PlayStoreButtonState extends State<_PlayStoreButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => _StoreHelper.launchLink(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.compact ? 10 : 14,
            vertical: widget.compact ? 6 : 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: _hovering
                  ? [const Color(0xFF00C853), const Color(0xFF1DE9B6)]
                  : [
                      const Color(0xFF00C853).withOpacity(0.15),
                      const Color(0xFF1DE9B6).withOpacity(0.15),
                    ],
            ),
            border: Border.all(
              color: const Color(0xFF00C853).withOpacity(_hovering ? 0.8 : 0.4),
              width: 1,
            ),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: const Color(0xFF00C853).withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.googlePlay,
                size: widget.compact ? 12 : 14,
                color: _hovering ? Colors.white : const Color(0xFF00C853),
              ),
              SizedBox(width: widget.compact ? 4 : 8),
              Text(
                widget.compact ? 'Play Store' : 'Google Play',
                style: TextStyle(
                  color: _hovering ? Colors.white : const Color(0xFF00C853),
                  fontSize: widget.compact ? 10 : 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AppStoreButton extends StatefulWidget {
  const _AppStoreButton({required this.url, this.compact = false});
  final String url;
  final bool compact;

  @override
  State<_AppStoreButton> createState() => _AppStoreButtonState();
}

class _AppStoreButtonState extends State<_AppStoreButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => _StoreHelper.launchLink(widget.url),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.compact ? 10 : 14,
            vertical: widget.compact ? 6 : 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: _hovering
                  ? [const Color(0xFF2196F3), const Color(0xFF42A5F5)]
                  : [
                      const Color(0xFF2196F3).withOpacity(0.15),
                      const Color(0xFF42A5F5).withOpacity(0.15),
                    ],
            ),
            border: Border.all(
              color: const Color(0xFF2196F3).withOpacity(_hovering ? 0.8 : 0.4),
              width: 1,
            ),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: const Color(0xFF2196F3).withOpacity(0.3),
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.apple,
                size: widget.compact ? 13 : 16,
                color: _hovering ? Colors.white : const Color(0xFF2196F3),
              ),
              SizedBox(width: widget.compact ? 4 : 8),
              Text(
                widget.compact ? 'App Store' : 'App Store',
                style: TextStyle(
                  color: _hovering ? Colors.white : const Color(0xFF2196F3),
                  fontSize: widget.compact ? 10 : 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// A smart button that detects the user's platform and shows the correct link.
class _SmartDownloadButton extends StatefulWidget {
  const _SmartDownloadButton({
    required this.playStoreUrl,
    required this.appStoreUrl,
  });
  final String? playStoreUrl;
  final String? appStoreUrl;

  @override
  State<_SmartDownloadButton> createState() => _SmartDownloadButtonState();
}

class _SmartDownloadButtonState extends State<_SmartDownloadButton> {
  bool _hovering = false;

  @override
  Widget build(BuildContext context) {
    final hasPlayStore = widget.playStoreUrl != null;
    final hasAppStore = widget.appStoreUrl != null;
    if (!hasPlayStore && !hasAppStore) return const SizedBox.shrink();

    return MouseRegion(
      onEnter: (_) => setState(() => _hovering = true),
      onExit: (_) => setState(() => _hovering = false),
      child: GestureDetector(
        onTap: () => _StoreHelper.launchSmartLink(
          context,
          playStoreUrl: widget.playStoreUrl,
          appStoreUrl: widget.appStoreUrl,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: LinearGradient(
              colors: _hovering
                  ? [AppTheme.neonPurple, AppTheme.neonBlue]
                  : [
                      AppTheme.neonPurple.withOpacity(0.15),
                      AppTheme.neonBlue.withOpacity(0.15),
                    ],
            ),
            border: Border.all(
              color: AppTheme.neonPurple.withOpacity(_hovering ? 0.8 : 0.4),
              width: 1,
            ),
            boxShadow: _hovering
                ? [
                    BoxShadow(
                      color: AppTheme.neonPurple.withOpacity(0.3),
                      blurRadius: 12,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.download_rounded,
                size: 16,
                color: _hovering ? Colors.white : AppTheme.neonPurple,
              ),
              const SizedBox(width: 8),
              Text(
                'Download App',
                style: TextStyle(
                  color: _hovering ? Colors.white : AppTheme.neonPurple,
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
//  Project Card (Grid item)
// ─────────────────────────────────────────────

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
    final hasPlayStore = data['playStoreUrl'] != null;
    final hasAppStore = data['appStoreUrl'] != null;
    final hasStoreLinks = hasPlayStore || hasAppStore;

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
            const SizedBox(height: 8),
            // Store link buttons row
            if (hasStoreLinks)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (hasPlayStore)
                    _PlayStoreButton(
                      url: data['playStoreUrl'],
                      compact: true,
                    ),
                  if (hasPlayStore && hasAppStore) const SizedBox(width: 8),
                  if (hasAppStore)
                    _AppStoreButton(
                      url: data['appStoreUrl'],
                      compact: true,
                    ),
                ],
              )
            else
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

// ─────────────────────────────────────────────
//  Project Detail Dialog
// ─────────────────────────────────────────────

class _ProjectDetailDialog extends StatelessWidget {
  const _ProjectDetailDialog({required this.data});
  final Map<String, dynamic> data;

  @override
  Widget build(BuildContext context) {
    final List<String> images = List<String>.from(data['images'] ?? []);
    final isMobile = Responsive.isMobile(context);
    final hasPlayStore = data['playStoreUrl'] != null;
    final hasAppStore = data['appStoreUrl'] != null;
    final hasStoreLinks = hasPlayStore || hasAppStore;
    final List<Map<String, dynamic>> subApps =
        List<Map<String, dynamic>>.from(data['subApps'] ?? []);

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
            // ── Header ──
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
                // Smart download button in header
                if (hasStoreLinks && !isMobile)
                  Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: _SmartDownloadButton(
                      playStoreUrl: data['playStoreUrl'],
                      appStoreUrl: data['appStoreUrl'],
                    ),
                  ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppTheme.textPrimary),
                ),
              ],
            ),
            const Divider(color: AppTheme.bgSecondary, height: 40),

            // ── Content ──
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ── Store Links Section ──
                    if (hasStoreLinks) ...[
                      _buildStoreLinkSection(
                        context,
                        hasPlayStore: hasPlayStore,
                        hasAppStore: hasAppStore,
                        subApps: subApps,
                        isMobile: isMobile,
                      ),
                      const SizedBox(height: 32),
                    ],

                    // ── Screenshots ──
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
                                    color:
                                        AppTheme.neonPurple.withOpacity(0.2),
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

                    // ── Technical Details ──
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
                    }),
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

  /// Builds the "Download & Links" section in the dialog
  Widget _buildStoreLinkSection(
    BuildContext context, {
    required bool hasPlayStore,
    required bool hasAppStore,
    required List<Map<String, dynamic>> subApps,
    required bool isMobile,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppTheme.neonPurple.withOpacity(0.08),
            AppTheme.neonBlue.withOpacity(0.08),
          ],
        ),
        border: Border.all(
          color: AppTheme.neonPurple.withOpacity(0.2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppTheme.neonPurple.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.download_rounded,
                  color: AppTheme.neonPurple,
                  size: 20,
                ),
              ),
              const SizedBox(width: 12),
              const Text(
                'Download & Links',
                style: TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(height: 6),
          Text(
            'Available on ${hasPlayStore && hasAppStore ? 'both stores' : hasPlayStore ? 'Google Play' : 'App Store'}',
            style: TextStyle(
              color: AppTheme.textMuted.withOpacity(0.7),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 16),

          // Main app links
          if (subApps.isEmpty)
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                if (hasPlayStore)
                  _PlayStoreButton(url: data['playStoreUrl']),
                if (hasAppStore)
                  _AppStoreButton(url: data['appStoreUrl']),
              ],
            ),

          // Sub-app links (for multi-app projects)
          if (subApps.isNotEmpty) ...[
            ...subApps.map((subApp) {
              final subPlayStore = subApp['playStoreUrl'] as String?;
              final subAppStore = subApp['appStoreUrl'] as String?;
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  padding: const EdgeInsets.all(14),
                  decoration: BoxDecoration(
                    color: AppTheme.bgSecondary.withOpacity(0.6),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: AppTheme.neonBlue.withOpacity(0.15),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        subApp['name'] as String,
                        style: const TextStyle(
                          color: AppTheme.textPrimary,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 8,
                        children: [
                          if (subPlayStore != null)
                            _PlayStoreButton(
                              url: subPlayStore,
                              compact: true,
                            ),
                          if (subAppStore != null)
                            _AppStoreButton(
                              url: subAppStore,
                              compact: true,
                            ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        ],
      ),
    );
  }
}
