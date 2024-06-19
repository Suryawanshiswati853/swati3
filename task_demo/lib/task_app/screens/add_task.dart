import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:task_demo/task_app/controller/task_controller.dart';
import 'package:task_demo/task_app/screens/to_do_list.dart';

import '../../components/constants.dart';

class AddTaskScreen extends StatefulWidget {
  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  String _title = '';
  String _description = '';

  final TaskController _taskController = TaskController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: backgroundColor,
      appBar:AppBar(  systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: whiteColour,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor:  backgroundColor,
        elevation: 0,
        automaticallyImplyLeading: false,
         leading: Padding(padding: const EdgeInsets.all(10),
       child:  IconButton(
    icon: const Icon(Icons.arrow_back_ios,color: orangeColour,),
    onPressed: () {
     Navigator.push(context, MaterialPageRoute(builder: (context)=>TodoListScreen()));
    },
    )
     ),
           title:  const Text('Add Task',style: TextStyle(color: whiteColour,fontSize: 20,fontWeight: FontWeight.w500)),
           centerTitle: true,
           
      ),
      body: SingleChildScrollView(
  child:     Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
               Padding(padding: const EdgeInsets.only(right: 20,left: 20),
        child:     TextFormField(
           style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
      decoration: InputDecoration(
    hintText: 'Title',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
     fillColor: fillColour3,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide:const BorderSide(color: whiteColour),

    ),
   
  ),
   inputFormatters: [
               FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9\s-]')),
                LengthLimitingTextInputFormatter(30),
              ],
  keyboardType: TextInputType.text,
  validator: (value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your title';
    } 
    return null;
  },
     onChanged: (value) {
                  _title = value;
                },
),

          ),
          const SizedBox(
            height: 20,
          ),
            Padding(padding: const EdgeInsets.only(right: 20,left: 20),
        child:     TextFormField(
          maxLines: 4,
           style: const TextStyle(
              fontSize: 15,
              color: whiteColour
            ),
      decoration: InputDecoration(
    hintText: 'Description',
    hintStyle: const TextStyle(
      color: greyColour,
      fontFamily: 'Poppins',
      fontSize: 15,
    ),
     fillColor: fillColour3,
    filled: true,
    contentPadding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.0),
      borderSide:const BorderSide(color: whiteColour),

    ),
   
  ),
   inputFormatters: [
               FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@!#$%^&*()/\s\-,.]')),

                LengthLimitingTextInputFormatter(60),
              ],
  keyboardType: TextInputType.text,
  
     onChanged: (value) {
                  _description = value;
                },
),

          ),
              
            
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    await _taskController.addTask(_title, _description);
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
    backgroundColor: orangeColour, 
    minimumSize: const Size(240, 48), 
  ),
                child: const Text('Add Task', textAlign: TextAlign.center,
                        style: TextStyle(
                    fontSize: 15,
                    color: blackColour,
                    
                  ),),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
