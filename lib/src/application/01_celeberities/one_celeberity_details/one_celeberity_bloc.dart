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
    on<GetCeleberityDetailsEvent>(_onGetCeleberityDetailsEvent);
    on<GetCeleberityImagesEvent>(_onGetCeleberityImagesEvent);
  }

  FutureOr<void> _onGetCeleberityDetailsEvent(
      GetCeleberityDetailsEvent event, Emitter<OneCeleberityState> emit) async {
    emit(state.copyWith(
      detailsFailureOrSuccessOption: none(),
      isLoading: true,
    ));

    final failureOrSuccess = await _repo.getCeleberityDetails(
      id: event.id,
    );

    emit(state.copyWith(
      detailsFailureOrSuccessOption: some(failureOrSuccess),
      isLoading: false,
    ));
  }

  FutureOr<void> _onGetCeleberityImagesEvent(
      GetCeleberityImagesEvent event, Emitter<OneCeleberityState> emit) async {
    emit(state.copyWith(
      imagesFailureOrSuccessOption: none(),
      isLoading: true,
    ));

    final failureOrSuccess = await _repo.getCeleberityImages(
      id: event.id,
    );

    emit(state.copyWith(
      imagesFailureOrSuccessOption: some(failureOrSuccess),
      isLoading: false,
    ));
  }
}
