// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'one_celeberity_bloc.dart';

abstract class OneCeleberityEvent extends Equatable {
  const OneCeleberityEvent();

  @override
  List<Object> get props => [];
}

class GetCeleberityDetailsAndImagesEvent extends OneCeleberityEvent {
  final int id;
  const GetCeleberityDetailsAndImagesEvent({
    required this.id,
  });

  @override
  List<Object> get props => [id];
}
