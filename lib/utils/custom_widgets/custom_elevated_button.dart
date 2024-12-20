import 'package:ecommerce_store/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomElevatedButton extends StatelessWidget {
  const CustomElevatedButton({
    super.key,
    required this.onBtnPress,
    this.btnText,
    this.child,
    this.btnIcon
  }) : assert(child == null || (btnText == null && btnIcon == null), 'Cannot use child property with btnText and btnIcon'),
  assert(child != null || btnText != null || btnIcon != null, 'Provide child, btnText or btnIcon property');

  final VoidCallback onBtnPress;
  final String? btnText;
  final Widget? child;
  final IconData? btnIcon;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onBtnPress,
        child: child ?? Row(
          spacing: 5,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            btnText != null ? Text(btnText!, style: Theme.of(context).textTheme.labelMedium?.copyWith(
              fontWeight: FontWeight.w600,
              color: primaryWhite
            )) : const SizedBox(),
            btnIcon != null ? Icon(btnIcon!, size: 17, color: primaryWhite,) : const SizedBox()
          ],
        )
    );
  }
}