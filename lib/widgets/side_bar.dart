import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants.dart';
import '../core/theme.dart';

class SideBar extends StatelessWidget {
  const SideBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      top: 0,
      bottom: 0,
      child: Container(
        width: 60,
        padding: const EdgeInsets.symmetric(vertical: 40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const RotatedBox(
              quarterTurns: -1,
              child: Text(
                'Follow Me',
                style: TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  letterSpacing: 2,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(width: 2, height: 50, color: AppTheme.textMuted),
            const SizedBox(height: 20),
            _SocialIcon(
              icon: FontAwesomeIcons.linkedinIn,
              url: AppConstants.linkedIn,
            ),
            const SizedBox(height: 16),
            _SocialIcon(
              icon: FontAwesomeIcons.github,
              url: AppConstants.github,
            ),
          ],
        ),
      ),
    );
  }
}

class _SocialIcon extends StatefulWidget {
  const _SocialIcon({required this.icon, required this.url});
  final IconData icon;
  final String url;

  @override
  State<_SocialIcon> createState() => _SocialIconState();
}

class _SocialIconState extends State<_SocialIcon> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          child: FaIcon(
            widget.icon,
            color: _hovered ? AppTheme.neonPurple : AppTheme.textSecondary,
            size: 20,
          ),
        ),
      ),
    );
  }
}
