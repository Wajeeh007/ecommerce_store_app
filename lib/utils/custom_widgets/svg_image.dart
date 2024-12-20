import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgAssetImage extends StatelessWidget {

  /// Just provide name of the asset. File extension is not required as it
  /// always will be an SVG
  final String assetName;
  final double? width, height;

  const SvgAssetImage({super.key, required this.assetName, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
        "assets/svg_vectors/$assetName.svg",
      height: height ?? MediaQuery.of(context).size.height * 0.3,
      width:  width ?? MediaQuery.of(context).size.width * 0.85,
    );
  }
}