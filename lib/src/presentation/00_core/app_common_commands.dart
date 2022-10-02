import 'package:axis_assignment/config/constants/api_const.dart';
import 'package:axis_assignment/config/enums.dart';

class AppCommanCommands {
  static String getImageUrl({
    required String imagePath,
    required ProfileImageSize size,
  }) {
    return '$imagesBaseUrl${size.size}$imagePath';
  }
}
