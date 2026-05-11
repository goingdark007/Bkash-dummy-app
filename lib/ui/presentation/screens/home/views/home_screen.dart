import 'package:flutter/material.dart';
import 'package:of25_bkash_app/core/app_strings.dart';


import '../../../../../core/app_colors.dart';
import '../../../../utils/asset_paths.dart';
import '../widgets/app_bar_bkash.dart';
import '../widgets/app_bar_trophy.dart';
import '../widgets/home_app_bar.dart';
import '../widgets/home_cards.dart';
import '../widgets/home_row.dart';
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
          child: Column(
            children: [
              MenuGrid(),
              const SizedBox(height: 15),
              Image.asset(AssetPaths.offerBanner,),
              const SizedBox(height: 15),
              HomeRow(text: AppStrings.myBkash, icon: Icons.tune_rounded, sideText: 'Edit'),
              const SizedBox(height: 10),
              HomeCards(),
              const SizedBox(height: 15),
              HomeRow(text: 'bkash bundle', icon: Icons.arrow_drop_down_rounded, sideText: 'See all'),
              const SizedBox(height: 20),
            ],
          )
      ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primary,
        unselectedItemColor: AppColors.textGrey,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 30), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.qr_code_scanner_rounded, size: 30), label: 'Scan QR'),
          BottomNavigationBarItem(icon: Icon(Icons.search_rounded, size: 30), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.mail_rounded, size: 30), label: 'Inbox'),
        ],
      ),

    );
  }
}




