// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'one_celeberity_bloc.dart';

abstract class OneCeleberityEvent extends Equatable {
  const OneCeleberityEvent();

  @override
  List<Object> get props => [];
}

class GetCeleberityDetailsEvent extends OneCeleberityEvent {
  final int id;
  const GetCeleberityDetailsEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}

class GetCeleberityImagesEvent extends OneCeleberityEvent {
  final int id;
  const GetCeleberityImagesEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
