import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:axis_assignment/src/domain/00_core/failures/get_data_failure.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetDataErrorDialog extends StatelessWidget {
  const GetDataErrorDialog({
    Key? key,
    required this.failure,
  }) : super(key: key);
  final GetDataFailure failure;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      actions: [
        _backButton(context),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.r)),
      backgroundColor: Colors.white,
      titlePadding: EdgeInsets.zero,
      title: _title(context),
      buttonPadding: EdgeInsets.all(20.h),
      elevation: 5,
      actionsAlignment: MainAxisAlignment.spaceAround,
      content: Text(
        failure == GetDataFailure.noInternetAndNoSavedData
            ? 'Something went wrong , please check your internet connection and try again .'
            //     ? 'Name field is can\'t be empty .'
            : failure == GetDataFailure.serverError
                ? 'Server error ,please try again later .'
                : failure == GetDataFailure.dataHandlingError
                    ? 'Message field is can\'t be empty .'
                    : 'Something went wrong , please try again later .',
        textAlign: TextAlign.center,
        style: const TextStyle(color: Colors.black),
      ),
    );
  }

  Widget _backButton(BuildContext context) {
    return SizedBox(
      height: 42.h,
      width: 190.w,
      child: ElevatedButton(
        onPressed: () => Navigator.pop(context),
        child: const Text(
          'CLOSE',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  Widget _title(BuildContext context) {
    return Container(
      height: 90.h,
      decoration: BoxDecoration(
        color: AppColors.appMainColor,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(10.r),
        ),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.only(start: 12.w, top: 18.w),
        child: Text(
          'Erro',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20.sp,
            letterSpacing: 1,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}
