import 'package:axis_assignment/src/domain/00_core/failures/get_data_failure.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberities_response.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberity_details.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberity_images.dart';
import 'package:dartz/dartz.dart';

abstract class ICeleberitiesRepo {
  Future<Either<GetDataFailure, CeleberitiesResponseModel>> getAllCeleberities({
    required int pageIndex,
  });

  Future<Either<GetDataFailure, CeleberityDetails>> getCeleberityDetails({
    required int id,
  });

  Future<Either<GetDataFailure, CeleberityImagesResponseModel>>
      getCeleberityImages({
    required int id,
  });
}
