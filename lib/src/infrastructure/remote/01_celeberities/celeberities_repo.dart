// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:axis_assignment/src/domain/01_celeberities/celeberity_details.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberity_images.dart';
import 'package:axis_assignment/src/infrastructure/local/01_celeberities/celeberities_storage.dart';
import 'package:dartz/dartz.dart';

import 'package:axis_assignment/src/domain/00_core/failures/get_data_failure.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberities_response.dart';
import 'package:axis_assignment/src/domain/01_celeberities/i_celeberities_repo.dart';
import 'package:axis_assignment/src/infrastructure/remote/01_celeberities/celebereties_api.dart';

class CeleberitiesRepo extends ICeleberitiesRepo {
  final CeleberitiesApi _api;
  CeleberitiesRepo(
    this._api,
  );
  @override
  Future<Either<GetDataFailure, CeleberitiesResponseModel>> getAllCeleberities({
    required int pageIndex,
  }) async {
    // (0) try
    // (1) calling api >>
    /// (2) if no internet connection >> looking for local data
    /// (3) if there is no local data >> then return det data failure of type "noInternetAndNoSavedData"
    /// (4) else >> modeling the save lcoal json into "CeleberitiesResponseModel" then return the model
    // (5) else >> modeling the api json data into "CeleberitiesResponseModel" then return the model
    // (6) catch data handling error

// (1)
    try {
      final jsonApiData = await _api.getAllCeleberities(
        pageIndex: pageIndex,
      );

      if (jsonApiData == null) {
// (2)

        final savedJsonData = await CeleberitiesStorage.getLocalData();

        if (savedJsonData == null) {
// (3)

          return left(GetDataFailure.noInternetAndNoSavedData);
        } else {
// (4)

          final CeleberitiesResponseModel dataModel =
              CeleberitiesResponseModel.fromJson(savedJsonData);
          await CeleberitiesStorage.saveData(savedJsonData);

          return right(dataModel);
        }
      } else {
// (5)

        final CeleberitiesResponseModel dataModel =
            CeleberitiesResponseModel.fromJson(jsonApiData);
        await CeleberitiesStorage.saveData(jsonApiData);

        return right(dataModel);
      }
    } catch (e) {
// (6)

      return left(GetDataFailure.dataHandlingError);
    }
  }

  @override
  Future<Either<GetDataFailure, CeleberityDetails>> getCeleberityDetails(
      {required int id}) async {
// (0) try >>
    // (1) calling api >>
    /// (2)if api error >> return data failure of type  "serverError"
    /// (3) else >> modeling the api json data into "CeleberityDetails" then return the model
// (4) catch data handling error

// (0)
    try {
// (1)
      final apiJsonData = await _api.getCeleberityDetails(id: id.toString());

// (2)
      if (apiJsonData == null) {
        return left(GetDataFailure.serverError);
      } else {
// (3)
        final CeleberityDetails dataModel =
            CeleberityDetails.fromJson(apiJsonData);
        return right(dataModel);
      }
    } catch (e) {
// (4)

      return left(GetDataFailure.dataHandlingError);
    }
  }

  @override
  Future<Either<GetDataFailure, CeleberityImagesResponseModel>>
      getCeleberityImages({required int id}) async {
// (0) try
    // (1) calling api >>
    /// (2)if api error >> return data failure of type  "serverError"
    /// (3) else >> modeling the api json data into "CeleberityImagesResponseModel" then return the model
// (4) catch data handling error

// (0)
    try {
      // (1)
      final apiJsonData = await _api.getCeleberityImages(id: id.toString());

      // (2)
      if (apiJsonData == null) {
        return left(GetDataFailure.serverError);
      } else {
        // (3)
        final CeleberityImagesResponseModel dataModel =
            CeleberityImagesResponseModel.fromJson(apiJsonData);

        return right(dataModel);
      }
    } catch (e) {
// (4)
      return left(GetDataFailure.dataHandlingError);
    }
  }
}
