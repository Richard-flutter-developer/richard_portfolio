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
    final isMobile = Responsive.isMobile(context);

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: 80),
      decoration: BoxDecoration(
        color: AppTheme.bgPrimary,
        gradient: RadialGradient(
          center: const Alignment(0, 0.5),
          radius: 1.2,
          colors: [AppTheme.accentCyan.withOpacity(0.04), AppTheme.bgPrimary],
        ),
      ),
      child: Column(children: [
        const SectionTitle(
          title: 'Drop me a',
          highlight: 'message',
          subtitle: "Let's build something amazing together!",
        ),
        // Contact info + form layout
        if (isMobile)
          _buildMobileLayout(context)
        else
          _buildDesktopLayout(context),
        const SizedBox(height: 60),
        // Social row
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _SocialButton(icon: FontAwesomeIcons.linkedinIn, label: 'LinkedIn',
              url: AppConstants.linkedIn),
          const SizedBox(width: 16),
          _SocialButton(icon: FontAwesomeIcons.github, label: 'GitHub',
              url: AppConstants.github),
          const SizedBox(width: 16),
          _SocialButton(icon: FontAwesomeIcons.whatsapp, label: 'WhatsApp',
              url: AppConstants.whatsApp, isPrimary: true),
        ]),
        const SizedBox(height: 60),
        Divider(color: AppTheme.textMuted.withOpacity(0.15), height: 1),
        const SizedBox(height: 24),
        Text('© 2025 ${AppConstants.name}. Built with Flutter 💙',
            textAlign: TextAlign.center,
            style: const TextStyle(color: AppTheme.textMuted, fontSize: 13)),
      ]),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(child: _buildContactInfo()),
      const SizedBox(width: 60),
      Expanded(child: _buildContactForm()),
    ]);
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(children: [
      _buildContactInfo(),
      const SizedBox(height: 40),
      _buildContactForm(),
    ]);
  }

  Widget _buildContactInfo() {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      _ContactInfoTile(icon: Icons.phone_rounded, title: 'Phone',
          value: AppConstants.phone, url: 'tel:${AppConstants.phone}'),
      const SizedBox(height: 20),
      _ContactInfoTile(icon: Icons.email_rounded, title: 'Email',
          value: AppConstants.email, url: 'mailto:${AppConstants.email}'),
      const SizedBox(height: 20),
      _ContactInfoTile(icon: Icons.location_on_rounded, title: 'Location',
          value: AppConstants.location, url: ''),
    ]);
  }

  Widget _buildContactForm() {
    return Container(
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: AppTheme.bgCard,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppTheme.textMuted.withOpacity(0.12)),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        _FormField(label: 'Name', hint: 'Your name'),
        const SizedBox(height: 16),
        _FormField(label: 'Email', hint: 'your@email.com'),
        const SizedBox(height: 16),
        _FormField(label: 'Message', hint: 'Write your message...', maxLines: 4),
        const SizedBox(height: 24),
        _SendButton(),
      ]),
    );
  }
}

class _ContactInfoTile extends StatefulWidget {
  const _ContactInfoTile({required this.icon, required this.title,
      required this.value, required this.url});
  final IconData icon;
  final String title;
  final String value;
  final String url;

  @override
  State<_ContactInfoTile> createState() => _ContactInfoTileState();
}

class _ContactInfoTileState extends State<_ContactInfoTile> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: widget.url.isNotEmpty ? () => launchUrl(Uri.parse(widget.url)) : null,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: _h ? AppTheme.accentCyan.withOpacity(0.05) : AppTheme.bgCard,
            border: Border.all(color: _h ? AppTheme.accentCyan.withOpacity(0.3)
                : AppTheme.textMuted.withOpacity(0.1)),
          ),
          child: Row(children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: AppTheme.accentCyan.withOpacity(0.08),
              ),
              child: Icon(widget.icon, color: AppTheme.accentCyan, size: 22),
            ),
            const SizedBox(width: 16),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(widget.title, style: const TextStyle(color: AppTheme.textMuted, fontSize: 12,
                  fontWeight: FontWeight.w500, letterSpacing: 1)),
              const SizedBox(height: 4),
              Text(widget.value, style: const TextStyle(color: AppTheme.textPrimary,
                  fontSize: 14, fontWeight: FontWeight.w500)),
            ]),
          ]),
        ),
      ),
    );
  }
}

class _FormField extends StatelessWidget {
  const _FormField({required this.label, required this.hint, this.maxLines = 1});
  final String label;
  final String hint;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label, style: const TextStyle(color: AppTheme.textSecondary,
          fontSize: 13, fontWeight: FontWeight.w500)),
      const SizedBox(height: 8),
      TextField(
        maxLines: maxLines,
        style: const TextStyle(color: AppTheme.textPrimary, fontSize: 14),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: AppTheme.textMuted.withOpacity(0.5), fontSize: 14),
          filled: true,
          fillColor: AppTheme.bgSurface,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppTheme.textMuted.withOpacity(0.15)),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color: AppTheme.textMuted.withOpacity(0.15)),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: AppTheme.accentCyan, width: 1.5),
          ),
        ),
      ),
    ]);
  }
}

class _SendButton extends StatefulWidget {
  @override
  State<_SendButton> createState() => _SendButtonState();
}

class _SendButtonState extends State<_SendButton> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          gradient: AppTheme.buttonGradient,
          boxShadow: _h ? [BoxShadow(color: AppTheme.accentCyan.withOpacity(0.3),
              blurRadius: 20)] : [],
        ),
        child: const Center(child: Text('Send message',
            style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w600))),
      ),
    );
  }
}

class _SocialButton extends StatefulWidget {
  const _SocialButton({required this.icon, required this.label,
      required this.url, this.isPrimary = false});
  final IconData icon;
  final String label;
  final String url;
  final bool isPrimary;

  @override
  State<_SocialButton> createState() => _SocialButtonState();
}

class _SocialButtonState extends State<_SocialButton> {
  bool _h = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _h = true),
      onExit: (_) => setState(() => _h = false),
      child: GestureDetector(
        onTap: () => launchUrl(Uri.parse(widget.url)),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            gradient: widget.isPrimary || _h ? AppTheme.buttonGradient : null,
            border: !widget.isPrimary && !_h
                ? Border.all(color: AppTheme.textMuted.withOpacity(0.3))
                : null,
            boxShadow: _h ? [BoxShadow(color: AppTheme.accentCyan.withOpacity(0.2),
                blurRadius: 16)] : [],
          ),
          child: Row(mainAxisSize: MainAxisSize.min, children: [
            FaIcon(widget.icon, color: Colors.white, size: 16),
            const SizedBox(width: 8),
            Text(widget.label, style: const TextStyle(
                color: Colors.white, fontSize: 14, fontWeight: FontWeight.w500)),
          ]),
        ),
      ),
    );
  }
}
