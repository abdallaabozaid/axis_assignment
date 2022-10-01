import 'dart:async';

import 'package:axis_assignment/src/domain/00_core/failures/get_data_failure.dart';
import 'package:axis_assignment/src/domain/01_celeberities/celeberities_response.dart';
import 'package:axis_assignment/src/domain/01_celeberities/i_celeberities_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

part 'all_celeberities_event.dart';
part 'all_celeberities_state.dart';

class AllCeleberitiesBloc
    extends Bloc<AllCeleberitiesEvent, AllCeleberitiesState> {
  final ICeleberitiesRepo _repo;

  AllCeleberitiesBloc(this._repo) : super(AllCeleberitiesState.initial()) {
    on<GetAllCeleberitiesEvent>(_onGetAllCeleberitiesEvent);
  }

  FutureOr<void> _onGetAllCeleberitiesEvent(
      GetAllCeleberitiesEvent event, Emitter<AllCeleberitiesState> emit) async {
    emit(state.copyWith(
      failureOrSuccessOption: none(),
      isLoading: true,
    ));

    final failureOrSuccess = await _repo.getAllCeleberities(
      pageIndex: event.pageIndex,
    );

    emit(state.copyWith(
      failureOrSuccessOption: some(failureOrSuccess),
      isLoading: false,
    ));
  }
}
