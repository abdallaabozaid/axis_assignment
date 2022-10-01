import 'package:axis_assignment/src/domain/00_core/failures/get_data_failure.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberities_response.dart';
import 'package:dartz/dartz.dart';

abstract class ICeleberitiesRepo {
  Future<Either<GetDataFailure, CeleberitiesResponseModel>>
      getAllCeleberities();

  Future<Either<GetDataFailure, CeleberitiesResponseModel>>
      getCeleberityDetails({
    required int id,
  });

  Future<Either<GetDataFailure, CeleberitiesResponseModel>>
      getCeleberityImages({
    required int id,
  });
}
