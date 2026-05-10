import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_strings.dart';

class HomeCards extends StatelessWidget {
  const HomeCards({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Row(
        children: [
          Container(
            height: 180,
            width: 150,
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(60),
                borderRadius: BorderRadius.all(Radius.elliptical(6, 8))
            ),
            child: Column(
              crossAxisAlignment: .start,
              children: [
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Stack(
                    alignment: .center,
                    children: [
                      Container(
                        height: 90,
                        width: 90,
                        decoration: BoxDecoration(
                            color: AppColors.white,
                            shape: BoxShape.circle
                        ),
                      ),
                      Icon(Icons.card_giftcard_rounded, size: 56, color: Colors.orange)
                    ],
                  ),
                ),
                const SizedBox(height: 15),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text(AppStrings.myOffers, style: TextStyle(fontSize: 16, color: AppColors.black, fontWeight: FontWeight.w600)),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Text('Tap to explore', style: TextStyle(fontSize: 14, color: AppColors.textGrey, fontWeight: FontWeight.w500)),
                ),

              ],
            ),
          )
        ],
      ),
    );
  }
}