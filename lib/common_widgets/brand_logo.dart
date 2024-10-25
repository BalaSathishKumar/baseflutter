import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget brandLogo() {
  return Center(
    child: Hero(
      tag: 'brandLogo',
      child: SvgPicture.asset(LocalSVGImages.ic_brand_logo,
      height: 50,
      width: 150),
    ),
  );
}
