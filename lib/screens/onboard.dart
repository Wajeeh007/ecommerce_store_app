import 'package:ecommerce_store/utils/constants.dart';
import 'package:ecommerce_store/utils/custom_widgets/animated_circle_indicator.dart';
import 'package:ecommerce_store/utils/custom_widgets/svg_image.dart';
import 'package:flutter/material.dart';
import '../utils/custom_widgets/custom_elevated_button.dart';

PageController pageController = PageController();

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 15
          ),
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: pageController,
          children: const [
          OnboardScreenWidget(
              svgAssetName: 'onboard_one',
              primaryTitle: 'Welcome To',
              secondaryTitle: 'E-Commerce Store',
              btnText: 'Next',
              currentIndex: 0
          ),
            OnboardScreenWidget(
                svgAssetName: 'onboard_two',
                primaryTitle: 'Trendy Outfits',
                secondaryTitle: 'Discover',
                btnText: 'Next',
                currentIndex: 1
            ),
            OnboardScreenWidget(
                svgAssetName: 'onboard_three',
                primaryTitle: 'For Grace',
                secondaryTitle: 'Tailor Just',
                btnText: 'Continue',
                currentIndex: 2
            ),
          ],
        ),
      ),
    );
  }
}

/// This widget is used to create individual on-board screen
class OnboardScreenWidget extends StatelessWidget {
  const OnboardScreenWidget({
    super.key,
    required this.svgAssetName,
    required this.primaryTitle,
    required this.secondaryTitle,
    required this.btnText,
    required this.currentIndex,
    this.descText
  });

  final String svgAssetName, secondaryTitle, primaryTitle, btnText;
  final String? descText;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
            child: SvgAssetImage(assetName: svgAssetName)
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            Text(secondaryTitle, style: Theme.of(context).textTheme.bodyMedium,),
            Text(primaryTitle, style: Theme.of(context).textTheme.titleSmall?.copyWith(color: secondaryDarkBrown),),
            descText != null ? Text(descText!, style: Theme.of(context).textTheme.labelMedium,) : const SizedBox(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedCircleIndicator(length: 3, currentIndex: currentIndex),
                Row(
                  spacing: 15,
                  children: [
                    if(currentIndex > 0) ElevatedButton(
                      onPressed: () {
                        pageController.previousPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInQuint);
                      },
                      child: Row(
                        spacing: 5,
                        children: [
                          const Icon(Icons.arrow_back_ios_new_rounded, size: 17, color: primaryWhite,),
                          Text('Back', style:  Theme.of(context).textTheme.labelMedium?.copyWith(fontWeight: FontWeight.w600, color: primaryWhite),)
                        ],
                      ),
                    ),
                    CustomElevatedButton(onBtnPress: () {
                      if(currentIndex < 2) {
                        pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInQuint);
                      } else {
                        //TODO: Proceed to auth screen
                      }
                    }, btnText: btnText, btnIcon: Icons.arrow_forward_ios_rounded,),
                  ],
                ),
              ],
            )
          ],
        )
      ],
    );
  }
}