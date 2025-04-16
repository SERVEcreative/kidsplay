import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/theme.dart';

class ColorsScreen extends StatefulWidget {
  const ColorsScreen({super.key});

  @override
  State<ColorsScreen> createState() => _ColorsScreenState();
}

class _ColorsScreenState extends State<ColorsScreen> {
  final List<Map<String, dynamic>> colors = [
    {
      'name': 'Red',
      'color': Colors.red,
      'icon': Icons.favorite,
    },
    {
      'name': 'Blue',
      'color': Colors.blue,
      'icon': Icons.water,
    },
    {
      'name': 'Green',
      'color': Colors.green,
      'icon': Icons.grass,
    },
    {
      'name': 'Yellow',
      'color': Colors.yellow,
      'icon': Icons.wb_sunny,
    },
    {
      'name': 'Purple',
      'color': Colors.purple,
      'icon': Icons.auto_awesome,
    },
    {
      'name': 'Orange',
      'color': Colors.orange,
      'icon': Icons.local_fire_department,
    },
    {
      'name': 'Pink',
      'color': Colors.pink,
      'icon': Icons.favorite_border,
    },
    {
      'name': 'Brown',
      'color': Colors.brown,
      'icon': Icons.eco,
    },
    {
      'name': 'Black',
      'color': Colors.black,
      'icon': Icons.dark_mode,
    },
    {
      'name': 'White',
      'color': Colors.white,
      'icon': Icons.light_mode,
    },
  ];

  int currentIndex = 0;
  bool showName = false;

  void _nextColor() {
    setState(() {
      if (currentIndex < colors.length - 1) {
        currentIndex++;
        showName = false;
      }
    });
  }

  void _previousColor() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        showName = false;
      }
    });
  }

  void _toggleName() {
    setState(() {
      showName = !showName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learn Colors',
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
                    onTap: _toggleName,
                    child: AnimatedSwitcher(
                      duration: AppTheme.mediumAnimation,
                      child: Container(
                        key: ValueKey<bool>(showName),
                        width: 280,
                        height: 380,
                        decoration: BoxDecoration(
                          color: colors[currentIndex]['color'],
                          borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: colors[currentIndex]['color'].withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: showName
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      colors[currentIndex]['icon'],
                                      size: 100,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      colors[currentIndex]['name'],
                                      style: AppTheme.titleStyle.copyWith(fontSize: 48),
                                    ),
                                  ],
                                )
                              : Icon(
                                  colors[currentIndex]['icon'],
                                  size: 150,
                                  color: Colors.white,
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
                      onPressed: currentIndex > 0 ? _previousColor : null,
                      icon: const Icon(Icons.arrow_back),
                      iconSize: AppTheme.mediumIconSize,
                    ).animate().slideX(begin: -0.2),
                    IconButton.filled(
                      onPressed: currentIndex < colors.length - 1 ? _nextColor : null,
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