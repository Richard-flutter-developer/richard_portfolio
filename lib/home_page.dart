import 'package:flutter/material.dart';
import 'core/theme.dart';
import 'core/responsive.dart';
import 'widgets/nav_bar.dart';
import 'widgets/side_bar.dart';
import 'sections/hero_section.dart';
import 'sections/about_section.dart';
import 'sections/skills_section.dart';
import 'sections/experience_section.dart';
import 'sections/projects_section.dart';
import 'sections/education_section.dart';
import 'sections/contact_section.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  // Section keys for scroll navigation
  final List<GlobalKey> _sectionKeys = List.generate(7, (_) => GlobalKey());

  void _scrollToSection(int index) {
    final key = _sectionKeys[index];
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = Responsive.isMobile(context);

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: AppTheme.bgPrimary,
      endDrawer: NavDrawer(onNavTap: _scrollToSection),
      body: Stack(
        children: [
          // Main scrollable content
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                // Spacer for nav bar
                const SizedBox(height: 70),
                _buildSection(0, const HeroSection()),
                _buildSection(1, const AboutSection()),
                _buildSection(2, const SkillsSection()),
                _buildSection(3, const ExperienceSection()),
                _buildSection(4, const ProjectsSection()),
                _buildSection(5, const EducationSection()),
                _buildSection(6, const ContactSection()),
              ],
            ),
          ),
          // Fixed nav bar
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: NavBar(
              onNavTap: _scrollToSection,
              scaffoldKey: _scaffoldKey,
            ),
          ),
          // Side bar (desktop only)
          if (!isMobile) const SideBar(),
        ],
      ),
    );
  }

  Widget _buildSection(int index, Widget section) {
    return Container(key: _sectionKeys[index], child: section);
  }
}
