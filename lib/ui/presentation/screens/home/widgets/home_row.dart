
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_strings.dart';

class HomeRow extends StatelessWidget {
  const HomeRow({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Row(

        children: [
          Text(AppStrings.myBkash, style: TextStyle(fontSize: 16, color: AppColors.textGrey, fontWeight: FontWeight.w600),),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(Icons.tune_rounded, size: 24, color: AppColors.primary,),
                const SizedBox(width: 5),
                Text('Edit', style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 16),),
              ],
            ),
          )
        ],
      ),
    );
  }
}