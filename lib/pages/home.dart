import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  late String _userToDO;
  List todoList = [];

  @override
  void initState() {
    super.initState();

    todoList.addAll(['Buy milk', 'Wash dishes', 'Купить картохи']);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Список дел'),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: Key(todoList[index]), 
            child: Card(
              child: ListTile(
                title: Text(todoList[index]),
              trailing: IconButton(
                  icon: Icon(
                    Icons.delete_sweep,
                    color: Colors.deepOrangeAccent
                  ),
                  onPressed: () {
                    setState(() {
                      todoList.removeAt(index);
                    });
                  },
                ),
              ),
            ),
            onDismissed: (direction) {
              setState(() {
                todoList.removeAt(index);
              });
            },
          );
        }
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.greenAccent,
          onPressed: () {
            showDialog(context: context, builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Добавить элемент'),
                content: TextField(
                  onChanged: (String value) {
                    _userToDO = value;
                  },
                ),
                actions: [
                  ElevatedButton(onPressed: () {
                    setState(() {
                      todoList.add(_userToDO);
                    });

                    Navigator.of(context).pop();
                  }, child: Text('Добавить')),
                  ElevatedButton(onPressed: () {
                    Navigator.of(context).pop();
                  }, child: Text('отмена')),
                ],
              );

            });
          },
          child: Icon(
            Icons.add_box,
            color: Colors.white
          ),
        ),
    );
  }
}
