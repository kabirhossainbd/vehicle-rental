import 'package:cached_network_image/cached_network_image.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:flutter/material.dart';


class CustomImage extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final bool isColor;
  final Widget? errorWidget;
  final BoxFit? fit;
  const CustomImage({super.key, required this.imageUrl, this.height = 32, this.width=32, this.isColor = false, this.errorWidget, this.fit});

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty ? Image.asset(
        AllImages.logo,
        height: height,
        width: width,
        fit: fit ?? BoxFit.cover,
        color: Theme.of(context).colorScheme.gray_20) : CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit ?? BoxFit.cover,
      placeholder: (a, b) => Image.asset(AllImages.logo, color: Theme.of(context).colorScheme.gray_20, fit: BoxFit.cover,),
      errorWidget: (a,b,c) => errorWidget ?? Icon(Icons.error),
    );
  }
}