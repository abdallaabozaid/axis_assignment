// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'all_celeberities_bloc.dart';

abstract class AllCeleberitiesEvent extends Equatable {
  const AllCeleberitiesEvent();

  @override
  List<Object> get props => [];
}

class GetAllCeleberitiesEvent extends AllCeleberitiesEvent {
  final int pageIndex;
  const GetAllCeleberitiesEvent({
    required this.pageIndex,
  });

  @override
  List<Object> get props => [pageIndex];
}
