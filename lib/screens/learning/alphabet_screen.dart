import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/theme.dart';

class AlphabetScreen extends StatefulWidget {
  const AlphabetScreen({super.key});

  @override
  State<AlphabetScreen> createState() => _AlphabetScreenState();
}

class _AlphabetScreenState extends State<AlphabetScreen> {
  final List<Map<String, dynamic>> alphabets = [
    {'letter': 'A', 'word': 'Apple', 'color': AppTheme.primaryRed, 'image': 'assets/images/alphabet/a_apple.png'},
    {'letter': 'B', 'word': 'Ball', 'color': AppTheme.primaryBlue, 'image': 'assets/images/alphabet/b_ball.png'},
    {'letter': 'C', 'word': 'Cat', 'color': AppTheme.primaryGreen, 'image': 'assets/images/alphabet/c_cat.png'},
    {'letter': 'D', 'word': 'Dog', 'color': AppTheme.primaryYellow, 'image': 'assets/images/alphabet/d_dog.png'},
    {'letter': 'E', 'word': 'Elephant', 'color': AppTheme.primaryPurple, 'image': 'assets/images/alphabet/e_elephant.png'},
    {'letter': 'F', 'word': 'Fish', 'color': AppTheme.primaryRed, 'image': 'assets/images/alphabet/f_fish.png'},
    {'letter': 'G', 'word': 'Giraffe', 'color': AppTheme.primaryBlue, 'image': 'assets/images/alphabet/g_giraffe.png'},
    {'letter': 'H', 'word': 'House', 'color': AppTheme.primaryGreen, 'image': 'assets/images/alphabet/h_house.png'},
    {'letter': 'I', 'word': 'Ice Cream', 'color': AppTheme.primaryYellow, 'image': 'assets/images/alphabet/i_icecream.png'},
    {'letter': 'J', 'word': 'Jellyfish', 'color': AppTheme.primaryPurple, 'image': 'assets/images/alphabet/j_jellyfish.png'},
    {'letter': 'K', 'word': 'Kite', 'color': AppTheme.primaryRed, 'image': 'assets/images/alphabet/k_kite.png'},
    {'letter': 'L', 'word': 'Lion', 'color': AppTheme.primaryBlue, 'image': 'assets/images/alphabet/l_lion.png'},
    {'letter': 'M', 'word': 'Monkey', 'color': AppTheme.primaryGreen, 'image': 'assets/images/alphabet/m_monkey.png'},
    {'letter': 'N', 'word': 'Nest', 'color': AppTheme.primaryYellow, 'image': 'assets/images/alphabet/n_nest.png'},
    {'letter': 'O', 'word': 'Orange', 'color': AppTheme.primaryPurple, 'image': 'assets/images/alphabet/o_orange.png'},
    {'letter': 'P', 'word': 'Panda', 'color': AppTheme.primaryRed, 'image': 'assets/images/alphabet/p_panda.png'},
    {'letter': 'Q', 'word': 'Queen', 'color': AppTheme.primaryBlue, 'image': 'assets/images/alphabet/q_queen.png'},
    {'letter': 'R', 'word': 'Rabbit', 'color': AppTheme.primaryGreen, 'image': 'assets/images/alphabet/r_rabbit.png'},
    {'letter': 'S', 'word': 'Sun', 'color': AppTheme.primaryYellow, 'image': 'assets/images/alphabet/s_sun.png'},
    {'letter': 'T', 'word': 'Tree', 'color': AppTheme.primaryPurple, 'image': 'assets/images/alphabet/t_tree.png'},
    {'letter': 'U', 'word': 'Umbrella', 'color': AppTheme.primaryRed, 'image': 'assets/images/alphabet/u_umbrella.png'},
    {'letter': 'V', 'word': 'Violin', 'color': AppTheme.primaryBlue, 'image': 'assets/images/alphabet/v_violin.png'},
    {'letter': 'W', 'word': 'Watermelon', 'color': AppTheme.primaryGreen, 'image': 'assets/images/alphabet/w_watermelon.png'},
    {'letter': 'X', 'word': 'Xylophone', 'color': AppTheme.primaryYellow, 'image': 'assets/images/alphabet/x_xylophone.png'},
    {'letter': 'Y', 'word': 'Yak', 'color': AppTheme.primaryPurple, 'image': 'assets/images/alphabet/y_yak.png'},
    {'letter': 'Z', 'word': 'Zebra', 'color': AppTheme.primaryRed, 'image': 'assets/images/alphabet/z_zebra.png'},
  ];

  int currentIndex = 0;
  bool isFlipped = false;

  void _nextLetter() {
    setState(() {
      if (currentIndex < alphabets.length - 1) {
        currentIndex++;
        isFlipped = false;
      }
    });
  }

  void _previousLetter() {
    setState(() {
      if (currentIndex > 0) {
        currentIndex--;
        isFlipped = false;
      }
    });
  }

  void _toggleFlip() {
    setState(() {
      isFlipped = !isFlipped;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Learn Alphabets',
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
                    onTap: _toggleFlip,
                    child: AnimatedSwitcher(
                      duration: AppTheme.mediumAnimation,
                      transitionBuilder: (Widget child, Animation<double> animation) {
                        return RotationTransition(
                          turns: Tween<double>(begin: 0.5, end: 1.0).animate(animation),
                          child: child,
                        );
                      },
                      child: Container(
                        key: ValueKey<bool>(isFlipped),
                        width: 280,
                        height: 380,
                        decoration: BoxDecoration(
                          color: alphabets[currentIndex]['color'],
                          borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                          boxShadow: [
                            BoxShadow(
                              color: alphabets[currentIndex]['color'].withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 2,
                            ),
                          ],
                        ),
                        child: Center(
                          child: isFlipped
                              ? Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      alphabets[currentIndex]['image'],
                                      height: 200,
                                      width: 200,
                                      fit: BoxFit.contain,
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Text(
                                      alphabets[currentIndex]['word'],
                                      style: AppTheme.titleStyle.copyWith(fontSize: 32),
                                    ),
                                    const SizedBox(height: AppTheme.defaultPadding),
                                    Icon(
                                      Icons.volume_up,
                                      size: AppTheme.largeIconSize,
                                      color: Colors.white,
                                    ).animate().scale(),
                                  ],
                                )
                              : Text(
                                  alphabets[currentIndex]['letter'],
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
                      onPressed: currentIndex > 0 ? _previousLetter : null,
                      icon: const Icon(Icons.arrow_back),
                      iconSize: AppTheme.mediumIconSize,
                    ).animate().slideX(begin: -0.2),
                    IconButton.filled(
                      onPressed: currentIndex < alphabets.length - 1 ? _nextLetter : null,
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