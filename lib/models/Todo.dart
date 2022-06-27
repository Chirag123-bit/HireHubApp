class Todo {
  int? id;
  String? title;
  String? note;
  int? isCompleted;
  int? color;

  Todo({
    this.id,
    this.title,
    this.note,
    this.isCompleted,
    this.color,
  });

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    note = json['note'];
    isCompleted = json['isCompleted'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['note'] = note;
    data['isCompleted'] = isCompleted;
    data['color'] = color;

    return data;
  }
}
