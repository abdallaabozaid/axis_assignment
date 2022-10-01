import 'package:axis_assignment/src/domain/01_celeberities/celeberity_model.dart';

class CeleberitiesResponseModel {
  CeleberitiesResponseModel({
    required this.page,
    required this.celeberities,
    required this.totalPages,
    required this.totalResults,
  });
  late final int page;
  late final List<Celebrity> celeberities;
  late final int totalPages;
  late final int totalResults;

  CeleberitiesResponseModel.fromJson(Map<String, dynamic> json) {
    page = json['page'];
    celeberities =
        List.from(json['results']).map((e) => Celebrity.fromJson(e)).toList();
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final result = <String, dynamic>{};
    result['page'] = page;
    result['results'] = celeberities.map((e) => e.toJson()).toList();
    result['total_pages'] = totalPages;
    result['total_results'] = totalResults;
    return result;
  }
}
