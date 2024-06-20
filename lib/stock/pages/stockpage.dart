import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../data/database.dart';
import '../util/dialog_box.dart';
import '../util/todo_tile.dart';

class StockPage extends StatefulWidget {
  const StockPage({super.key});

  @override
  State<StockPage> createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  // reference the hive box
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();

  @override
  void initState() {
    // if this is the 1st time ever openin the app, then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      // there already exists data
      db.loadData();
    }

    super.initState();
  }

  // text controllers
  final _taskController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();

  // save new task
  void saveNewTask() {
    setState(() {
      db.toDoList.add([
        _taskController.text,
        _nameController.text,
        _emailController.text,
        _phoneController.text
      ]);
      _taskController.clear();
      _nameController.clear();
      _emailController.clear();
      _phoneController.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  // create a new task
  void createNewTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          taskController: _taskController,
          nameController: _nameController,
          emailController: _emailController,
          phoneController: _phoneController,
          onSave: saveNewTask,
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  // delete task
  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('TO DO'),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            name: db.toDoList[index][1],
            email: db.toDoList[index][2],
            phoneNumber: db.toDoList[index][3],
            deleteFunction: (context) => deleteTask(index),
          );
        },
      ),
    );
  }
}
