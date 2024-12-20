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

class CustomNormalButton extends StatelessWidget {

  final double? width, height;
  final String? btnText;
  final Widget? btnChild;
  final VoidCallback onBtnPress;
  final Color? btnBgColor;

  const CustomNormalButton({
    super.key,
    required this.onBtnPress,
    this.btnText,
    this.width,
    this.height,
    this.btnChild,
    this.btnBgColor
  }) : assert(btnChild == null || btnText == null, 'Cannot provide both text and child'),
      assert(btnChild != null || btnText != null, 'Must provide text or child');

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onBtnPress,
      splashFactory: NoSplash.splashFactory,
      child: Container(
        alignment: Alignment.center,
        width: width ?? double.infinity,
        height: height ?? 45,
        decoration: BoxDecoration(
          color: btnBgColor ?? secondaryDarkBrown,
          borderRadius: buttonsRadius
        ),
        child: btnChild ?? Text(
          btnText!,
          style: Theme.of(context).textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
            color: primaryCreamWhite
          ),
        ),
      ),
    );
  }
}

class CustomTextButton extends StatelessWidget {
  
  final String btnText;
  final VoidCallback onBtnPress;

  const CustomTextButton({
    super.key,
    required this.btnText, 
    required this.onBtnPress
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onBtnPress,
        child: Text(
          btnText, 
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            decoration: TextDecoration.underline,
            decorationColor: primaryCreamWhite,
            color: primaryCreamWhite
          ),
        )
    );
  }
}
