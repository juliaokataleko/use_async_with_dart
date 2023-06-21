import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:use_async/app/models/todo.dart';

Future<void> main() async {
  // a programação por padrão é incrona -- executa linha a linha
  // loop de eventos

  // programação assincrona

  var future = Future.delayed(const Duration(seconds: 3));

  print4();

  future.then((value) {
    print("novo 4");
  });

  print("1");
  print("2");
  print("3");

  final todo = await fetch();

  print(todo.title);
  print(todo.toJson());

  // tratamento de excepcoes
  print(stringToInt("yah"));
}

Future<void> print4() async {
  await Future.delayed(const Duration(seconds: 5));
  print("5");
}

Future<Todo> fetch() async {
  var url = Uri.https('jsonplaceholder.typicode.com', 'todos/1');
  var response = await http.get(url);

  var json = jsonDecode(response.body);
  var todo = Todo.fromJson(json);

  return todo;
}

int stringToInt(String text) {
  int value;
  try {
    value = int.parse(text);
  } catch (e) {
    throw Exception("Invalid number ($text)");
  }
  return value;
}
