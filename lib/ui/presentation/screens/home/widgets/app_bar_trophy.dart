import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';

class AppBarTrophy extends StatelessWidget {
  const AppBarTrophy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(Icons.emoji_events_rounded, size: 44, color: AppColors.white),
        Positioned(
            top: 8,
            left: 14.5,
            child: Icon(Icons.star, size: 15, color: AppColors.primary,
            )
        )
      ],
    );
  }
}