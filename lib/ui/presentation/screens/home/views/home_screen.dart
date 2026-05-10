import 'package:flutter/material.dart';


import '../../../../../core/app_colors.dart';
import '../widgets/app_bar_bkash.dart';
import '../widgets/app_bar_trophy.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/menu_grid.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = '/home';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: HomeAppBar(),
        toolbarHeight: 75,
        backgroundColor: AppColors.primary,
        bottom: PreferredSize(preferredSize: Size.fromHeight(15), child: SizedBox.shrink()),
        actions: [
          AppBarTrophy(),
          const SizedBox(width: 15),
          AppBarBkash(),
          const SizedBox(width: 15),
        ],
      ),

      body: SingleChildScrollView(
          child: MenuGrid()
      ),

    );
  }
}




