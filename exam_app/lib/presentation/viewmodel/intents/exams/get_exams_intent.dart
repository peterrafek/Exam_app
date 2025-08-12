
sealed class GetExamsIntent {}

class OnSubjectClickIntent extends GetExamsIntent {
  String id;
  OnSubjectClickIntent({required this.id});
}
