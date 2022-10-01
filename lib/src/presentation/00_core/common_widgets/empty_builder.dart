// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EmptyBuilder extends StatelessWidget {
  const EmptyBuilder({
    Key? key,
    required this.emptyLabel,
    required this.onRefresh,
  }) : super(key: key);
  final String emptyLabel;
  final VoidCallback onRefresh;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Padding(
            padding: EdgeInsets.all(12.w),
            child: Column(
              children: [
                Text(
                  emptyLabel,
                  textAlign: TextAlign.center,
                ),
                IconButton(
                    onPressed: onRefresh, icon: Icon(Icons.refresh_rounded))
              ],
            ),
          ),
        ),
      ],
    );
  }
}
