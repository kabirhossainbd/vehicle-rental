import 'package:cached_network_image/cached_network_image.dart';
import 'package:vehicle_rental_app/service/themes/color_scheme.dart';
import 'package:vehicle_rental_app/util/images.dart';
import 'package:flutter/material.dart';


class ProfileAvatar extends StatelessWidget {
  final String imageUrl;
  final double height;
  final double width;
  final bool isColor;
  const ProfileAvatar({super.key, required this.imageUrl, this.height = 32, this.width=32, this.isColor = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isColor ? Theme.of(context).colorScheme.crossColor.withOpacity(0.1) : null
      ),
      child: ClipOval(child: (imageUrl.isNotEmpty) ? CachedNetworkImage(
        imageUrl: imageUrl,
        height: double.infinity,
        width: double.infinity,
        fit: BoxFit.cover,
        placeholder: (a, b)=> Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AllImages.profilePlaceHolder),
        ),
        errorWidget: (a, b, c)=> Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(AllImages.profilePlaceHolder),
        ),
      ) : Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(AllImages.profilePlaceHolder),
      )
      ),
    );
  }
}