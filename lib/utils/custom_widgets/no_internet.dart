import 'package:ecommerce_store/utils/constants.dart';
import 'package:ecommerce_store/utils/custom_widgets/svg_image.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({super.key, this.onBtnPress});

  final VoidCallback? onBtnPress;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 15,
          children: [
            Text(
                'No Internet',
                style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  color: Colors.red
                )
            ),
            const SvgAssetImage(assetName: 'no_connection'),
            ElevatedButton(
                onPressed: onBtnPress,
                child: const Text(
                  'Retry',
                  style: TextStyle(
                    color: primaryCreamWhite,
                    fontWeight: FontWeight.bold
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}