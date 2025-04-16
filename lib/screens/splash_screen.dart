import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../constants/theme.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(AppTheme.longAnimation, () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => const HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(AppTheme.defaultPadding * 2),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(AppTheme.cardBorderRadius),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: Icon(
                Icons.school,
                size: AppTheme.largeIconSize,
                color: AppTheme.primaryGreen,
              ),
            )
                .animate()
                .scale(duration: AppTheme.mediumAnimation)
                .then()
                .shake(duration: AppTheme.mediumAnimation),
            const SizedBox(height: AppTheme.defaultPadding * 2),
            Text(
              'NSORA Learning',
              style: AppTheme.titleStyle.copyWith(fontSize: 32),
            )
                .animate()
                .fadeIn(duration: AppTheme.mediumAnimation)
                .slideY(begin: 0.3, curve: Curves.easeOutQuad),
            const SizedBox(height: AppTheme.defaultPadding),
            Text(
              'Fun Learning for Kids',
              style: AppTheme.subtitleStyle.copyWith(fontSize: 18),
            )
                .animate()
                .fadeIn(duration: AppTheme.mediumAnimation)
                .slideY(begin: 0.3, curve: Curves.easeOutQuad),
          ],
        ),
      ),
    );
  }
} 