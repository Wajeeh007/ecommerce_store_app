import 'package:ecommerce_store/utils/constants.dart';
import 'package:flutter/material.dart';

class AnimatedCircleIndicator extends StatelessWidget {

  final int length, currentIndex;

  const AnimatedCircleIndicator({
    super.key,
    required this.length,
    required this.currentIndex
  }) : assert(length != 0, 'Length cannot be zero');

  @override
  Widget build(BuildContext context) {
    return Row(
        children: List.generate(
          length, (index) => AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          height: 6.0,
          width: 6.0,
          margin: const EdgeInsets.only(right: 4.0),
          decoration: BoxDecoration(
            color: currentIndex == index ? primaryDarkBrown : primaryLightBrown,
            borderRadius: BorderRadius.circular(8.0),
          ),
        ),
        )
    );
  }
}
