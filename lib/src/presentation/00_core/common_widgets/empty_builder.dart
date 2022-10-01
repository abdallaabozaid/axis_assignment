// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyBuilder extends StatelessWidget {
  const EmptyBuilder({
    Key? key,
    required this.emptyLabel,
  }) : super(key: key);
  final String emptyLabel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Text(
              emptyLabel,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
