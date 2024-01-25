import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class ImageSvgWidget extends StatelessWidget {
  final String url;
  final double? width;
  final double? height;
  final ColorFilter? color;
  final BoxFit fit;

  const ImageSvgWidget({Key? key,
    required this.url,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.cover,
  }) : super(key: key);


  Widget buildAssetSvgImage() {
    return SvgPicture.asset(
      url,
      width: width,
      height: height,
      colorFilter: color,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    throw UnimplementedError();
  }
}