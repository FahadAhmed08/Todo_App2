class TodoModel {
  String? sId;
  String? todoTitle;
  String? todoDescription;

  TodoModel({this.sId, this.todoTitle, this.todoDescription});

  TodoModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    todoTitle = json['todo_title'];
    todoDescription = json['todo_description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['todo_title'] = this.todoTitle;
    data['todo_description'] = this.todoDescription;
    return data;
  }
}
