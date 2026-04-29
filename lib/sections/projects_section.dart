import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      color: AppTheme.bgPrimary,
      child: Column(
        children: [
          const SectionTitle(
            title: 'Recent',
            highlight: 'Work',
            subtitle: "A collection of projects I've worked on",
          ),
          ...AppConstants.projects.asMap().entries.map((entry) {
            final isEven = entry.key % 2 == 0;
            return _ProjectRow(data: entry.value, imageLeft: isEven);
          }),
        ],
      ),
    );
  }
}

class _ProjectRow extends StatefulWidget {
  const _ProjectRow({required this.data, required this.imageLeft});
  final Map<String, dynamic> data;
  final bool imageLeft;

  @override
  State<_ProjectRow> createState() => _ProjectRowState();
}

class _ProjectRowState extends State<_ProjectRow> {
  bool _hovered = false;

  void _showDetails(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => _ProjectDetailDialog(data: widget.data),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final hasPlayStore = widget.data['playStoreUrl'] != null;
    final hasAppStore = widget.data['appStoreUrl'] != null;

    final imageWidget = MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => _showDetails(context),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: isMobile ? 220 : 320,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: AppTheme.bgSurface,
            border: Border.all(
              color: _hovered
                  ? AppTheme.accentCyan.withOpacity(0.4)
                  : AppTheme.textMuted.withOpacity(0.1),
            ),
            image: widget.data['image'] != null
                ? DecorationImage(
                    image: AssetImage(widget.data['image']),
                    fit: BoxFit.cover,
                  )
                : null,
            boxShadow: _hovered
                ? [BoxShadow(color: AppTheme.accentCyan.withOpacity(0.15), blurRadius: 30)]
                : [],
          ),
          child: widget.data['image'] == null
              ? Center(
                  child: Icon(Icons.apps_rounded,
                      color: AppTheme.accentCyan.withOpacity(0.3), size: 48))
              : null,
        ),
      ),
    );

    final infoWidget = Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      children: [
        // Status badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            color: AppTheme.accentCyan.withOpacity(0.1),
            border: Border.all(color: AppTheme.accentCyan.withOpacity(0.2)),
          ),
          child: Text(widget.data['status'] ?? '',
              style: const TextStyle(
                  color: AppTheme.accentCyan, fontSize: 11, fontWeight: FontWeight.w600)),
        ),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: () => _showDetails(context),
          child: Text(widget.data['name'],
              style: const TextStyle(
                  color: AppTheme.textPrimary, fontSize: 26, fontWeight: FontWeight.w700)),
        ),
        const SizedBox(height: 6),
        Text(widget.data['subtitle'],
            style: const TextStyle(
                color: AppTheme.accentPurple, fontSize: 14, fontWeight: FontWeight.w500)),
        const SizedBox(height: 16),
        Text(
          List<String>.from(widget.data['points']).first,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(color: AppTheme.textSecondary, fontSize: 14, height: 1.6),
        ),
        const SizedBox(height: 20),
        // Store buttons
        Wrap(
          spacing: 10,
          runSpacing: 10,
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          children: [
            if (hasPlayStore) _StoreBtn(icon: FontAwesomeIcons.googlePlay,
                label: 'Play Store', url: widget.data['playStoreUrl'],
                color: const Color(0xFF00C853)),
            if (hasAppStore) _StoreBtn(icon: FontAwesomeIcons.apple,
                label: 'App Store', url: widget.data['appStoreUrl'],
                color: const Color(0xFF2196F3)),
          ],
        ),
      ],
    );

    if (isMobile) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 48),
        child: Column(children: [imageWidget, const SizedBox(height: 24), infoWidget]),
      );
    }

    final children = widget.imageLeft
        ? [Expanded(flex: 5, child: imageWidget), const SizedBox(width: 48),
           Expanded(flex: 4, child: infoWidget)]
        : [Expanded(flex: 4, child: infoWidget), const SizedBox(width: 48),
           Expanded(flex: 5, child: imageWidget)];

    return Padding(
      padding: const EdgeInsets.only(bottom: 64),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: children,
      ),
    );
  }
}

class _StoreBtn extends StatefulWidget {
  const _StoreBtn({required this.icon, required this.label,
      required this.url, required this.color});
  final IconData icon;
  final String label;
  final String url;
  final Color color;

  @override
  State<_StoreBtn> createState() => _StoreBtnState();
}

class _StoreBtnState extends State<_StoreBtn> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: () async {
          final uri = Uri.parse(widget.url);
          if (await canLaunchUrl(uri)) await launchUrl(uri, mode: LaunchMode.externalApplication);
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: _h ? widget.color.withOpacity(0.15) : widget.color.withOpacity(0.08),
            border: Border.all(color: widget.color.withOpacity(_h ? 0.6 : 0.25)),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(widget.icon, size: 13, color: widget.color),
              const SizedBox(width: 8),
              Text(widget.label, style: TextStyle(
                  color: widget.color, fontSize: 12, fontWeight: FontWeight.w600)),
            ],
          ),
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
    final hasPlayStore = data['playStoreUrl'] != null;
    final hasAppStore = data['appStoreUrl'] != null;
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
            Row(children: [
              Expanded(child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(data['name'], style: const TextStyle(
                      color: AppTheme.textPrimary, fontSize: 28, fontWeight: FontWeight.w700)),
                  Text(data['subtitle'], style: const TextStyle(
                      color: AppTheme.accentCyan, fontSize: 16)),
                ],
              )),
              IconButton(onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close, color: AppTheme.textPrimary)),
            ]),
            Divider(color: AppTheme.textMuted.withOpacity(0.15), height: 40),
            Expanded(child: SingleChildScrollView(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Store links
                if (hasPlayStore || hasAppStore) ...[
                  _buildStoreSection(subApps, hasPlayStore, hasAppStore),
                  const SizedBox(height: 32),
                ],
                const Text('App Screenshots', style: TextStyle(
                    color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 20),
                if (images.isEmpty)
                  Center(child: Text('No screenshots available.',
                      style: TextStyle(color: AppTheme.textMuted)))
                else
                  LayoutBuilder(builder: (context, c) {
                    return Wrap(spacing: 16, runSpacing: 16, children: images.map((img) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Container(
                          width: isMobile ? (c.maxWidth - 16) / 2 : (c.maxWidth - 48) / 4,
                          decoration: BoxDecoration(
                            color: AppTheme.bgSecondary,
                            border: Border.all(color: AppTheme.accentCyan.withOpacity(0.15)),
                          ),
                          child: Image.asset(img, fit: BoxFit.contain),
                        ),
                      );
                    }).toList());
                  }),
                const SizedBox(height: 40),
                const Text('Technical Details', style: TextStyle(
                    color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
                const SizedBox(height: 16),
                ...List<String>.from(data['points']).map((p) => Padding(
                  padding: const EdgeInsets.only(bottom: 12),
                  child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Icon(Icons.check_circle_outline, color: AppTheme.accentCyan, size: 20),
                    const SizedBox(width: 12),
                    Expanded(child: Text(p, style: const TextStyle(
                        color: AppTheme.textSecondary, fontSize: 15, height: 1.5))),
                  ]),
                )),
                const SizedBox(height: 24),
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppTheme.bgSurface,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppTheme.accentCyan.withOpacity(0.15)),
                  ),
                  child: Row(children: [
                    const Icon(Icons.code, color: AppTheme.accentCyan),
                    const SizedBox(width: 12),
                    Expanded(child: Text('Tech Stack: ${data['tech']}',
                        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14,
                            fontWeight: FontWeight.w500))),
                  ]),
                ),
              ],
            ))),
          ],
        ),
      ),
    );
  }

  Widget _buildStoreSection(List<Map<String, dynamic>> subApps,
      bool hasPlayStore, bool hasAppStore) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: AppTheme.accentCyan.withOpacity(0.04),
        border: Border.all(color: AppTheme.accentCyan.withOpacity(0.15)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(children: [
          Icon(Icons.download_rounded, color: AppTheme.accentCyan, size: 20),
          const SizedBox(width: 12),
          const Text('Download & Links', style: TextStyle(
              color: AppTheme.textPrimary, fontSize: 18, fontWeight: FontWeight.w700)),
        ]),
        const SizedBox(height: 16),
        if (subApps.isEmpty)
          Wrap(spacing: 12, runSpacing: 12, children: [
            if (hasPlayStore) _StoreBtn(icon: FontAwesomeIcons.googlePlay,
                label: 'Google Play', url: data['playStoreUrl'], color: const Color(0xFF00C853)),
            if (hasAppStore) _StoreBtn(icon: FontAwesomeIcons.apple,
                label: 'App Store', url: data['appStoreUrl'], color: const Color(0xFF2196F3)),
          ]),
        if (subApps.isNotEmpty)
          ...subApps.map((sub) => Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Container(
              padding: const EdgeInsets.all(14),
              decoration: BoxDecoration(
                color: AppTheme.bgSecondary.withOpacity(0.6),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppTheme.textMuted.withOpacity(0.1)),
              ),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(sub['name'] as String, style: const TextStyle(
                    color: AppTheme.textPrimary, fontSize: 14, fontWeight: FontWeight.w600)),
                const SizedBox(height: 10),
                Wrap(spacing: 8, runSpacing: 8, children: [
                  if (sub['playStoreUrl'] != null) _StoreBtn(icon: FontAwesomeIcons.googlePlay,
                      label: 'Play Store', url: sub['playStoreUrl'], color: const Color(0xFF00C853)),
                  if (sub['appStoreUrl'] != null) _StoreBtn(icon: FontAwesomeIcons.apple,
                      label: 'App Store', url: sub['appStoreUrl'], color: const Color(0xFF2196F3)),
                ]),
              ]),
            ),
          )),
      ]),
    );
  }
}
