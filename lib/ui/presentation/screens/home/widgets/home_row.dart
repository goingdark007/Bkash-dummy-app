
import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';
import '../../../../../core/app_strings.dart';

class HomeRow extends StatelessWidget {

  final String text;
  final IconData icon;
  final String sideText;

  const HomeRow({
    super.key, required this.text, required this.icon, required this.sideText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 23.0),
      child: Row(

        children: [
          Text(text, style: TextStyle(fontSize: 16, color: AppColors.textGrey, fontWeight: FontWeight.w600),),
          const Spacer(),
          GestureDetector(
            onTap: () {},
            child: Row(
              children: [
                Icon(icon, size: 24, color: AppColors.primary,),
                const SizedBox(width: 5),
                Text(sideText, style: TextStyle(color: AppColors.primary, fontWeight: FontWeight.w500, fontSize: 16),),
              ],
            ),
          )
        ],
      ),
    );
  }
}