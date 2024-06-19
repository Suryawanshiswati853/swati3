import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_demo/components/constants.dart';
import 'package:task_demo/task_app/controller/task_controller.dart';
import 'package:task_demo/task_app/screens/add_task.dart';
import 'package:task_demo/task_app/screens/edit_task.dart';

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final TaskController _taskController = TaskController();
 List<DocumentSnapshot> _tasks = [];
   bool _isLoading = true;
    bool _hasError = false;
  String _errorMessage = '';


  @override
  void initState() {
    super.initState();
    _fetchTasks();
  }
  Future<void> _fetchTasks() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      List<DocumentSnapshot> tasks = await _taskController.fetchTasks();
      setState(() {
        _tasks = tasks;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
        _hasError = true;
        _errorMessage = e.toString();
      });
    }
  }

 Future<void> _deleteTask(String taskId) async {
    try {
      await _taskController.deleteTask(taskId);
      _fetchTasks();
    } catch (e) {
      print("Error deleting task: $e");
    }
  }

  @override
    Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
     
        title: const Text(
          'To Do List',
          style: TextStyle(color: whiteColour, fontSize: 20),
        ),
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: whiteColour,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.dark,
        ),
        centerTitle: true,
      ),
      body: _tasks.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _tasks.length,
              itemBuilder: (context, index) {
                final task = _tasks[index];
                final taskData = task.data() as Map<String, dynamic>;
                if (taskData != null) {
      
                return Padding(padding: EdgeInsets.only(right: 10,left: 10),
              child:    Card(
                  color: const Color.fromARGB(115, 45, 39, 39),
                  child: ListTile(
                    title: Text(
                      taskData['title'],
                      style: const TextStyle(color: whiteColour,fontSize: 18),
                    ),
                    subtitle: Text(
                      taskData['description'] ?? '',
                      style: const TextStyle(color: greyColour,fontSize: 15),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Checkbox(
                          checkColor: whiteColour,
                          hoverColor: whiteColour,
                          focusColor: BlueColour,
                          value: taskData['completed'] ?? false,
                          onChanged: (value) async {
                            await _taskController.toggleTaskCompletion(
                                task.id, taskData['completed']);
                            _fetchTasks();
                          },
                        ),
                         IconButton(
                              icon: const Icon(Icons.delete,color: whiteColour,),
                              onPressed: () {
                                  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: backgroundColor,
          title: const Text('Delete User',style: TextStyle(fontSize: 20,color: whiteColour,fontWeight: FontWeight.w500),),
          content: const Text('Are you sure you want to delete this user?',style: TextStyle(fontSize: 14,color: whiteColour),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancel',style: TextStyle(fontSize: 15,color: orangeColour),),
            ),
            TextButton(
              onPressed: () async {
               await _deleteTask(task.id);
                Navigator.of(context).pop(); 
                
              },
              child: const Text('Delete',style: TextStyle(fontSize: 15,color: orangeColour),),
            ),
          ],
        );
      },
    );

                                
                              
                        })
                      
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditTaskScreen(
          taskId: task.id,
          taskData: taskData,
        ),
      ),
    
  ).then((_) => _fetchTasks());
} 

                     
          
                  ),
                ));
                }
              },
              
            ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: orangeColour,
        onPressed: () {
          Navigator.of(context)
              .push(
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(),
            ),
          )
              .then((_) => _fetchTasks());
        },
        child: const Icon(Icons.add,color: blackColour,),
      ),
    );
  }
}

