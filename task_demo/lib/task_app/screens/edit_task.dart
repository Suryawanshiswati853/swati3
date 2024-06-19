import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:task_demo/components/constants.dart';
import 'package:task_demo/task_app/controller/task_controller.dart';
import 'package:task_demo/task_app/screens/to_do_list.dart';

class EditTaskScreen extends StatefulWidget {
  final String taskId;
  final Map<String, dynamic> taskData;

  EditTaskScreen({
    required this.taskId,
    required this.taskData,
  });
  @override
  _EditTaskScreenState createState() => _EditTaskScreenState();
}

class _EditTaskScreenState extends State<EditTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
 

    final _formKey = GlobalKey<FormState>();
   @override
  void initState() {
    super.initState();
    _titleController.text = widget.taskData['title'] ?? '';
    _descriptionController.text = widget.taskData['description'] ?? '';
  }
Future<void> _updateTask() async {
  if (!mounted) return; 
  
  try {
    String newTitle = _titleController.text;
    String newDescription = _descriptionController.text;

    // Check if there are changes
    if (newTitle == widget.taskData['title'] &&
        newDescription == widget.taskData['description']) {
      Fluttertoast.showToast(
        msg: "No changes made",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: blackColour,
        textColor: whiteColour,
        fontSize: 16.0,
      );
    } else {
      await TaskController().editTask(
        widget.taskId,
        newTitle,
        newDescription,
      );

      if (!mounted) return; 
      

      if (!mounted) return; 
      Navigator.of(context).pop(); 
    }
  } catch (e) {
    if (!mounted) return; 
    print("Error updating task: $e");
   
  }
}



  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
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
           title:  const Text('Edit Task',style: TextStyle(color: whiteColour,fontSize: 20,fontWeight: FontWeight.w500)),
           centerTitle: true,
           
      ),
      body: SingleChildScrollView(
  child:  Padding(
        padding: const EdgeInsets.all(16.0),
          child: Form(
          key: _formKey,
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Padding(padding: const EdgeInsets.only(right: 20,left: 20),
        child:     TextFormField(
          controller: _titleController,
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
    
),
              ),
               const SizedBox(
            height: 20,
          ),
            Padding(padding: const EdgeInsets.only(right: 20,left: 20),
        child:     TextFormField(
          maxLines: 4,
          controller: _descriptionController,
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
               FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z0-9@!#$%^&*()/\s\-.,]')),

                LengthLimitingTextInputFormatter(150),
              ],
  keyboardType: TextInputType.text,
  
   
),

          ),
              
            
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _updateTask();
           
                    Navigator.of(context).pop();
                  }
                },
                style: ElevatedButton.styleFrom(
    backgroundColor: orangeColour, 
    minimumSize: const Size(240, 48), 
  ),
                child: const Text('Edit Task', textAlign: TextAlign.center,
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
