import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../constants/theme.dart';
import 'matching_game_screen.dart';

class MatchingScreen extends StatelessWidget {
  const MatchingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> levels = [
      {
        'title': 'Alphabet + Object',
        'description': 'Match letters with their corresponding objects',
        'icon': Icons.abc,
        'color': AppTheme.primaryBlue,
        'type': 'alphabet_object',
        'level': 1,
      },
      {
        'title': 'Number + Quantity',
        'description': 'Match numbers with their quantities',
        'icon': Icons.numbers,
        'color': AppTheme.primaryRed,
        'type': 'number_quantity',
        'level': 2,
      },
      {
        'title': 'Animal + Sound',
        'description': 'Match animals with their sounds',
        'icon': Icons.pets,
        'color': AppTheme.primaryGreen,
        'type': 'animal_sound',
        'level': 3,
      },
      {
        'title': 'Shape + Name',
        'description': 'Match shapes with their names',
        'icon': Icons.category,
        'color': AppTheme.primaryYellow,
        'type': 'shape_name',
        'level': 4,
      },
      {
        'title': 'Color + Object',
        'description': 'Match colors with objects of that color',
        'icon': Icons.palette,
        'color': AppTheme.primaryPurple,
        'type': 'color_object',
        'level': 5,
      },
      {
        'title': 'Fruit + Letter',
        'description': 'Match fruits with their starting letters',
        'icon': Icons.apple,
        'color': AppTheme.primaryOrange,
        'type': 'fruit_letter',
        'level': 6,
      },
      {
        'title': 'Vehicle + Sound',
        'description': 'Match vehicles with their sounds',
        'icon': Icons.directions_car,
        'color': AppTheme.primaryBlue,
        'type': 'vehicle_sound',
        'level': 7,
      },
      {
        'title': 'Weather + Icon',
        'description': 'Match weather conditions with their icons',
        'icon': Icons.wb_sunny,
        'color': AppTheme.primaryRed,
        'type': 'weather_icon',
        'level': 8,
      },
      {
        'title': 'Emotion + Face',
        'description': 'Match emotions with facial expressions',
        'icon': Icons.emoji_emotions,
        'color': AppTheme.primaryGreen,
        'type': 'emotion_face',
        'level': 9,
      },
      {
        'title': 'Season + Activity',
        'description': 'Match seasons with typical activities',
        'icon': Icons.beach_access,
        'color': AppTheme.primaryYellow,
        'type': 'season_activity',
        'level': 10,
      },
      {
        'title': 'Time + Activity',
        'description': 'Match times of day with activities',
        'icon': Icons.access_time,
        'color': AppTheme.primaryPurple,
        'type': 'time_activity',
        'level': 11,
      },
      {
        'title': 'Body Part + Function',
        'description': 'Match body parts with their functions',
        'icon': Icons.face,
        'color': AppTheme.primaryOrange,
        'type': 'body_function',
        'level': 12,
      },
      {
        'title': 'Food + Category',
        'description': 'Match foods with their categories',
        'icon': Icons.restaurant,
        'color': AppTheme.primaryBlue,
        'type': 'food_category',
        'level': 13,
      },
      {
        'title': 'Clothing + Season',
        'description': 'Match clothing items with appropriate seasons',
        'icon': Icons.checkroom,
        'color': AppTheme.primaryRed,
        'type': 'clothing_season',
        'level': 14,
      },
      {
        'title': 'Instrument + Sound',
        'description': 'Match musical instruments with their sounds',
        'icon': Icons.music_note,
        'color': AppTheme.primaryGreen,
        'type': 'instrument_sound',
        'level': 15,
      },
      {
        'title': 'Job + Tool',
        'description': 'Match jobs with their tools',
        'icon': Icons.work,
        'color': AppTheme.primaryYellow,
        'type': 'job_tool',
        'level': 16,
      },
      {
        'title': 'Sport + Equipment',
        'description': 'Match sports with their equipment',
        'icon': Icons.sports_soccer,
        'color': AppTheme.primaryPurple,
        'type': 'sport_equipment',
        'level': 17,
      },
      {
        'title': 'Planet + Characteristic',
        'description': 'Match planets with their characteristics',
        'icon': Icons.public,
        'color': AppTheme.primaryOrange,
        'type': 'planet_characteristic',
        'level': 18,
      },
      {
        'title': 'Continent + Animal',
        'description': 'Match continents with their native animals',
        'icon': Icons.map,
        'color': AppTheme.primaryBlue,
        'type': 'continent_animal',
        'level': 19,
      },
      {
        'title': 'Holiday + Symbol',
        'description': 'Match holidays with their symbols',
        'icon': Icons.celebration,
        'color': AppTheme.primaryRed,
        'type': 'holiday_symbol',
        'level': 20,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Matching Games',
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
          child: GridView.builder(
            padding: const EdgeInsets.all(AppTheme.defaultPadding),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: MediaQuery.of(context).size.width > AppTheme.tabletBreakpoint ? 4 : 2,
              childAspectRatio: 1.0,
              crossAxisSpacing: AppTheme.defaultPadding,
              mainAxisSpacing: AppTheme.defaultPadding,
            ),
            itemCount: levels.length,
            itemBuilder: (context, index) {
              final level = levels[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MatchingGameScreen(
                        title: level['title'],
                        type: level['type'],
                        level: level['level'],
                      ),
                    ),
                  );
                },
                child: Card(
                  elevation: AppTheme.cardElevation,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      color: level['color'],
                      borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                      boxShadow: [
                        BoxShadow(
                          color: level['color'].withOpacity(0.3),
                          blurRadius: 10,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(AppTheme.defaultPadding),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            level['icon'],
                            size: AppTheme.largeIconSize,
                            color: Colors.white,
                          ),
                          const SizedBox(height: AppTheme.defaultPadding),
                          Text(
                            level['title'],
                            style: AppTheme.titleStyle.copyWith(
                              fontSize: 16,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          Text(
                            level['description'],
                            style: AppTheme.subtitleStyle.copyWith(
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: AppTheme.defaultPadding / 2),
                          Text(
                            'Level ${level['level']}',
                            style: AppTheme.subtitleStyle.copyWith(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                            ),
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
      ),
    );
  }
} 