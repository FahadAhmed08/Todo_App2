import 'package:flutter/material.dart';
import 'package:fluttre_todo_yt/screens/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoList extends StatelessWidget {
  const TodoList({super.key});

  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<TodoViewModel>(context);
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: const Center(child: Text("Todo List"))),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {
          todocontroller.navigationToCreate();
        },
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          ListView.builder(
              itemCount: todocontroller.allTodos.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, i) {
                return Padding(
                    padding: EdgeInsets.all(8.0),
                    child: ListTile(
                      tileColor: Colors.white,
                      title:
                          Text(todocontroller.allTodos[i].todoTitle.toString()),
                      subtitle: Text(todocontroller.allTodos[i].todoDescription
                          .toString()),
                      trailing: PopupMenuButton(
                        child: const Icon(Icons.more_vert),
                        itemBuilder: (BuildContext context) =>
                            <PopupMenuEntry<String>>[
                          const PopupMenuItem(
                              value: 'edit', child: Text("EDIT")),
                          const PopupMenuItem(
                              value: 'delete', child: Text("Delete")),
                        ],
                        onSelected: (String value) {
                          if (value == "edit") {
                            todocontroller
                                .navigationToEdit(todocontroller.allTodos[i]);
                          }
                          if (value == "delete") {
                            todocontroller.deleteTodo(
                                todocontroller.allTodos[i].sId.toString(), i);
                          }
                        },
                      ),
                    ));
              })
        ],
      ),
    );
  }
}
