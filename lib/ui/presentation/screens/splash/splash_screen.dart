import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';
import '../../../utils/asset_paths.dart';
import '../home/views/home_screen.dart';

class SplashScreen extends StatefulWidget {

  static const String routeName = '/splash';

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> with SingleTickerProviderStateMixin {
  
  late final AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  

  Future<void> _moveToHomeScreen() async {
    await Future.delayed(const Duration(seconds: 3));
    if(!mounted) return;
    Navigator.pushReplacementNamed(context, HomeScreen.routeName);
  }


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.elasticOut, // ← the bounce magic
    );
    _animationController.forward();
    _moveToHomeScreen();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: ScaleTransition(
        scale: _scaleAnimation,
        child: Center(
          child: Image.asset(
              AssetPaths.splash,
              width: 200,
              height: 200
          ),
        ),
      ),
    );
  }
}