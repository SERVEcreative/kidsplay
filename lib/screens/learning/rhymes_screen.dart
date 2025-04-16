import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/theme.dart';

class RhymesScreen extends StatefulWidget {
  const RhymesScreen({super.key});

  @override
  State<RhymesScreen> createState() => _RhymesScreenState();
}

class _RhymesScreenState extends State<RhymesScreen> {
  final List<Map<String, dynamic>> rhymes = [
    {
      'title': 'Twinkle Twinkle Little Star',
      'lyrics': 'Twinkle, twinkle, little star,\nHow I wonder what you are!\nUp above the world so high,\nLike a diamond in the sky.',
      'icon': Icons.star,
      'color': AppTheme.primaryYellow,
    },
    {
      'title': 'Baa Baa Black Sheep',
      'lyrics': 'Baa, baa, black sheep,\nHave you any wool?\nYes sir, yes sir,\nThree bags full.',
      'icon': Icons.pets,
      'color': AppTheme.primaryPurple,
    },
    {
      'title': 'Humpty Dumpty',
      'lyrics': 'Humpty Dumpty sat on a wall,\nHumpty Dumpty had a great fall.\nAll the king\'s horses and all the king\'s men\nCouldn\'t put Humpty together again.',
      'icon': Icons.egg,
      'color': AppTheme.primaryBlue,
    },
  ];

  int currentIndex = 0;

  void _nextRhyme() {
    setState(() {
      if (currentIndex < rhymes.length - 1) {
        currentIndex++;
      }
    });
  }

  void _previousRhyme() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Nursery Rhymes',
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
                  child: Container(
                    width: 280,
                    height: 380,
                    decoration: BoxDecoration(
                      color: rhymes[currentIndex]['color'],
                      borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                      boxShadow: [
                        BoxShadow(
                          color: rhymes[currentIndex]['color'].withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          rhymes[currentIndex]['icon'],
                          size: 60,
                          color: Colors.white,
                        ),
                        const SizedBox(height: AppTheme.defaultPadding),
                        Text(
                          rhymes[currentIndex]['title'],
                          style: AppTheme.titleStyle.copyWith(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: AppTheme.defaultPadding),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding),
                          child: Text(
                            rhymes[currentIndex]['lyrics'],
                            style: AppTheme.subtitleStyle.copyWith(fontSize: 18),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
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
                      onPressed: currentIndex > 0 ? _previousRhyme : null,
                      icon: const Icon(Icons.arrow_back),
                      iconSize: AppTheme.mediumIconSize,
                    ).animate().slideX(begin: -0.2),
                    IconButton.filled(
                      onPressed: currentIndex < rhymes.length - 1 ? _nextRhyme : null,
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