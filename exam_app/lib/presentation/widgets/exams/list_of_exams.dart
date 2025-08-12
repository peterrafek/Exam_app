import 'package:exam_app/core/app_style.dart';
import 'package:exam_app/core/colors_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/di.dart';
import '../../../core/routes_manager.dart';
import '../../viewmodel/cubits/exams/get_exams_cubit.dart';
import '../../viewmodel/intents/exams/get_exams_intent.dart';
import '../../viewmodel/states/exams/get_exams_state.dart';
import 'exam_item.dart';

class ListOfExams extends StatefulWidget {
  const ListOfExams({super.key, required this.id});

  final String id;

  @override
  State<ListOfExams> createState() => _ListOfExamsState();
}

class _ListOfExamsState extends State<ListOfExams> {
  late final GetExamsCubit getExamsCubit;

  @override
  void initState() {
    getExamsCubit = getIt<GetExamsCubit>();
    getExamsCubit.doIntent(OnSubjectClickIntent(id: widget.id));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExamsCubit, GetExamsState>(
      bloc: getExamsCubit,
      builder: (context, state) {
        switch (state) {
          case GetExamsInitialState():
            return SizedBox();
          case GetExamsLoadingState():
            return SizedBox(
              height: 187.h,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case GetExamsSuccessState():
            return Column(
              children: [
                state.data!.isEmpty
                    ? Center(
                        child: Text(
                          'There are no exams.',
                          style: AppStyle.appBarTitle
                              .copyWith(color: ColorsManager.blueButton),
                        ),
                      )
                    : Expanded(
                        child: ListView.builder(
                          itemBuilder: (context, index) => InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                RoutesManager.examStart,
                                arguments: state.data![index],
                              );
                            },
                            child: ExamItem(item: state.data![index]),
                          ),
                          itemCount: state.data!.length,
                          scrollDirection: Axis.vertical,
                        ),
                      ),
              ],
            );
          case GetExamsErrorState():
            return Text('error');
        }
      },
    );
  }
}
