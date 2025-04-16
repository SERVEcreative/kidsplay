import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'title': 'Alphabets',
        'icon': Icons.abc,
        'color': AppTheme.primaryBlue,
        'route': '/alphabets',
      },
      {
        'title': 'Numbers',
        'icon': Icons.numbers,
        'color': AppTheme.primaryRed,
        'route': '/numbers',
      },
      {
        'title': 'Colors',
        'icon': Icons.palette,
        'color': AppTheme.primaryOrange,
        'route': '/colors',
      },
      {
        'title': 'Shapes',
        'icon': Icons.category,
        'color': AppTheme.primaryGreen,
        'route': '/shapes',
      },
      {
        'title': 'Animals',
        'icon': Icons.pets,
        'color': AppTheme.primaryYellow,
        'route': '/animals',
      },
      {
        'title': 'Matching Games',
        'icon': Icons.games,
        'color': AppTheme.primaryPurple,
        'route': '/matching',
      },
      {
        'title': 'Rhymes',
        'icon': Icons.music_note,
        'color': AppTheme.primaryBlue,
        'route': '/rhymes',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NSORA Learning',
          style: AppTheme.titleStyle.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Theme.of(context).colorScheme.primaryContainer,
              Theme.of(context).colorScheme.background,
            ],
          ),
        ),
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isTablet = constraints.maxWidth > AppTheme.tabletBreakpoint;
            final isDesktop = constraints.maxWidth > AppTheme.desktopBreakpoint;

            final crossAxisCount = isDesktop
                ? 4
                : isTablet
                    ? 3
                    : 2;
            final aspectRatio = isDesktop
                ? 1.0
                : isTablet
                    ? 1.1
                    : 1.2;

            return GridView.builder(
              padding: EdgeInsets.all(AppTheme.cardPadding),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount,
                childAspectRatio: aspectRatio,
                crossAxisSpacing: AppTheme.cardPadding,
                mainAxisSpacing: AppTheme.cardPadding,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return CategoryCard(
                  title: category['title'] as String,
                  icon: category['icon'] as IconData,
                  color: category['color'] as Color,
                  route: category['route'] as String,
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}

class CategoryCard extends StatefulWidget {
  final String title;
  final IconData icon;
  final Color color;
  final String route;
  final int index;

  const CategoryCard({
    super.key,
    required this.title,
    required this.icon,
    required this.color,
    required this.route,
    required this.index,
  });

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: AppTheme.mediumAnimation,
      vsync: this,
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.95).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _handleTapUp(TapUpDetails details) {
    _controller.reverse();
  }

  void _handleTapCancel() {
    _controller.reverse();
  }

  @override
  Widget build(BuildContext context) {
    return ScaleTransition(
      scale: _scaleAnimation,
      child: Card(
        elevation: AppTheme.cardElevation,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
        ),
        child: InkWell(
          onTapDown: _handleTapDown,
          onTapUp: _handleTapUp,
          onTapCancel: _handleTapCancel,
          onTap: () {
            Navigator.pushNamed(context, widget.route);
          },
          borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  widget.color.withOpacity(0.8),
                  widget.color,
                ],
              ),
              boxShadow: [
                BoxShadow(
                  color: widget.color.withOpacity(0.3),
                  blurRadius: 10,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  widget.icon,
                  size: AppTheme.largeIconSize,
                  color: Colors.white,
                )
                    .animate()
                    .fadeIn(duration: AppTheme.mediumAnimation)
                    .slideY(
                      begin: 0.3,
                      curve: Curves.easeOutQuad,
                    ),
                const SizedBox(height: AppTheme.defaultPadding),
                Text(
                  widget.title,
                  style: AppTheme.titleStyle.copyWith(
                    fontSize: MediaQuery.of(context).size.width > AppTheme.tabletBreakpoint ? 28 : 20,
                  ),
                  textAlign: TextAlign.center,
                )
                    .animate()
                    .fadeIn(duration: AppTheme.mediumAnimation)
                    .slideY(
                      begin: 0.3,
                      curve: Curves.easeOutQuad,
                    ),
              ],
            ),
          ),
        ),
      ),
    ).animate().fadeIn(duration: AppTheme.mediumAnimation).slideX(
          begin: widget.index.isEven ? -0.2 : 0.2,
          curve: Curves.easeOutQuad,
        );
  }
} 