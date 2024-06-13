import 'package:demo2/components/constants.dart';
import 'package:demo2/controller/user_controller.dart';
import 'package:demo2/screens/edit_user/edit_user.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

class UserListScreen extends StatefulWidget {
  @override
  _UserListScreenState createState() => _UserListScreenState();
}

class _UserListScreenState extends State<UserListScreen> {
  final UserController _userController = UserController();
  bool _isLoading = true;
  List<DocumentSnapshot> _users = [];
  bool _hasError = false;
  String _errorMessage = '';
  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  Future<void> _fetchUsers() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    try {
      List<DocumentSnapshot> users = await _userController.getAllUsers();
      setState(() {
        _users = users;
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


   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
         systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Color.fromARGB(255, 250, 250, 250),
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: orangeColour,
        elevation: 0,
        automaticallyImplyLeading: false,
         leading: const Padding(padding: EdgeInsets.all(10),
       
  
         ),
                    title:  const Text('UserList',style: TextStyle(color: whiteColour,fontSize: 20,fontWeight: FontWeight.w500)),
           centerTitle: true,

      
        actions: [
          IconButton(
            icon: const Icon(Icons.logout,color: whiteColour,),
            onPressed: () {
              _userController.signOut(context);
            },
          ),
        ],
      ),
   body: 
      _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _hasError
              ? Center(child: Text('Error: $_errorMessage'))
              : _users.isEmpty
                  ? const Center(child: Text('No users found'))
                  : RefreshIndicator(
                      onRefresh: _fetchUsers,
                     
                    child:    ListView.builder(
                        itemCount: _users.length,
                        itemBuilder: (context, index) {
                          Map<String, dynamic> userData = _users[index].data() as Map<String, dynamic>;
                           String userId = _users[index].id;
                          return  Padding(padding: const EdgeInsets.only(right:10,left: 10,top: 20),
                         child:   Card(
                          color: const Color.fromARGB(255, 11, 65, 94),
                         child:   ListTile(
                            title:

                             Text(userData['name'] ?? 'No Name', style: const TextStyle(color:whiteColour),),
                            subtitle: Text(userData['email'] ?? 'No Email',style: const TextStyle(color:whiteColour)),
                             trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit,color: whiteColour,),
                              onPressed: () {
                                 Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => EditUser(
          userId: userId,
          initialName: userData['name'] ?? '',
          initialEmail: userData['email'] ?? '',
          initialMobile: userData['mobile no'] ?? '',
          initialAddress: userData['address'] ?? '',
        ),
      ),
    );
              
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete,color: whiteColour,),
                              onPressed: () {
                                  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Delete User',style: TextStyle(fontSize: 20,color: blackColour,fontWeight: FontWeight.w500),),
          content: const Text('Are you sure you want to delete this user?',style: TextStyle(fontSize: 14,color: blackColour),),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); 
              },
              child: const Text('Cancel',style: TextStyle(fontSize: 15,color: orangeColour),),
            ),
            TextButton(
              onPressed: () async {
                await _userController.deleteUser(userId);
                Navigator.of(context).pop(); 
                _fetchUsers();
              },
              child: const Text('Delete',style: TextStyle(fontSize: 15,color: orangeColour),),
            ),
          ],
        );
      },
    );

                                
                              
                        })]))));
                        },
                      ),
                    ),
    );
  }
}

