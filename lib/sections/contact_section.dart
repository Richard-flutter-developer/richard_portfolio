import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import '../core/responsive.dart';
import '../widgets/section_title.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final padding = Responsive.contentPadding(context);
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      decoration: BoxDecoration(
        color: AppTheme.bgPrimary,
        gradient: RadialGradient(
          center: const Alignment(0, 0.5),
          radius: 1.2,
          colors: [AppTheme.neonPurple.withOpacity(0.05), AppTheme.bgPrimary],
        ),
      ),
      child: Column(
        children: [
          const SectionTitle(title: 'Contact', highlight: 'Me'),
          const SizedBox(height: 16),
          const Text(
            "Let's build something amazing together!",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppTheme.textSecondary,
              fontSize: 16,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 48),
          Wrap(
            spacing: 24,
            runSpacing: 24,
            alignment: WrapAlignment.center,
            children: [
              _ContactCard(
                icon: Icons.phone_rounded,
                title: 'Phone',
                value: AppConstants.phone,
                url: 'tel:${AppConstants.phone}',
              ),
              _ContactCard(
                icon: Icons.email_rounded,
                title: 'Email',
                value: AppConstants.email,
                url: 'mailto:${AppConstants.email}',
              ),
              _ContactCard(
                icon: Icons.location_on_rounded,
                title: 'Location',
                value: AppConstants.location,
                url: '',
              ),
            ],
          ),
          const SizedBox(height: 48),
          // Social links row
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _SocialButton(
                icon: FontAwesomeIcons.linkedinIn,
                label: 'LinkedIn',
                url: AppConstants.linkedIn,
              ),
              const SizedBox(width: 16),
              _SocialButton(
                icon: FontAwesomeIcons.github,
                label: 'GitHub',
                url: AppConstants.github,
              ),
              const SizedBox(width: 16),
              _SocialButton(
                icon: FontAwesomeIcons.whatsapp,
                label: 'WhatsApp',
                url: AppConstants.whatsApp,
                isGradient: true,
              ),
            ],
          ),
          const SizedBox(height: 60),
          // Footer
          const Divider(color: AppTheme.textMuted, height: 1),
          const SizedBox(height: 24),
          Text(
            '© 2025 ${AppConstants.name}. Built with Flutter 💙',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppTheme.textMuted, fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _ContactCard extends StatefulWidget {
  const _ContactCard({
    required this.icon,
    required this.title,
    required this.value,
    required this.url,
  });
  final IconData icon;
  final String title;
  final String value;
  final String url;

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: widget.url.isNotEmpty
            ? () => launchUrl(Uri.parse(widget.url))
            : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          width: 280,
          padding: const EdgeInsets.all(28),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: _hovered
                  ? AppTheme.neonPurple
                  : AppTheme.textMuted.withOpacity(0.2),
            ),
            color: _hovered
                ? AppTheme.neonPurple.withOpacity(0.06)
                : AppTheme.bgCard,
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.neonPurple.withOpacity(0.15),
                      blurRadius: 20,
                    ),
                  ]
                : [],
          ),
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: _hovered ? AppTheme.buttonGradient : null,
                  color: _hovered ? null : AppTheme.neonPurple.withOpacity(0.1),
                ),
                child: Icon(widget.icon, color: Colors.white, size: 24),
              ),
              const SizedBox(height: 16),
              Text(
                widget.title,
                style: const TextStyle(
                  color: AppTheme.textPrimary,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                widget.value,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: AppTheme.textSecondary,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  const _SocialButton({
    required this.icon,
    required this.label,
    required this.url,
    this.isGradient = false,
  });
  final IconData icon;
  final String label;
  final String url;
  final bool isGradient;

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            gradient: widget.isGradient || _hovered
                ? AppTheme.buttonGradient
                : null,
            border: !widget.isGradient && !_hovered
                ? Border.all(color: AppTheme.textMuted.withOpacity(0.4))
                : null,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(widget.icon, color: Colors.white, size: 16),
              const SizedBox(width: 8),
              Text(
                widget.label,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
