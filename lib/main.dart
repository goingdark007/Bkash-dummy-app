import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/app_colors.dart';
import 'ui/presentation/screens/home/providers/home_provider.dart';
import 'ui/presentation/screens/home/views/home_screen.dart';
import 'ui/presentation/screens/login/login_screen.dart';
import 'ui/presentation/screens/splash/splash_screen.dart';

void main() {
  runApp(
      MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => HomeProvider()),
          ],
        child: const MyApp()
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorSchemeSeed: AppColors.primary,
        scaffoldBackgroundColor: Colors.white
      ),
      initialRoute: SplashScreen.routeName,
      routes:  {
          SplashScreen.routeName: (context) => const SplashScreen(),
          HomeScreen.routeName: (context) => const HomeScreen(),
          LoginScreen.routeName: (context) => const LoginScreen(),
      },

    );
  }
}
