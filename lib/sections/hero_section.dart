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
        60,
        padding,
        60,
      ),
      decoration: BoxDecoration(
        color: AppTheme.bgPrimary,
        gradient: RadialGradient(
          center: const Alignment(0.7, -0.3),
          radius: 1.2,
          colors: [AppTheme.neonBlue.withOpacity(0.08), AppTheme.bgPrimary],
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
        const SizedBox(width: 60),
        Expanded(flex: 2, child: _buildAvatar()),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildAvatar(),
        const SizedBox(height: 40),
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
        SizedBox(
          height: 50,
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                'I Am ${AppConstants.name} 👋',
                textStyle: TextStyle(
                  fontSize: isMobile ? 32 : 48,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textPrimary,
                ),
                speed: const Duration(milliseconds: 80),
              ),
            ],
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            Text(
              'Flutter ',
              style: TextStyle(
                fontSize: isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
                color: AppTheme.textPrimary,
              ),
            ),
            GradientText(
              'Developer',
              gradient: AppTheme.neonGradient,
              style: TextStyle(
                fontSize: isMobile ? 28 : 42,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          AppConstants.summary,
          textAlign: isMobile ? TextAlign.center : TextAlign.left,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 15,
            color: AppTheme.textSecondary,
            height: 1.6,
          ),
        ),
        const SizedBox(height: 32),
        Row(
          mainAxisSize: isMobile ? MainAxisSize.min : MainAxisSize.max,
          children: [
            _DownloadCVButton(),
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
      ],
    );
  }

  Widget _buildAvatar() {
    return Container(
      width: 280,
      height: 280,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        gradient: AppTheme.cardBorderGradient,
        boxShadow: [
          BoxShadow(
            color: AppTheme.neonPurple.withOpacity(0.3),
            blurRadius: 40,
            spreadRadius: 5,
          ),
          BoxShadow(
            color: AppTheme.neonBlue.withOpacity(0.2),
            blurRadius: 60,
            spreadRadius: 10,
          ),
        ],
      ),
      child: Container(
        margin: const EdgeInsets.all(3),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(22),
          color: AppTheme.bgCard,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(22),
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1a1a3e), Color(0xFF0d0d2b)],
              ),
            ),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GradientText(
                    'RS',
                    gradient: AppTheme.neonGradient,
                    style: const TextStyle(
                      fontSize: 80,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Flutter Dev',
                    style: TextStyle(
                      color: AppTheme.textSecondary,
                      fontSize: 16,
                      letterSpacing: 3,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _DownloadCVButton extends StatefulWidget {
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
        onTap: () => launchUrl(Uri.parse('assets/pdf/Richard_%20Flutter%20Developer.pdf')),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 14),
          decoration: BoxDecoration(
            gradient: AppTheme.buttonGradient,
            borderRadius: BorderRadius.circular(30),
            boxShadow: _hovered
                ? [
                    BoxShadow(
                      color: AppTheme.neonPink.withOpacity(0.4),
                      blurRadius: 20,
                      spreadRadius: 2,
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
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(width: 8),
              Icon(Icons.download_rounded, color: Colors.white, size: 20),
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
              color: _hovered ? AppTheme.neonPurple : AppTheme.textMuted,
            ),
            color: _hovered
                ? AppTheme.neonPurple.withOpacity(0.1)
                : Colors.transparent,
          ),
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
