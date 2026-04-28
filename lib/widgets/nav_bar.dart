import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import '../core/responsive.dart';

class NavBar extends StatelessWidget {
  const NavBar({super.key, required this.onNavTap, required this.scaffoldKey});

  final void Function(int index) onNavTap;
  final GlobalKey<ScaffoldState> scaffoldKey;

  static const List<String> navItems = [
    'Home',
    'About',
    'Skills',
    'Experience',
    'Projects',
    'Education',
    'Contact',
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: Responsive.contentPadding(context),
        vertical: 16,
      ),
      color: AppTheme.bgPrimary.withOpacity(0.9),
      child: Row(
        children: [
          // Logo
          GradientText(
            'RS',
            gradient: AppTheme.neonGradient,
            style: const TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          if (!isMobile) ...[
            for (int i = 0; i < navItems.length; i++) ...[
              _NavItem(label: navItems[i], onTap: () => onNavTap(i)),
              if (i < navItems.length - 1) const SizedBox(width: 8),
            ],
            const SizedBox(width: 20),
          ],
          // WhatsApp button
          _WhatsAppButton(compact: isMobile),
          if (isMobile) ...[
            const SizedBox(width: 8),
            IconButton(
              icon: const Icon(Icons.menu, color: AppTheme.textPrimary),
              onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
            ),
          ],
        ],
      ),
    );
  }
}

class _NavItem extends StatefulWidget {
  const _NavItem({required this.label, required this.onTap});
  final String label;
  final VoidCallback onTap;

  @override
  State<_NavItem> createState() => _NavItemState();
}

class _NavItemState extends State<_NavItem> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _hovered
                ? AppTheme.neonPurple.withOpacity(0.15)
                : Colors.transparent,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _hovered ? AppTheme.neonPurple : AppTheme.textSecondary,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _WhatsAppButton extends StatelessWidget {
  const _WhatsAppButton({this.compact = false});
  final bool compact;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => launchUrl(Uri.parse(AppConstants.whatsApp)),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: compact ? 14 : 20,
          vertical: 10,
        ),
        decoration: BoxDecoration(
          gradient: AppTheme.buttonGradient,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const FaIcon(
              FontAwesomeIcons.whatsapp,
              color: Colors.white,
              size: 18,
            ),
            if (!compact) ...[
              const SizedBox(width: 8),
              const Text(
                'Whatsapp',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 14,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key, required this.onNavTap});
  final void Function(int index) onNavTap;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.bgSecondary,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: GradientText(
                'RS',
                gradient: AppTheme.neonGradient,
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(color: AppTheme.textMuted, height: 1),
            const SizedBox(height: 16),
            for (int i = 0; i < NavBar.navItems.length; i++)
              ListTile(
                title: Text(
                  NavBar.navItems[i],
                  style: const TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                  ),
                ),
                leading: Icon(
                  _navIcons[i],
                  color: AppTheme.neonPurple,
                  size: 20,
                ),
                onTap: () {
                  Navigator.pop(context);
                  onNavTap(i);
                },
              ),
          ],
        ),
      ),
    );
  }

  static const List<IconData> _navIcons = [
    Icons.home_rounded,
    Icons.person_rounded,
    Icons.code_rounded,
    Icons.work_rounded,
    Icons.apps_rounded,
    Icons.school_rounded,
    Icons.mail_rounded,
  ];
}
