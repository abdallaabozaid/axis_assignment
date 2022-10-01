import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({
    Key? key,
    this.imageAsset,
    this.imageUrl,
    required this.width,
    required this.height,
  }) : super(key: key);
  final String? imageAsset;
  final String? imageUrl;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width.w,
        height: height.w,
        child: imageAsset == null
            ? Image.network(imageUrl!)
            : Image.asset(imageAsset!),
      ),
    );
  }
}
