import 'dart:async';

import 'package:axis_assignment/src/domain/00_core/failures/get_data_failure.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberity_details.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberity_images.dart';
import 'package:axis_assignment/src/domain/01_celeberities/i_celeberities_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'one_celeberity_event.dart';
part 'one_celeberity_state.dart';

class OneCeleberityBloc extends Bloc<OneCeleberityEvent, OneCeleberityState> {
  final ICeleberitiesRepo _repo;
  OneCeleberityBloc(this._repo) : super(OneCeleberityState.initial()) {
    on<GetCeleberityDetailsAndImagesEvent>(
        _onGetCeleberityDetailsAndImagesEvent);
    // on<GetCeleberityImagesEvent>(_onGetCeleberityImagesEvent);
  }

  FutureOr<void> _onGetCeleberityDetailsAndImagesEvent(
      GetCeleberityDetailsAndImagesEvent event,
      Emitter<OneCeleberityState> emit) async {
    emit(state.copyWith(
      detailsFailureOrSuccessOption: none(),
      isLoading: true,
    ));

    final detailsFailureOrSuccess = await _repo.getCeleberityDetails(
      id: event.id,
    );

    final imagesFailureOrSuccess = await _repo.getCeleberityImages(
      id: event.id,
    );

    emit(state.copyWith(
      detailsFailureOrSuccessOption: some(detailsFailureOrSuccess),
      imagesFailureOrSuccessOption: some(imagesFailureOrSuccess),
      isLoading: false,
    ));
  }
}
