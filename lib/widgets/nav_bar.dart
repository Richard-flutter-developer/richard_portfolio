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
        vertical: 14,
      ),
      decoration: BoxDecoration(
        color: AppTheme.bgPrimary.withOpacity(0.85),
        border: Border(
          bottom: BorderSide(
            color: AppTheme.textMuted.withOpacity(0.1),
            width: 1,
          ),
        ),
      ),
      child: Row(
        children: [
          // Logo
          GestureDetector(
            onTap: () => onNavTap(0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: AppTheme.accentGradient,
                  ),
                  child: const Text(
                    'RS',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                const Text(
                  'Richard S',
                  style: TextStyle(
                    color: AppTheme.textPrimary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
          const Spacer(),
          if (!isMobile) ...[
            for (int i = 0; i < navItems.length; i++) ...[
              _NavItem(label: navItems[i], onTap: () => onNavTap(i)),
              if (i < navItems.length - 1) const SizedBox(width: 4),
            ],
            const SizedBox(width: 20),
          ],
          // WhatsApp button
          _WhatsAppButton(compact: isMobile),
          if (isMobile) ...[
            const SizedBox(width: 8),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                  color: AppTheme.textMuted.withOpacity(0.3),
                ),
              ),
              child: IconButton(
                icon: const Icon(Icons.menu_rounded, color: AppTheme.textPrimary, size: 22),
                onPressed: () => scaffoldKey.currentState?.openEndDrawer(),
              ),
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
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: _hovered
                ? AppTheme.accentCyan.withOpacity(0.08)
                : Colors.transparent,
          ),
          child: Text(
            widget.label,
            style: TextStyle(
              color: _hovered ? AppTheme.accentCyan : AppTheme.textSecondary,
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}

class _WhatsAppButton extends StatefulWidget {
  const _WhatsAppButton({this.compact = false});
  final bool compact;

  @override
  State<_WhatsAppButton> createState() => _WhatsAppButtonState();
}

class _WhatsAppButtonState extends State<_WhatsAppButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(AppConstants.whatsApp)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: EdgeInsets.symmetric(
            horizontal: widget.compact ? 14 : 20,
            vertical: 10,
          ),
          decoration: BoxDecoration(
            gradient: AppTheme.buttonGradient,
            borderRadius: BorderRadius.circular(10),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.accentCyan.withOpacity(0.3),
                      blurRadius: 16,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const FaIcon(
                FontAwesomeIcons.whatsapp,
                color: Colors.white,
                size: 16,
              ),
              if (!widget.compact) ...[
                const SizedBox(width: 8),
                const Text(
                  'WhatsApp',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ],
          ),
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
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      gradient: AppTheme.accentGradient,
                    ),
                    child: const Text(
                      'RS',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    'Richard S',
                    style: TextStyle(
                      color: AppTheme.textPrimary,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            Divider(color: AppTheme.textMuted.withOpacity(0.2), height: 1),
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
                  color: AppTheme.accentCyan,
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
