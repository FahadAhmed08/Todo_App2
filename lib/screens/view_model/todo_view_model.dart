import 'package:flutter/material.dart';
import 'package:fluttre_todo_yt/helper/navigator.dart';
import 'package:fluttre_todo_yt/helper/network.dart';
import 'package:fluttre_todo_yt/screens/model/todo_model.dart';
import 'package:fluttre_todo_yt/screens/view/todo_create.dart';
import 'package:fluttre_todo_yt/screens/view/todo_edit.dart';
import 'package:fluttre_todo_yt/screens/view/todo_list.dart';

class TodoViewModel extends ChangeNotifier {
  // navigateToCreate(context) {
  final NavigationService _navigationService;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  List<TodoModel> allTodos = [];
  TodoViewModel(this._navigationService) {
    getAlltodos();
  }
  //   Navigator.of(context)
  //       .push(MaterialPageRoute(builder: (context) => const TodoCreate()));
  // }
  navigationToCreate() {
    _navigationService.navigate(const TodoCreate());
  }

  navigationToEdit(TodoModel data) {
    titleController.text = data.todoTitle.toString();
    descriptionController.text = data.todoDescription.toString();
    _navigationService.navigate(TodoEdit(
      todoData: data,
    ));
  }

  getAlltodos() async {
    _navigationService.showLoader();
    var resData = await ApiProvider().get('/yt-todo-app');
    allTodos =
        resData.map<TodoModel>((item) => TodoModel.fromJson(item)).toList();
    print(allTodos);
    _navigationService.goBack();
    notifyListeners();
  }

  createTodo() async {
    _navigationService.showLoader();
    var resData = await ApiProvider().post('/yt-todo-app', {
      "todo_title": titleController.text,
      "todo_description": descriptionController.text
    });
    if (resData) {
      getAlltodos();
      _navigationService.goBack();
      _navigationService.navigate(TodoList());
      titleController.clear();
      descriptionController.clear();
    }
  }

  editTodo(id) async {
    _navigationService.showLoader();
    var resData = await ApiProvider().put('/yt-todo-app/$id', {
      "todo_title": titleController.text,
      "todo_description": descriptionController.text
    });
    if (resData) {
      getAlltodos();
      _navigationService.goBack();
      _navigationService.navigate(TodoList());
      titleController.clear();
      descriptionController.clear();
    }
  }

  deleteTodo(id, index) async {
    _navigationService.showLoader();
    var resData = await ApiProvider().delete('/yt-todo-app/${id}');
    _navigationService.goBack();
    if (resData) {
      allTodos.removeAt(index);
      notifyListeners();
    } else {
      print("noDiated");
    }
  }
}
