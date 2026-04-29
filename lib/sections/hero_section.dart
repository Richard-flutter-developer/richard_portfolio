import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../core/constants.dart';
import '../core/theme.dart';
import '../core/responsive.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    final padding = Responsive.contentPadding(context);

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(
        minHeight: MediaQuery.of(context).size.height - 70,
      ),
      padding: EdgeInsets.fromLTRB(
        isMobile ? padding : padding + 60,
        80,
        padding,
        80,
      ),
      decoration: BoxDecoration(
        color: AppTheme.bgPrimary,
        gradient: RadialGradient(
          center: const Alignment(0.6, -0.5),
          radius: 1.0,
          colors: [
            AppTheme.accentCyan.withOpacity(0.06),
            AppTheme.accentPurple.withOpacity(0.03),
            AppTheme.bgPrimary,
          ],
        ),
      ),
      child: isMobile
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 3, child: _buildTextContent(context)),
        const SizedBox(width: 80),
        Expanded(flex: 2, child: Center(child: _buildAvatar())),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatar(),
        const SizedBox(height: 48),
        _buildTextContent(context),
      ],
    );
  }

  Widget _buildTextContent(BuildContext context) {
    final isMobile = Responsive.isMobile(context);
    return Column(
      crossAxisAlignment: isMobile
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Greeting badge
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: AppTheme.accentCyan.withOpacity(0.08),
            border: Border.all(
              color: AppTheme.accentCyan.withOpacity(0.2),
            ),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 8,
                height: 8,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppTheme.accentCyan,
                ),
              ),
              const SizedBox(width: 8),
              const Text(
                'Available for work',
                style: TextStyle(
                  color: AppTheme.accentCyan,
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),
        // Name with typewriter
        SizedBox(
          height: isMobile ? 48 : 60,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'Hi, I\'m ${AppConstants.name}',
                textStyle: TextStyle(
                  fontSize: isMobile ? 34 : 52,
                  fontWeight: FontWeight.w800,
                  color: AppTheme.textPrimary,
                  letterSpacing: -1,
                ),
                speed: const Duration(milliseconds: 80),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        // Role
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            GradientText(
              'Flutter Developer',
              gradient: AppTheme.accentGradient,
              style: TextStyle(
                fontSize: isMobile ? 24 : 36,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        // Summary
        Text(
          AppConstants.summary,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          maxLines: 4,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary,
            height: 1.7,
          ),
        ),
        const SizedBox(height: 36),
        // CTA Row
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            const _DownloadCVButton(),
            const SizedBox(width: 16),
            _SocialIconButton(
              icon: FontAwesomeIcons.linkedinIn,
              url: AppConstants.linkedIn,
            ),
            const SizedBox(width: 12),
            _SocialIconButton(
              icon: FontAwesomeIcons.github,
              url: AppConstants.github,
            ),
          ],
        ),
        const SizedBox(height: 56),
        // Stats row
        Wrap(
          spacing: isMobile ? 24 : 48,
          runSpacing: 16,
          alignment: WrapAlignment.center,
          children: AppConstants.stats.map((stat) {
            return _InlineStat(
              count: stat['count']!,
              label: stat['label']!.replaceAll('\n', ' '),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 300,
      height: 300,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: AppTheme.accentGradient,
        boxShadow: [
          BoxShadow(
            color: AppTheme.accentCyan.withOpacity(0.25),
            blurRadius: 60,
            spreadRadius: 10,
          ),
          BoxShadow(
            color: AppTheme.accentPurple.withOpacity(0.15),
            blurRadius: 80,
            spreadRadius: 20,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppTheme.bgCard,
        ),
        child: ClipOval(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 0.8,
                colors: [
                  AppTheme.accentCyan.withOpacity(0.05),
                  AppTheme.bgCard,
                ],
              ),
            ),
            child: Image.asset(
              'assets/profile.png',
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
    );
  }
}

// ── Inline stat for hero section ──
class _InlineStat extends StatelessWidget {
  const _InlineStat({required this.count, required this.label});
  final String count;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        GradientText(
          count,
          gradient: AppTheme.accentGradient,
          style: const TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.w800,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          label,
          style: const TextStyle(
            color: AppTheme.textSecondary,
            fontSize: 13,
          ),
        ),
      ],
    );
  }
}

class _DownloadCVButton extends StatefulWidget {
  const _DownloadCVButton();

  @override
  State<_DownloadCVButton> createState() => _DownloadCVButtonState();
}

class _DownloadCVButtonState extends State<_DownloadCVButton> {
  bool _hovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hovered = true),
      onExit: (_) => setState(() => _hovered = false),
      child: GestureDetector(
        onTap: () => launchUrl(
          Uri.parse('/assets/pdf/Richard_%20Flutter%20Developer.pdf'),
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            gradient: AppTheme.buttonGradient,
            borderRadius: BorderRadius.circular(12),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.accentCyan.withOpacity(0.35),
                      blurRadius: 24,
                      spreadRadius: 0,
                    ),
                  ]
                : [],
          ),
          child: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Download CV',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.download_rounded, color: Colors.white, size: 18),
            ],
          ),
        ),
      ),
    );
  }
}

class _SocialIconButton extends StatefulWidget {
  const _SocialIconButton({required this.icon, required this.url});
  final IconData icon;
  final String url;

  @override
  State<_SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<_SocialIconButton> {
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
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: _hovered
                  ? AppTheme.accentCyan
                  : AppTheme.textMuted.withOpacity(0.3),
            ),
            color: _hovered
                ? AppTheme.accentCyan.withOpacity(0.1)
                : Colors.transparent,
          ),
          child: FaIcon(
            widget.icon,
            color: _hovered ? AppTheme.accentCyan : AppTheme.textSecondary,
            size: 18,
          ),
        ),
      ),
    );
  }
}
