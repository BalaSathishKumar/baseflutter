import 'package:base_flutter_provider_project/constants/theme_color.dart';
import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    this.onTap,
    this.height = 50.0,
    required this.label,
    this.borderRadius = 25.0,
    this.labelColor = ThemeColor.Black,
    this.backgroundColor = ThemeColor.Green3,
  }) : super(key: key);

  final VoidCallback? onTap;
  final String label;
  final Color? backgroundColor;
  final double? borderRadius;
  final Color? labelColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all<double>(0),
          backgroundColor: onTap != null
              ? MaterialStateProperty.all<Color>(backgroundColor!)
              : MaterialStateProperty.all<Color>(ThemeColor.Grey2),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius!),
            ),
          ),
        ),
        child: Center(
          child: Text(
            label,
            style: Theme.of(context).textTheme.subtitle1?.copyWith(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
          ),
        ),
      ),
    );
  }
}
