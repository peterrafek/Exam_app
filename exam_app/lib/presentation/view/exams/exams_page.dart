import 'package:exam_app/domain/entities/subjects/subjects_response.dart';
import 'package:exam_app/presentation/widgets/exams/list_of_exams.dart';
import 'package:flutter/material.dart';

import '../../../core/app_style.dart';

class ExamsPage extends StatelessWidget {
  const ExamsPage({super.key, required this.item});

  final SubjectEntity item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          item.name ?? '',
          style: AppStyle.appBarTitle,
        ),
      ),
      body: ListOfExams(id: item.id ?? ''), // Use the id from SubjectEntity
    );
  }
}
