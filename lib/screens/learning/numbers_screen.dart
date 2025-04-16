import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/theme.dart';

class NumbersScreen extends StatefulWidget {
  const NumbersScreen({super.key});

  @override
  State<NumbersScreen> createState() => _NumbersScreenState();
}

class _NumbersScreenState extends State<NumbersScreen> {
  final List<Map<String, dynamic>> numbers = [
    {
      'number': '1',
      'word': 'One',
      'objects': 1,
      'color': AppTheme.primaryBlue,
      'icon': Icons.star,
    },
    {
      'number': '2',
      'word': 'Two',
      'objects': 2,
      'color': AppTheme.primaryRed,
      'icon': Icons.favorite,
    },
    {
      'number': '3',
      'word': 'Three',
      'objects': 3,
      'color': AppTheme.primaryGreen,
      'icon': Icons.circle,
    },
    {
      'number': '4',
      'word': 'Four',
      'objects': 4,
      'color': AppTheme.primaryYellow,
      'icon': Icons.square,
    },
    {
      'number': '5',
      'word': 'Five',
      'objects': 5,
      'color': AppTheme.primaryPurple,
      'icon': Icons.pentagon,
    },
    {
      'number': '6',
      'word': 'Six',
      'objects': 6,
      'color': AppTheme.primaryBlue,
      'icon': Icons.hexagon,
    },
    {
      'number': '7',
      'word': 'Seven',
      'objects': 7,
      'color': AppTheme.primaryRed,
      'icon': Icons.auto_awesome,
    },
    {
      'number': '8',
      'word': 'Eight',
      'objects': 8,
      'color': AppTheme.primaryGreen,
      'icon': Icons.diamond,
    },
    {
      'number': '9',
      'word': 'Nine',
      'objects': 9,
      'color': AppTheme.primaryYellow,
      'icon': Icons.radio_button_checked,
    },
    {
      'number': '10',
      'word': 'Ten',
      'objects': 10,
      'color': AppTheme.primaryPurple,
      'icon': Icons.bolt,
    },
    {
      'number': '11',
      'word': 'Eleven',
      'objects': 11,
      'color': AppTheme.primaryBlue,
      'icon': Icons.cloud,
    },
    {
      'number': '12',
      'word': 'Twelve',
      'objects': 12,
      'color': AppTheme.primaryRed,
      'icon': Icons.sunny,
    },
    {
      'number': '13',
      'word': 'Thirteen',
      'objects': 13,
      'color': AppTheme.primaryGreen,
      'icon': Icons.nightlight_round,
    },
    {
      'number': '14',
      'word': 'Fourteen',
      'objects': 14,
      'color': AppTheme.primaryYellow,
      'icon': Icons.umbrella,
    },
    {
      'number': '15',
      'word': 'Fifteen',
      'objects': 15,
      'color': AppTheme.primaryPurple,
      'icon': Icons.anchor,
    },
    {
      'number': '16',
      'word': 'Sixteen',
      'objects': 16,
      'color': AppTheme.primaryBlue,
      'icon': Icons.airplanemode_active,
    },
    {
      'number': '17',
      'word': 'Seventeen',
      'objects': 17,
      'color': AppTheme.primaryRed,
      'icon': Icons.local_fire_department,
    },
    {
      'number': '18',
      'word': 'Eighteen',
      'objects': 18,
      'color': AppTheme.primaryGreen,
      'icon': Icons.water_drop,
    },
    {
      'number': '19',
      'word': 'Nineteen',
      'objects': 19,
      'color': AppTheme.primaryYellow,
      'icon': Icons.terrain,
    },
    {
      'number': '20',
      'word': 'Twenty',
      'objects': 20,
      'color': AppTheme.primaryPurple,
      'icon': Icons.forest,
    },
  ];

  int currentIndex = 0;
  bool showObjects = false;

  void _nextNumber() {
    setState(() {
      if (currentIndex < numbers.length - 1) {
        currentIndex++;
        showObjects = false;
      }
    });
  }

  void _previousNumber() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        showObjects = false;
      }
    });
  }

  void _toggleObjects() {
    setState(() {
      showObjects = !showObjects;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learn Numbers',
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
                    onTap: _toggleObjects,
                    child: AnimatedSwitcher(
                      duration: AppTheme.mediumAnimation,
                      child: Container(
                        key: ValueKey<bool>(showObjects),
                        width: 280,
                        height: 380,
                        decoration: BoxDecoration(
                          color: numbers[currentIndex]['color'],
                          borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: numbers[currentIndex]['color'].withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: showObjects
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      numbers[currentIndex]['word'],
                                      style: AppTheme.titleStyle.copyWith(fontSize: 36),
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Wrap(
                                      spacing: 20,
                                      runSpacing: 20,
                                      alignment: WrapAlignment.center,
                                      children: List.generate(
                                        numbers[currentIndex]['objects'],
                                        (index) => Icon(
                                          numbers[currentIndex]['icon'],
                                          color: Colors.white,
                                          size: 40,
                                        ).animate().scale(delay: Duration(milliseconds: index * 100)),
                                      ),
                                    ),
                                  ],
                                )
                              : Text(
                                  numbers[currentIndex]['number'],
                                  style: AppTheme.titleStyle.copyWith(fontSize: 120),
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
                      onPressed: currentIndex > 0 ? _previousNumber : null,
                      icon: const Icon(Icons.arrow_back),
                      iconSize: AppTheme.mediumIconSize,
                    ).animate().slideX(begin: -0.2),
                    IconButton.filled(
                      onPressed: currentIndex < numbers.length - 1 ? _nextNumber : null,
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