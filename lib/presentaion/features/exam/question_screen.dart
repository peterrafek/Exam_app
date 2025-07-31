import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_timer_countdown/flutter_timer_countdown.dart';

import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../api/model/response/get_all_question_response.dart' as req;
import '../../../core/app_style.dart';
import '../../../core/colors_manager.dart';
 import '../../../di/di.dart';
 import '../../../domain/use_case/get_all_question_use_case.dart';
import 'get_all_question_state.dart';
import 'get_all_questions_view_model.dart';


class QuestionScreen extends StatelessWidget {
  final String id;

  @override
  QuestionScreen({super.key, required this.id});







  @override

  Widget build(BuildContext context) {
     return BlocProvider(
       create: (context) => getIt<GetAllQuestionsViewModel>()..getAllQuestions(id),
      child: Scaffold(
          appBar: AppBar(
            leading: BackButton(),
            title: Text("exam", style: AppStyle.appBarTitle),
            actions: [
              Icon(Icons.alarm, color: Colors.black),
              SizedBox(width: 10),
              TimerCountdown(
                enableDescriptions: false,
                format: CountDownTimerFormat.hoursMinutes,
                endTime: DateTime.now().add(Duration(hours: 1)),
              ),
              SizedBox(width: 20),
            ],
          ),
          body:BlocBuilder<GetAllQuestionsViewModel, GetAllQuestionState>(
            builder: (context, state) {
              switch (state) {
                case GetAllQuestionsInitial():
                  return SizedBox();
                case GetAllQuestionsLoading():
                  return Center(child: CircularProgressIndicator());
                case GetAllQuestionsSuccess():
                  return buildQuestionsForm(context,state)
                    ;
                case GetAllQuestionsFailure():
                  return Center(child: Text('Error: ${state.message}'));
                default:
                  return SizedBox();
              }
            },
          ),
        ),
                );
   }
  Widget buildQuestionsForm( BuildContext context,GetAllQuestionsSuccess state) {
    final cubit = BlocProvider.of<GetAllQuestionsViewModel>(context);
    final questions = state.questions;


    if (questions.isEmpty) return const Text("No questions available");

    return Padding(
      padding: REdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              'Question ${state.currentIndex + 1} of ${questions.length}',
              style: AppStyle.searchText.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) => LinearPercentIndicator(
              width: constraints.maxWidth,
              lineHeight: 6.h,
              percent: (state.currentIndex + 1) / questions.length,
              backgroundColor: Colors.grey.shade300,
              progressColor: Colors.blue,
              barRadius: Radius.circular(8.r),
            ),
          ),
          SizedBox(height: 20.h),
          Expanded(
            child: PageView.builder(
              controller:cubit.pageController,
              physics: NeverScrollableScrollPhysics(),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                final question = questions[index];
                final selected = state.selectedAnswers[question.Id];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      question.question ?? '',
                      style: AppStyle.forgetPasswordTitle
                          .copyWith(fontSize: 16.sp),
                    ),
                    SizedBox(height: 20.h),
                    ...?question.answers?.map((answer) {
                      final isSelected =
                          selected == answer.key;
                      return GestureDetector(
                        onTap: () {

                          cubit.selectAnswer(
                            question.Id ?? '',
                            answer.key ?? '',
                          );
                          log(state.selectedAnswers.toString());
                        },
                        child: Container(
                          margin: REdgeInsets.symmetric(vertical: 6.h),
                          padding: REdgeInsets.symmetric(
                              horizontal: 12.w, vertical: 12.h),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? Color(0xFFCCD7EB)
                                : Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                isSelected
                                    ? Icons.radio_button_checked
                                    : Icons.radio_button_off,
                                color: ColorsManager.blueButton,
                              ),
                              SizedBox(width: 12.w),
                              Expanded(
                                child: Text(
                                  answer.answer ?? '',
                                  style: TextStyle(fontSize: 14.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  ],
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: state.currentIndex > 0
                    ? () {
                  cubit.backPage();
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  side: BorderSide(color: ColorsManager.blueButton),
                  backgroundColor: Colors.white,
                  minimumSize: const Size(160, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                  ),
                ),
                child: Text(
                  "Back",
                  style: AppStyle.blueButton.copyWith(
                    color: ColorsManager.blueButton,
                  ),
                ),
              ),
              SizedBox(width: 20.w),
              ElevatedButton(
                onPressed: (){

                  if (state.currentIndex < questions.length - 1) {
                    cubit.nextPage();
                  } else {
                    /// هنا لو ضغط Finish
                    log("Submitted answers: ${state.selectedAnswers}");
                  }
                },

                style: ElevatedButton.styleFrom(
                  backgroundColor: ColorsManager.blueButton,
                  minimumSize: const Size(160, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.r),
                    ),
                  ),
                ),
    child: Text(
    state.currentIndex == questions.length - 1 ? "Finish" : "Next",
    style: AppStyle.blueButton,
              )),
            ],
          ),
        ],
      ),
    );

  }

}

