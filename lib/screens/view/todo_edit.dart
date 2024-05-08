import 'package:flutter/material.dart';

class TodoEdit extends StatefulWidget {
  final todoData;
  const TodoEdit({super.key, required this.todoData});

  @override
  State<TodoEdit> createState() => _TodoEditState();
}

class _TodoEditState extends State<TodoEdit> {
  final formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      appBar: AppBar(title: const Text("Todo Edit")),
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
                if (formkey.currentState!.validate()) {}
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
