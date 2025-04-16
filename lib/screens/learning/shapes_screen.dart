import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/theme.dart';

class ShapesScreen extends StatefulWidget {
  const ShapesScreen({super.key});

  @override
  State<ShapesScreen> createState() => _ShapesScreenState();
}

class _ShapesScreenState extends State<ShapesScreen> {
  final List<Map<String, dynamic>> shapes = [
    {
      'name': 'Circle',
      'shape': '⭕',
      'sides': '0',
      'color': AppTheme.primaryBlue,
      'icon': Icons.circle,
      'properties': 'Round, no corners',
    },
    {
      'name': 'Square',
      'shape': '⬜',
      'sides': '4',
      'color': AppTheme.primaryRed,
      'icon': Icons.square,
      'properties': 'Equal sides, 4 corners',
    },
    {
      'name': 'Triangle',
      'shape': '🔺',
      'sides': '3',
      'color': AppTheme.primaryGreen,
      'icon': Icons.change_history,
      'properties': 'Three sides, three corners',
    },
    {
      'name': 'Rectangle',
      'shape': '▭',
      'sides': '4',
      'color': AppTheme.primaryYellow,
      'icon': Icons.crop_square,
      'properties': 'Four sides, opposite sides equal',
    },
    {
      'name': 'Diamond',
      'shape': '🔷',
      'sides': '4',
      'color': AppTheme.primaryPurple,
      'icon': Icons.diamond,
      'properties': 'Four equal sides, rotated square',
    },
    {
      'name': 'Star',
      'shape': '⭐',
      'sides': '10',
      'color': AppTheme.primaryOrange,
      'icon': Icons.star,
      'properties': 'Five points, decorative',
    },
    {
      'name': 'Heart',
      'shape': '❤️',
      'sides': '0',
      'color': AppTheme.primaryRed,
      'icon': Icons.favorite,
      'properties': 'Symbol of love, curved',
    },
    {
      'name': 'Pentagon',
      'shape': '⬟',
      'sides': '5',
      'color': AppTheme.primaryBlue,
      'icon': Icons.pentagon,
      'properties': 'Five equal sides',
    },
    {
      'name': 'Hexagon',
      'shape': '⬡',
      'sides': '6',
      'color': AppTheme.primaryGreen,
      'icon': Icons.hexagon,
      'properties': 'Six equal sides',
    },
    {
      'name': 'Octagon',
      'shape': '⭔',
      'sides': '8',
      'color': AppTheme.primaryYellow,
      'icon': Icons.hexagon,
      'properties': 'Eight equal sides',
    },
  ];

  int currentIndex = 0;
  bool showProperties = false;

  void _nextShape() {
    setState(() {
      if (currentIndex < shapes.length - 1) {
        currentIndex++;
        showProperties = false;
      }
    });
  }

  void _previousShape() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        showProperties = false;
      }
    });
  }

  void _toggleProperties() {
    setState(() {
      showProperties = !showProperties;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learn Shapes',
          style: AppTheme.titleStyle.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
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
        child: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: Center(
                  child: GestureDetector(
                    onTap: _toggleProperties,
                    child: AnimatedSwitcher(
                      duration: AppTheme.mediumAnimation,
                      child: Container(
                        key: ValueKey<bool>(showProperties),
                        width: 280,
                        height: 380,
                        decoration: BoxDecoration(
                          color: shapes[currentIndex]['color'],
                          borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: shapes[currentIndex]['color'].withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: showProperties
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      shapes[currentIndex]['name'],
                                      style: AppTheme.titleStyle.copyWith(fontSize: 36),
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      'Sides: ${shapes[currentIndex]['sides']}',
                                      style: AppTheme.subtitleStyle.copyWith(fontSize: 24),
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      shapes[currentIndex]['properties'],
                                      style: AppTheme.subtitleStyle.copyWith(fontSize: 18),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      shapes[currentIndex]['icon'],
                                      size: 100,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      shapes[currentIndex]['shape'],
                                      style: const TextStyle(fontSize: 80),
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      shapes[currentIndex]['name'],
                                      style: AppTheme.titleStyle.copyWith(fontSize: 32),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ).animate().scale(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(AppTheme.defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton.filled(
                      onPressed: currentIndex > 0 ? _previousShape : null,
                      icon: const Icon(Icons.arrow_back),
                      iconSize: AppTheme.mediumIconSize,
                    ).animate().slideX(begin: -0.2),
                    IconButton.filled(
                      onPressed: currentIndex < shapes.length - 1 ? _nextShape : null,
                      icon: const Icon(Icons.arrow_forward),
                      iconSize: AppTheme.mediumIconSize,
                    ).animate().slideX(begin: 0.2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 