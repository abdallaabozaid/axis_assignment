part of 'one_celeberity_bloc.dart';

class OneCeleberityState extends Equatable {
  const OneCeleberityState({
    required this.isLoading,
    required this.detailsFailureOrSuccessOption,
    required this.imagesFailureOrSuccessOption,
  });

  final bool isLoading;
  final Option<Either<GetDataFailure, CeleberityDetails>>
      detailsFailureOrSuccessOption;
  final Option<Either<GetDataFailure, CeleberityImagesResponseModel>>
      imagesFailureOrSuccessOption;

  factory OneCeleberityState.initial() {
    return OneCeleberityState(
      isLoading: false,
      detailsFailureOrSuccessOption: none(),
      imagesFailureOrSuccessOption: none(),
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        detailsFailureOrSuccessOption,
      ];

  OneCeleberityState copyWith({
    bool? isLoading,
    Option<Either<GetDataFailure, CeleberityDetails>>?
        detailsFailureOrSuccessOption,
    Option<Either<GetDataFailure, CeleberityImagesResponseModel>>?
        imagesFailureOrSuccessOption,
  }) {
    return OneCeleberityState(
      isLoading: isLoading ?? this.isLoading,
      detailsFailureOrSuccessOption:
          detailsFailureOrSuccessOption ?? this.detailsFailureOrSuccessOption,
      imagesFailureOrSuccessOption:
          imagesFailureOrSuccessOption ?? this.imagesFailureOrSuccessOption,
    );
  }
}
