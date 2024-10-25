import 'package:base_flutter_provider_project/constants/dimensions.dart';
import 'package:base_flutter_provider_project/constants/local_images.dart';
import 'package:base_flutter_provider_project/constants/strings.dart';
import 'package:base_flutter_provider_project/constants/theme_color.dart';
import 'package:base_flutter_provider_project/utils/common_functions.dart';
import 'package:flutter/material.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: willPopCallback,
      child: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: ThemeColor.Blue,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(Dimensions.dm_15),
                child: Text(
                  Strings.connectionError,
                  style: const TextStyle(
                    color: ThemeColor.White,
                    fontWeight: FontWeight.w600,
                    fontSize: Dimensions.dm_20,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: Dimensions.dm_60),
                child: Text(
                  Strings.checkInternet,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: ThemeColor.White,
                    fontWeight: FontWeight.w400,
                    fontSize: Dimensions.dm_16,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: Dimensions.dm_50),
                child: Image.asset(LocalPNGImages.connection_error),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
