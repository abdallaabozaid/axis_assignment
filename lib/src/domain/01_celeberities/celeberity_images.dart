class CeleberityImagesResponseModel {
  CeleberityImagesResponseModel({
    required this.id,
    required this.profiles,
  });
  late final int id;
  late final List<ProfileImage> profiles;

  CeleberityImagesResponseModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    profiles = List.from(json['profiles'])
        .map((e) => ProfileImage.fromJson(e))
        .toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['profiles'] = profiles.map((e) => e.toJson()).toList();
    return _data;
  }
}

class ProfileImage {
  ProfileImage({
    required this.aspectRatio,
    required this.height,
    this.iso_639_1,
    required this.filePath,
    required this.voteAverage,
    required this.voteCount,
    required this.width,
  });
  late final double aspectRatio;
  late final int height;
  late final Null iso_639_1;
  late final String filePath;
  late final double voteAverage;
  late final int voteCount;
  late final int width;

  ProfileImage.fromJson(Map<String, dynamic> json) {
    aspectRatio = json['aspect_ratio'];
    height = json['height'];
    iso_639_1 = null;
    filePath = json['file_path'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];
    width = json['width'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['aspect_ratio'] = aspectRatio;
    _data['height'] = height;
    _data['iso_639_1'] = iso_639_1;
    _data['file_path'] = filePath;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    _data['width'] = width;
    return _data;
  }
}
