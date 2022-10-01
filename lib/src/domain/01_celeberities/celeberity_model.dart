// ignore_for_file: public_member_api_docs, sort_constructors_first
class Celebrity {
  Celebrity({
    required this.adult,
    required this.gender,
    required this.id,
    required this.knownFor,
    required this.knownForDepartment,
    required this.name,
    required this.popularity,
    required this.profilePath,
  });
  late final String profilePath;
  late final bool adult;
  late final int gender;
  late final int id;
  late final List knownFor;
  late final String name;
  late final double popularity;
  late final String knownForDepartment;

  Celebrity.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    gender = json['gender'];
    id = json['id'];
    // modeling 'known for' items depending on media type >>
    knownFor = List.from(json['known_for']).map(
      (e) {
        return e['media_type'] == 'movie'
            ? Movie.fromJson(e)
            : TVShow.fromJson(e);
      },
    ).toList();
    knownForDepartment = json['known_for_department'];
    name = json['name'];
    popularity = json['popularity'];
    profilePath = json['profile_path'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['adult'] = adult;
    data['gender'] = gender;
    data['id'] = id;
    data['known_for'] = knownFor.map((e) => e.toJson()).toList();
    data['known_for_department'] = knownForDepartment;
    data['name'] = name;
    data['popularity'] = popularity;
    data['profile_path'] = profilePath;
    return data;
  }
}

class Movie {
  Movie({
    required this.adult,
    this.backdropPath,
    required this.genreIds,
    required this.id,
    required this.mediaType,
    required this.originalLanguage,
    required this.originalTitle,
    required this.overview,
    this.posterPath,
    required this.releaseDate,
    required this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });
  late final bool adult;
  late final String? backdropPath;
  late final List<int> genreIds;
  late final int id;
  late final String mediaType;
  late final String originalLanguage;
  late final String originalTitle;
  late final String overview;
  late final String? posterPath;
  late final String releaseDate;
  late final String title;
  late final bool video;
  late final double voteAverage;
  late final int voteCount;

  Movie.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = List.castFrom<dynamic, int>(json['genre_ids']);
    id = json['id'];
    mediaType = json['media_type'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'].runtimeType == int
        ? double.parse(json['vote_average'].toString())
        : json['vote_average'];
    voteCount = json['vote_count'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['adult'] = adult;
    _data['backdrop_path'] = backdropPath;
    _data['genre_ids'] = genreIds;
    _data['id'] = id;
    _data['media_type'] = mediaType;
    _data['original_language'] = originalLanguage;
    _data['original_title'] = originalTitle;
    _data['overview'] = overview;
    _data['poster_path'] = posterPath;
    _data['release_date'] = releaseDate;
    _data['title'] = title;
    _data['video'] = video;
    _data['vote_average'] = voteAverage;
    _data['vote_count'] = voteCount;
    return _data;
  }
}

class TVShow {
  TVShow({
    this.posterPath,
    required this.id,
    required this.overview,
    this.backdropPath,
    required this.voteAverage,
    required this.mediaType,
    required this.firstAirDate,
    required this.originCountry,
    required this.genreIds,
    required this.originalLanguage,
    required this.voteCount,
    required this.name,
    required this.originalName,
  });
  late final String? posterPath;
  late final int id;
  late final String overview;
  late final String? backdropPath;
  late final double voteAverage;
  late final String mediaType;
  late final String firstAirDate;
  late final List<String> originCountry;
  late final List<int> genreIds;
  late final String originalLanguage;
  late final int voteCount;
  late final String name;
  late final String originalName;

  TVShow.fromJson(Map<String, dynamic> json) {
    posterPath = json['poster_path'];
    id = json['id'];
    overview = json['overview'];
    backdropPath = json['backdrop_path'];
    voteAverage = json['vote_average'];
    mediaType = json['media_type'];
    firstAirDate = json['first_air_date'];
    originCountry = List.from(json['origin_country']);
    genreIds = List.from(json['genre_ids']);
    originalLanguage = json['original_language'];
    voteCount = json['vote_count'];
    name = json['name'];
    originalName = json['original_name'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['poster_path'] = posterPath;
    _data['id'] = id;
    _data['overview'] = overview;
    _data['vote_average'] = voteAverage;
    _data['media_type'] = mediaType;
    _data['first_air_date'] = firstAirDate;
    _data['origin_country'] = originCountry;
    _data['genre_ids'] = genreIds;
    _data['backdrop_path'] = backdropPath;
    _data['original_language'] = originalLanguage;
    _data['original_name'] = originalName;
    _data['name'] = name;
    _data['vote_count'] = voteCount;
    return _data;
  }
}
