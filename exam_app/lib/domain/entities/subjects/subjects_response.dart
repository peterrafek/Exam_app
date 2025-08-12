class SubjectResponseEntity {
  final List<SubjectEntity>? subjects;

  SubjectResponseEntity({this.subjects});
}

class SubjectEntity {
  final String? id;
  final String? name;
  final String? icon;
  final String? createdAt;

  SubjectEntity({this.id, this.name, this.icon, this.createdAt});
}
