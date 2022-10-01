import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:flutter/material.dart';

class TextWrapper extends StatefulWidget {
  const TextWrapper({Key? key, required this.text}) : super(key: key);

  final String text;

  @override
  _TextWrapperState createState() => _TextWrapperState();
}

class _TextWrapperState extends State<TextWrapper>
    with TickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      AnimatedSize(
          duration: const Duration(milliseconds: 300),
          child: ConstrainedBox(
              constraints: isExpanded
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 70),
              child: Text(
                widget.text,
                style: const TextStyle(
                    fontSize: 15, color: AppColors.appMainYellow),
                softWrap: true,
                overflow: TextOverflow.fade,
              ))),
      isExpanded
          ? OutlinedButton.icon(
              icon: const Icon(
                Icons.arrow_upward,
                color: AppColors.appMainColor,
              ),
              label: const Text(
                'Read less',
                style: TextStyle(color: AppColors.appMainColor),
              ),
              onPressed: () => setState(() => isExpanded = false))
          : TextButton.icon(
              icon: const Icon(
                Icons.arrow_downward,
                color: AppColors.appMainColor,
              ),
              label: const Text(
                'Read more',
                style: TextStyle(color: AppColors.appMainColor),
              ),
              onPressed: () => setState(() => isExpanded = true))
    ]);
  }
}
