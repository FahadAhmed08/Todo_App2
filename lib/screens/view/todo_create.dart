import 'package:flutter/material.dart';
import 'package:fluttre_todo_yt/screens/view_model/todo_view_model.dart';
import 'package:provider/provider.dart';

class TodoCreate extends StatefulWidget {
  const TodoCreate({super.key});

  @override
  State<TodoCreate> createState() => _TodoCreateState();
}

class _TodoCreateState extends State<TodoCreate> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final todocontroller = Provider.of<TodoViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(title: Text("Todo List")),
      body: Form(
        key: formkey,
        child: SizedBox(
          width: double.infinity,
          child: Column(children: [
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 400,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                  controller: todocontroller.titleController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required Field";
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                      hintText: "Enter Title",
                      hintStyle: TextStyle(color: Colors.grey))),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 400,
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                  controller: todocontroller.descriptionController,
                  maxLines: 5,
                  minLines: 3,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Required Field";
                    }
                    return null;
                  },
                  style: const TextStyle(color: Colors.red),
                  decoration: const InputDecoration(
                      hintText: "Enter Description",
                      hintStyle: TextStyle(color: Colors.grey))),
            ),
            const SizedBox(
              height: 25,
            ),
            GestureDetector(
              onTap: () {
                if (formkey.currentState!.validate()) {
                  todocontroller.createTodo();
                }
              },
              child: Container(
                width: 400,
                height: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                child: const Center(
                    child: Text(
                  "SAVE",
                  style:
                      TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
                )),
              ),
            )
          ]),
        ),
      ),
    );
  }
}
