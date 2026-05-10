import 'package:flutter/material.dart';

import '../../../../../core/app_colors.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({
    super.key,
  });

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> with SingleTickerProviderStateMixin  {

  late final AnimationController _animationController;
  late Animation<double> _tapFadeAnimation;
  late Animation<double> _balanceFadeAnimation;
  late Animation <RelativeRect> _positionAnimation;


  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    _tapFadeAnimation = Tween<double>(begin: 1.0, end: 0.0).animate(CurvedAnimation(
      parent: _animationController,
      curve:  const Interval(0.0, 0.4, curve: Curves.easeIn),
      reverseCurve: const Interval(0.0, 0.4, curve: Curves.easeOut)
    ));
    _balanceFadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _animationController,
      curve: const Interval(0.6, 1.0, curve: Curves.easeOut),
        reverseCurve: const Interval(0.6, 1.0, curve: Curves.easeIn),
    ));
    _positionAnimation = RelativeRectTween(
      begin: RelativeRect.fromLTRB(4, 2, 116, 2),
      end: RelativeRect.fromLTRB(116, 2, 4, 2),
    ).animate(CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    ));

  }

  @override
  void dispose(){
    _animationController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: .center,
      mainAxisAlignment: .start,
      children: [
        CircleAvatar(
          radius: 25,
          backgroundColor: Colors.white,
          child: Icon(Icons.person,size: 35, color: Colors.grey[700]),
        ),
        const SizedBox(width: 10),
        Column(
          mainAxisAlignment: .start,
          crossAxisAlignment: .start,
          children: [
            Text('Nazmul Hasan',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: AppColors.white
                )
            ),
            const SizedBox(height: 5,),
            GestureDetector(
              onTap: () {
                if(_animationController.isCompleted) {
                  _animationController.reverse();

                } else {
                  _animationController.forward();

                }
              },
              child: Stack(
                children: [
                  Container(
                    height: 32,
                    width: 150,
                    decoration: BoxDecoration(
                        color: AppColors.white,
                        borderRadius: BorderRadius.all(Radius.elliptical(6, 6))
                    ),
                  ),
                  Positioned(
                    top: 6,
                    left: 30,
                    child: FadeTransition(
                      opacity: _balanceFadeAnimation,
                      child: Text('\$ 1234', style: TextStyle(
                          fontSize: 16 ,
                          fontWeight: .w500,
                          color: AppColors.primary
                      )
                      ),
                    ),
                  ),
                  Positioned(
                    top: 7,
                    left: 40,
                    child: FadeTransition(
                      opacity: _tapFadeAnimation,
                      child: Text('Tap For Balance', style: TextStyle(
                          fontSize: 14 ,
                          fontWeight: .w500,
                          color: AppColors.primary
                      )
                      ),
                    ),
                  ),
                  PositionedTransition(
                    rect: _positionAnimation,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.all(Radius.elliptical(8, 8))
                      ),
                      child: Icon(Icons.star, color: AppColors.white, size: 16,),
                    ),
                  )
                ],
              ),
            )
          ],
        )
      ],
    );
  }
}