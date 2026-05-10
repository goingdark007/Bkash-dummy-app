import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../../utils/asset_paths.dart';

class AppBarBkash extends StatelessWidget {
  const AppBarBkash({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
            height: 44, width: 48,
            alignment: Alignment.bottomCenter,
            child: Image.asset(AssetPaths.logo, width: 38, height: 38, color: AppColors.white, fit: BoxFit.cover)),
        Positioned(
          top: 0,
          right: 0,
          child: Container(

            decoration: BoxDecoration(
                color: AppColors.primary,
                border: Border.all(color: AppColors.white, width: 2),
                shape: BoxShape.circle
            ),
            child: SizedBox(
              height: 8,
              width: 8,
            ),
          ),
        )
      ],
    );
  }
}