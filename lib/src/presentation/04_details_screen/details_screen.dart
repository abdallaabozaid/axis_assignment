// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:axis_assignment/config/theme/app_colors.dart';
import 'package:axis_assignment/src/application/01_celeberities/one_celeberity_details/one_celeberity_bloc.dart';
import 'package:axis_assignment/src/presentation/00_core/app_bloc_events.dart';
import 'package:axis_assignment/src/presentation/00_core/common_widgets/empty_builder.dart';
import 'package:axis_assignment/src/presentation/04_details_screen/widgets/custom_app_bar.dart';
import 'package:axis_assignment/src/presentation/04_details_screen/widgets/images_builder.dart';
import 'package:axis_assignment/src/presentation/04_details_screen/widgets/text_wraper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:axis_assignment/src/domain/01_celeberities/celeberity_model.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({
    Key? key,
    required this.celebrity,
  }) : super(key: key);
  final Celebrity celebrity;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<OneCeleberityBloc, OneCeleberityState>(
          builder: (context, state) => state.isLoading
              ? const Center(child: CircularProgressIndicator())
              : state.detailsFailureOrSuccessOption.fold(
                  () => const SizedBox(),
                  (a) => a.fold(
                    (l) => EmptyBuilder(
                      emptyLabel: 'Something went wrong , try again later ...',
                      onRefresh: () => AppBlocEvents.getCelebDetailsAndImages(
                        context,
                        id: celebrity.id,
                      ),
                    ),
                    (r) => CustomScrollView(
                      slivers: [
                        CustomSliverAppBar(
                          mainImage: celebrity.profilePath,
                          name: celebrity.name,
                        ),
                        SliverList(
                          delegate: SliverChildListDelegate(
                            [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (r.birthday != null)
                                    _textView(
                                      label: 'Birthday',
                                      value: r.birthday!,
                                    ),
                                  if (r.placeOfBirth != null)
                                    _textView(
                                      label: 'Place of Birth',
                                      value: r.placeOfBirth!,
                                    ),
                                  _textView(
                                    label: 'Popularity',
                                    value: r.popularity.toString(),
                                  ),
                                  _textView(
                                    label: 'Biography',
                                    value: '',
                                  ),
                                  Padding(
                                    padding: EdgeInsets.all(15.w),
                                    child: TextWrapper(text: r.biography),
                                  ),
                                  _textView(
                                    label: 'Images',
                                    value: '',
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const ImagesBuilder(),
                      ],
                    ),
                  ),
                )),
    );
  }

  Padding _textView({
    required String label,
    required String value,
  }) {
    return Padding(
      padding: EdgeInsets.all(15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: const TextStyle(
              fontSize: 20,
              color: Colors.blueGrey,
            ),
          ),
          if (value.isNotEmpty)
            Text(
              value,
              style: const TextStyle(
                fontSize: 16,
                color: AppColors.appMainColor,
              ),
            ),
        ],
      ),
    );
  }
}
