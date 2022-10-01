import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.label,
    this.width = double.infinity,
    this.height = 55,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Widget label;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return SizedBox(
      width: width.w,
      height: height.h,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          elevation: MaterialStateProperty.all(0),
          backgroundColor: MaterialStateProperty.all(colorScheme.primary),
          foregroundColor: MaterialStateProperty.all(
            Theme.of(context).colorScheme.onPrimary,
          ),
          side: MaterialStateProperty.all(
            const BorderSide(
              width: 1.4,
              color: AppColors.appMainColor,
            ),
          ),
          overlayColor: MaterialStateProperty.all(
            Colors.black.withOpacity(0.1),
          ),
        ),
        child: FittedBox(child: label),
      ),
    );
  }
}
