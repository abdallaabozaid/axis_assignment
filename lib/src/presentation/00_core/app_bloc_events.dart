import 'package:axis_assignment/src/application/01_celeberities/all_celeberities/all_celeberities_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocEvents {
  static void getAllCelebsData(
    BuildContext ctx, {
    required int pageIndex,
  }) {
    // !AppCommonCommands.checkInternetConnection(ctx)
    //     ? null
    BlocProvider.of<AllCeleberitiesBloc>(ctx).add(
      GetAllCeleberitiesEvent(pageIndex: pageIndex),
    );
  }
}
