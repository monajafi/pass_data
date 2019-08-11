import 'package:flutter/material.dart';

class Todo {
  final String title;
  final String description;

  Todo(this.title, this.description);
}

void main() => runApp(TodoScreen(
    todos: List<Todo>.generate(
        20,
        (i) => Todo("title #$i",
            "A description of what needs to be done for todo $i"))));


class TodoScreen extends StatelessWidget {
  final List<Todo> todos;

  const TodoScreen({Key key, this.todos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Passing Data",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Todo List"),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DetailScreen(
                              todo: todos[index],
                            )));
              },
            );
          },
        ),
      ),
    );
  }
}

class DetailScreen extends StatelessWidget {
  final Todo todo;

  const DetailScreen({Key key, this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(todo.title),
      ),
      body: Center(
        child: Text(todo.description),
      ),
    );
  }
}
