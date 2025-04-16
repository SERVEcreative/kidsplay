import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/theme.dart';

class AnimalsScreen extends StatefulWidget {
  const AnimalsScreen({super.key});

  @override
  State<AnimalsScreen> createState() => _AnimalsScreenState();
}

class _AnimalsScreenState extends State<AnimalsScreen> {
  final List<Map<String, dynamic>> animals = [
    {
      'name': 'Lion',
      'sound': 'Roar!',
      'icon': Icons.pets,
      'color': AppTheme.primaryOrange,
      'description': 'The king of the jungle',
    },
    {
      'name': 'Elephant',
      'sound': 'Trumpet!',
      'icon': Icons.pets,
      'color': AppTheme.primaryBlue,
      'description': 'The largest land animal',
    },
    {
      'name': 'Giraffe',
      'sound': 'Bleat!',
      'icon': Icons.pets,
      'color': AppTheme.primaryYellow,
      'description': 'The tallest land animal',
    },
    {
      'name': 'Monkey',
      'sound': 'Ooh ooh!',
      'icon': Icons.pets,
      'color': AppTheme.primaryOrange,
      'description': 'Loves to swing from trees',
    },
    {
      'name': 'Penguin',
      'sound': 'Squawk!',
      'icon': Icons.pets,
      'color': AppTheme.primaryBlue,
      'description': 'Loves to swim in cold water',
    },
  ];

  int currentIndex = 0;
  bool showSound = false;

  void _nextAnimal() {
    setState(() {
      if (currentIndex < animals.length - 1) {
        currentIndex++;
        showSound = false;
      }
    });
  }

  void _previousAnimal() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        showSound = false;
      }
    });
  }

  void _toggleSound() {
    setState(() {
      showSound = !showSound;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learn Animals',
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
                    onTap: _toggleSound,
                    child: AnimatedSwitcher(
                      duration: AppTheme.mediumAnimation,
                      child: Container(
                        key: ValueKey<bool>(showSound),
                        width: 280,
                        height: 380,
                        decoration: BoxDecoration(
                          color: animals[currentIndex]['color'],
                          borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: animals[currentIndex]['color'].withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: showSound
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      animals[currentIndex]['sound'],
                                      style: AppTheme.titleStyle.copyWith(fontSize: 36),
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      'Tap to see the animal',
                                      style: AppTheme.subtitleStyle.copyWith(fontSize: 18),
                                    ),
                                  ],
                                )
                              : Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      animals[currentIndex]['icon'],
                                      size: 100,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      animals[currentIndex]['name'],
                                      style: AppTheme.titleStyle.copyWith(fontSize: 32),
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      animals[currentIndex]['description'],
                                      style: AppTheme.subtitleStyle.copyWith(fontSize: 18),
                                      textAlign: TextAlign.center,
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
                      onPressed: currentIndex > 0 ? _previousAnimal : null,
                      icon: const Icon(Icons.arrow_back),
                      iconSize: AppTheme.mediumIconSize,
                    ).animate().slideX(begin: -0.2),
                    IconButton.filled(
                      onPressed: currentIndex < animals.length - 1 ? _nextAnimal : null,
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