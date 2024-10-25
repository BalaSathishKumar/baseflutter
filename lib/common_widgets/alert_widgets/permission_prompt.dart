import 'package:base_flutter_provider_project/common_widgets/button_widgets/bottom_button.dart';
import 'package:base_flutter_provider_project/constants/strings.dart';
import 'package:base_flutter_provider_project/constants/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: must_be_immutable
class PermissionPrompt extends StatelessWidget {
  PermissionPrompt({
    Key? key,
    required this.tapYes,
    required this.tapCancel,
  }) : super(key: key);

  VoidCallback tapYes;
  VoidCallback tapCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20))),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          GestureDetector(
            onTap: tapCancel,
            child: Container(
              padding: const EdgeInsets.all(10),
              alignment: Alignment.topRight,
              child: const Icon(
                Icons.close,
                size: 20,
              ),
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  alignment: Alignment.center,
                  child: Lottie.asset('assets/lottie_files/permission.json'),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  Strings.permissionTitle,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                ),
                child: Text(
                  Strings.permissionAlertContent,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(10),
            alignment: Alignment.topRight,
            child: BottomButton(
                label: Strings.allowPermissions,
                borderRadius: 15,
                backgroundColor: ThemeColor.accentColor,
                height: 35,
                labelColor: ThemeColor.whiteColor,
                onTap: tapYes),
          ),
        ],
      ),
    );
  }
}
