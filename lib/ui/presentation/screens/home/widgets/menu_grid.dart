import 'package:flutter/material.dart';
import 'package:of25_bkash_app/data/models/home_menu_item_model.dart';
import 'package:provider/provider.dart';

import '../../../../../core/app_colors.dart';
import '../providers/home_provider.dart';
import 'menu_grid_item.dart';

class MenuGrid extends StatefulWidget {
  const MenuGrid({
    super.key,
  });

  @override
  State<MenuGrid> createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> with SingleTickerProviderStateMixin {

  late final AnimationController _animationController;
  late final Animation<double> rotateAnimation;
  late final Animation<double> fadeAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    rotateAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));
    fadeAnimation = Tween<double>(begin: 0.7, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.0, 0.2,curve: Curves.easeIn),
      reverseCurve: const Interval(0.0, 0.2, curve: Curves.easeOut)
    ));
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {

        final menuItems = provider.limitedVisibleItems;
        final remainingItems = provider.remainingItems;

        return Column(
          children: [
            buildGridView(menuItems),
            AnimatedSize(
              duration: const Duration(milliseconds: 600),
              reverseDuration: const Duration(milliseconds: 500),
              curve: Curves.easeInOut,
              alignment: Alignment.topCenter,
              child: provider.isExpanded
                  ? buildGridView(remainingItems)
                  : const SizedBox.shrink(),
            ),
            Stack(
              alignment: .center,
              children: [
                if(!provider.isExpanded)
                  FadeTransition(
                    opacity: fadeAnimation,
                    child: Opacity(
                      opacity: 0.7,
                      child: Row(
                        spacing: 12,
                        children: [

                          for(int i=0; i< provider.lastFourItems.length; i++)
                            MenuGridItem(item: provider.lastFourItems[i])

                        ],
                      ),
                    ),
                  ),

                Container(
                  height: 70,

                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [

                            Colors.white.withAlpha(100),
                            Colors.white.withAlpha(80),
                            Colors.white.withAlpha(70),
                            Colors.white,

                          ]
                      ),
                    ),
                ),
                OutlinedButton.icon(
                    onPressed: () {
                      provider.toggleExpanded();
                      if(_animationController.isCompleted){
                        _animationController.reverse();
                      } else {
                        _animationController.forward();
                      }

                      },
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: AppColors.primary, width: 1.5),
                        backgroundColor: AppColors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.elliptical(8, 6))
                        ),
                        //padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6)
                    ),
                    label: Text(
                      provider.isExpanded ? 'Show Less' : 'Show More',
                      style: TextStyle(
                          fontSize: 14,
                          color: AppColors.primary,
                          fontWeight: FontWeight.w500
                      ),
                    ),
                    icon: RotationTransition(
                        turns: rotateAnimation,
                        child: Icon(Icons.keyboard_arrow_down, color: AppColors.primary))
                ),
              ],
            )
          ],
        );
      },
    );
  }

  GridView buildGridView(List<HomeMenuItemModel> menuItems) {
    return GridView.builder(
              shrinkWrap: true,
              padding: .zero,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 16,
                crossAxisSpacing: 8,
                childAspectRatio: 0.78,
              ),
              itemCount: menuItems.length,
              itemBuilder: (context, index){
                return MenuGridItem(item: menuItems[index]);
              }
          );
  }
}