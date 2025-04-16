import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/theme.dart';

class MatchingGameScreen extends StatefulWidget {
  final String title;
  final String type;
  final int level;

  const MatchingGameScreen({
    super.key,
    required this.title,
    required this.type,
    required this.level,
  });

  @override
  State<MatchingGameScreen> createState() => _MatchingGameScreenState();
}

class _MatchingGameScreenState extends State<MatchingGameScreen> {
  late List<Map<String, dynamic>> items;
  late List<Map<String, dynamic>> shuffledItems;
  int? selectedIndex;
  int? matchedIndex;
  List<int> matchedPairs = [];
  int score = 0;
  int attempts = 0;
  bool isGameComplete = false;

  @override
  void initState() {
    super.initState();
    _initializeGame();
  }

  void _initializeGame() {
    // Initialize items based on game type
    switch (widget.type) {
      case 'alphabet_object':
        items = [
          {'type': 'letter', 'value': 'A', 'match': 'Apple', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Apple', 'match': 'A', 'icon': Icons.apple},
          {'type': 'letter', 'value': 'B', 'match': 'Ball', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Ball', 'match': 'B', 'icon': Icons.sports_soccer},
          {'type': 'letter', 'value': 'C', 'match': 'Cat', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Cat', 'match': 'C', 'icon': Icons.pets},
          {'type': 'letter', 'value': 'D', 'match': 'Dog', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Dog', 'match': 'D', 'icon': Icons.pets},
          {'type': 'letter', 'value': 'E', 'match': 'Elephant', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Elephant', 'match': 'E', 'icon': Icons.pets},
        ];
        break;
      case 'number_quantity':
        items = [
          {'type': 'number', 'value': '1', 'match': 'One', 'icon': Icons.numbers},
          {'type': 'quantity', 'value': 'One', 'match': '1', 'icon': Icons.star},
          {'type': 'number', 'value': '2', 'match': 'Two', 'icon': Icons.numbers},
          {'type': 'quantity', 'value': 'Two', 'match': '2', 'icon': Icons.favorite},
          {'type': 'number', 'value': '3', 'match': 'Three', 'icon': Icons.numbers},
          {'type': 'quantity', 'value': 'Three', 'match': '3', 'icon': Icons.circle},
          {'type': 'number', 'value': '4', 'match': 'Four', 'icon': Icons.numbers},
          {'type': 'quantity', 'value': 'Four', 'match': '4', 'icon': Icons.square},
          {'type': 'number', 'value': '5', 'match': 'Five', 'icon': Icons.numbers},
          {'type': 'quantity', 'value': 'Five', 'match': '5', 'icon': Icons.pentagon},
        ];
        break;
      case 'animal_sound':
        items = [
          {'type': 'animal', 'value': 'Dog', 'match': 'Woof', 'icon': Icons.pets},
          {'type': 'sound', 'value': 'Woof', 'match': 'Dog', 'icon': Icons.volume_up},
          {'type': 'animal', 'value': 'Cat', 'match': 'Meow', 'icon': Icons.pets},
          {'type': 'sound', 'value': 'Meow', 'match': 'Cat', 'icon': Icons.volume_up},
          {'type': 'animal', 'value': 'Cow', 'match': 'Moo', 'icon': Icons.pets},
          {'type': 'sound', 'value': 'Moo', 'match': 'Cow', 'icon': Icons.volume_up},
          {'type': 'animal', 'value': 'Duck', 'match': 'Quack', 'icon': Icons.pets},
          {'type': 'sound', 'value': 'Quack', 'match': 'Duck', 'icon': Icons.volume_up},
          {'type': 'animal', 'value': 'Lion', 'match': 'Roar', 'icon': Icons.pets},
          {'type': 'sound', 'value': 'Roar', 'match': 'Lion', 'icon': Icons.volume_up},
        ];
        break;
      case 'shape_name':
        items = [
          {'type': 'shape', 'value': '🔺', 'match': 'Triangle', 'icon': Icons.category},
          {'type': 'name', 'value': 'Triangle', 'match': '🔺', 'icon': Icons.text_fields},
          {'type': 'shape', 'value': '⬜', 'match': 'Square', 'icon': Icons.category},
          {'type': 'name', 'value': 'Square', 'match': '⬜', 'icon': Icons.text_fields},
          {'type': 'shape', 'value': '⭕', 'match': 'Circle', 'icon': Icons.category},
          {'type': 'name', 'value': 'Circle', 'match': '⭕', 'icon': Icons.text_fields},
          {'type': 'shape', 'value': '🔷', 'match': 'Diamond', 'icon': Icons.category},
          {'type': 'name', 'value': 'Diamond', 'match': '🔷', 'icon': Icons.text_fields},
          {'type': 'shape', 'value': '⭐', 'match': 'Star', 'icon': Icons.category},
          {'type': 'name', 'value': 'Star', 'match': '⭐', 'icon': Icons.text_fields},
        ];
        break;
      default:
        // Default to alphabet + object if type is not recognized
        items = [
          {'type': 'letter', 'value': 'A', 'match': 'Apple', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Apple', 'match': 'A', 'icon': Icons.apple},
          {'type': 'letter', 'value': 'B', 'match': 'Ball', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Ball', 'match': 'B', 'icon': Icons.sports_soccer},
          {'type': 'letter', 'value': 'C', 'match': 'Cat', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Cat', 'match': 'C', 'icon': Icons.pets},
          {'type': 'letter', 'value': 'D', 'match': 'Dog', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Dog', 'match': 'D', 'icon': Icons.pets},
          {'type': 'letter', 'value': 'E', 'match': 'Elephant', 'icon': Icons.abc},
          {'type': 'object', 'value': 'Elephant', 'match': 'E', 'icon': Icons.pets},
        ];
    }

    // Shuffle the items
    shuffledItems = List.from(items)..shuffle();
  }

  void _handleCardTap(int index) {
    if (matchedPairs.contains(index) || selectedIndex == index) {
      return;
    }

    setState(() {
      if (selectedIndex == null) {
        // First card selected
        selectedIndex = index;
      } else {
        // Second card selected
        attempts++;
        
        if (shuffledItems[selectedIndex!]['match'] == shuffledItems[index]['value'] &&
            shuffledItems[selectedIndex!]['value'] == shuffledItems[index]['match']) {
          // Match found
          matchedIndex = index;
          matchedPairs.add(selectedIndex!);
          matchedPairs.add(index);
          score += 10;
          
          // Check if game is complete
          if (matchedPairs.length == shuffledItems.length) {
            isGameComplete = true;
          }
          
          // Reset selection after a delay
          Future.delayed(const Duration(milliseconds: 500), () {
            setState(() {
              selectedIndex = null;
              matchedIndex = null;
            });
          });
        } else {
          // No match
          matchedIndex = index;
          
          // Reset selection after a delay
          Future.delayed(const Duration(milliseconds: 1000), () {
            setState(() {
              selectedIndex = null;
              matchedIndex = null;
            });
          });
        }
      }
    });
  }

  void _resetGame() {
    setState(() {
      selectedIndex = null;
      matchedIndex = null;
      matchedPairs = [];
      score = 0;
      attempts = 0;
      isGameComplete = false;
      shuffledItems = List.from(items)..shuffle();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: AppTheme.titleStyle.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: _resetGame,
            tooltip: 'Reset Game',
          ),
        ],
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
              Padding(
                padding: const EdgeInsets.all(AppTheme.defaultPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Score: $score',
                      style: AppTheme.titleStyle.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    Text(
                      'Attempts: $attempts',
                      style: AppTheme.titleStyle.copyWith(
                        fontSize: 20,
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              if (isGameComplete)
                Container(
                  margin: const EdgeInsets.all(AppTheme.defaultPadding),
                  padding: const EdgeInsets.all(AppTheme.defaultPadding),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                    border: Border.all(color: Colors.green),
                  ),
                  child: Column(
                    children: [
                      Text(
                        'Congratulations!',
                        style: AppTheme.titleStyle.copyWith(
                          fontSize: 24,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(height: AppTheme.defaultPadding / 2),
                      Text(
                        'You completed the game with $attempts attempts',
                        style: AppTheme.subtitleStyle.copyWith(
                          color: Colors.green,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppTheme.defaultPadding),
                      ElevatedButton(
                        onPressed: _resetGame,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.defaultPadding * 2,
                            vertical: AppTheme.defaultPadding,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                          ),
                        ),
                        child: const Text('Play Again'),
                      ),
                    ],
                  ),
                ).animate().fadeIn(duration: AppTheme.mediumAnimation),
              Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.all(AppTheme.defaultPadding),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: MediaQuery.of(context).size.width > AppTheme.tabletBreakpoint ? 5 : 3,
                    childAspectRatio: 1.0,
                    crossAxisSpacing: AppTheme.defaultPadding,
                    mainAxisSpacing: AppTheme.defaultPadding,
                  ),
                  itemCount: shuffledItems.length,
                  itemBuilder: (context, index) {
                    final item = shuffledItems[index];
                    final isSelected = selectedIndex == index;
                    final isMatched = matchedIndex == index;
                    final isMatchedPair = matchedPairs.contains(index);
                    
                    Color cardColor;
                    if (isMatchedPair) {
                      cardColor = Colors.green;
                    } else if (isSelected || isMatched) {
                      cardColor = Theme.of(context).colorScheme.primary;
                    } else {
                      cardColor = Theme.of(context).colorScheme.secondary;
                    }
                    
                    return GestureDetector(
                      onTap: () => _handleCardTap(index),
                      child: Card(
                        elevation: AppTheme.cardElevation,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            color: cardColor,
                            borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                            boxShadow: [
                              BoxShadow(
                                color: cardColor.withOpacity(0.3),
                                blurRadius: 10,
                                spreadRadius: 2,
                              ),
                            ],
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  item['icon'],
                                  size: AppTheme.mediumIconSize,
                                  color: Colors.white,
                                ),
                                const SizedBox(height: AppTheme.defaultPadding / 2),
                                Text(
                                  item['value'],
                                  style: AppTheme.titleStyle.copyWith(
                                    fontSize: 20,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ).animate().scale(
                        duration: AppTheme.quickAnimation,
                        curve: Curves.easeInOut,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 