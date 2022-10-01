part of 'all_celeberities_bloc.dart';

class AllCeleberitiesState extends Equatable {
  const AllCeleberitiesState({
    required this.isLoading,
    required this.failureOrSuccessOption,
  });

  final bool isLoading;
  final Option<Either<GetDataFailure, CeleberitiesResponseModel>>
      failureOrSuccessOption;

  factory AllCeleberitiesState.initial() {
    return AllCeleberitiesState(
      isLoading: false,
      failureOrSuccessOption: none(),
    );
  }

  @override
  List<Object> get props => [
        isLoading,
        failureOrSuccessOption,
      ];

  AllCeleberitiesState copyWith({
    bool? isLoading,
    Option<Either<GetDataFailure, CeleberitiesResponseModel>>?
        failureOrSuccessOption,
  }) {
    return AllCeleberitiesState(
      isLoading: isLoading ?? this.isLoading,
      failureOrSuccessOption:
          failureOrSuccessOption ?? this.failureOrSuccessOption,
    );
  }
}
