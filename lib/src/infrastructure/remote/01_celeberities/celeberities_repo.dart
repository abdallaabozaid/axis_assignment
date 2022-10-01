import 'package:axis_assignment/src/domain/01_celeberities/celeberities_response.dart';
import 'package:axis_assignment/src/domain/00_core/failures/get_data_failure.dart';
import 'package:axis_assignment/src/domain/01_celeberities/i_celeberities_repo.dart';
import 'package:dartz/dartz.dart';

class CeleberitiesRepo extends ICeleberitiesRepo {
  @override
  Future<Either<GetDataFailure, CeleberitiesResponseModel>>
      getAllCeleberities() {
    // TODO: implement getAllCeleberities
    throw UnimplementedError();
  }

  @override
  Future<Either<GetDataFailure, CeleberitiesResponseModel>>
      getCeleberityDetails({required int id}) {
    // TODO: implement getCeleberityDetails
    throw UnimplementedError();
  }

  @override
  Future<Either<GetDataFailure, CeleberitiesResponseModel>> getCeleberityImages(
      {required int id}) {
    // TODO: implement getCeleberityImages
    throw UnimplementedError();
  }
}
