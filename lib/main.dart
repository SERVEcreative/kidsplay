import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter/services.dart';
import 'constants/theme.dart';
import 'screens/splash_screen.dart';
import 'screens/home_screen.dart';
import 'screens/learning/alphabet_screen.dart';
import 'screens/learning/numbers_screen.dart';
import 'screens/learning/colors_screen.dart';
import 'screens/learning/shapes_screen.dart';
import 'screens/learning/animals_screen.dart';
import 'screens/learning/matching_screen.dart';
import 'screens/learning/rhymes_screen.dart';
import 'services/ads_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AdsService().initialize();
  
  // Set system UI overlay style
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Colors.white,
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NSORA Learning',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppTheme.primaryGreen,
          brightness: Brightness.light,
        ),
        textTheme: GoogleFonts.poppinsTextTheme(),
        useMaterial3: true,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            statusBarIconBrightness: Brightness.light,
            systemNavigationBarColor: Colors.white,
            systemNavigationBarIconBrightness: Brightness.dark,
          ),
          backgroundColor: AppTheme.primaryGreen,
          foregroundColor: Colors.white,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: AppTheme.titleStyle.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
          elevation: 4,
          shadowColor: Colors.black26,
        ),
        cardTheme: CardTheme(
          elevation: AppTheme.cardElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
          ),
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/home': (context) => const HomeScreen(),
        '/alphabets': (context) => const AlphabetScreen(),
        '/numbers': (context) => const NumbersScreen(),
        '/colors': (context) => const ColorsScreen(),
        '/shapes': (context) => const ShapesScreen(),
        '/animals': (context) => const AnimalsScreen(),
        '/matching': (context) => const MatchingScreen(),
        '/rhymes': (context) => const RhymesScreen(),
      },
    );
  }
}

class PlaceholderScreen extends StatelessWidget {
  final String title;

  const PlaceholderScreen({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
          style: AppTheme.titleStyle.copyWith(
            color: Theme.of(context).colorScheme.onPrimary,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(AppTheme.defaultPadding),
          child: Text(
            '$title Screen Coming Soon!',
            style: AppTheme.titleStyle.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ).animate().fadeIn(duration: AppTheme.mediumAnimation),
      ),
    );
  }
} 