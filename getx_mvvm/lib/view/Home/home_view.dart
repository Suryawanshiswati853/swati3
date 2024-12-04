

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/routes/routes_name.dart';
import 'package:getx_mvvm/response/status.dart';

import '../../view_model/controller/home/home_view_model.dart';
import '../../view_model/controller/user_preference/user_preference_view_model.dart';

class HomeView extends StatefulWidget{
  _HomeViewState createState()=> _HomeViewState();
}
  class _HomeViewState extends State<HomeView>{
   // final  homecontroller=Get.put(Homecontroller());
    UserPreference userPreference=UserPreference();
    @override
    void initState(){
      super.initState();
     // homecontroller.userListApi();
    }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text("Home",style: TextStyle(
          color: Colors.white
        ),),
        backgroundColor: Colors.purple,
        actions: [
        IconButton(onPressed: (){
          userPreference.removeUser().then((value) => {
             Get.toNamed(RouteNames.loginView)
          });
        },
         icon:Icon (Icons.logout,color: Colors.white,))
        ],
       // centerTitle: true,
       // automaticallyImplyLeading: false,
       // title: Text('home'.tr),
      ),
      // body: Obx(() {
      //   switch(homecontroller.rxRequestStatus.value){
      //        case Status.LOADING:
      //     return Center(
      //      child: CircularProgressIndicator());
      //       case Status.ERROR:
      //     return Center(
      //      child: Text("Something went to wrong"));
      //       case Status.COMPLETED:
      //     return Center(
      //     //  child: ListView.builder(
      //     //   itemCount:  homecontroller.userList.value.data?.length ?? 0,
      //     //   itemBuilder: (context,index){
      //     //   return Card(
      //     //     child:ListTile(
      //     //       leading:CircleAvatar(
      //     //         backgroundImage: NetworkImage(homecontroller.userList.value.data![index].avatar.toString()),
      //     //       ),
      //     //       title: Text(homecontroller.userList.value.data![index].email.toString() ),
      //     //  //subtitle: Text(homecontroller.userList.value.data![index].email.toString()),

      //     //     ) ,
      //     //   );
      //     //  }
      //     //  )
      //     );

       // }
      
        //  switch(homecontroller.rxRequestStatus.value){
        //   case Status.LOADING:
        //   return Center(
        //    child: CircularProgressIndicator());
        //     case Status.ERROR:
        //   return Center(
        //    child: Text("Something went to wrong"));
        //     case Status.LOADING:
        //   return Center(
        //    child: ListView.builder(
        //     itemCount: homecontroller.userList.value.data!.length,
        //     itemBuilder: (context,index){
            
        //     return Card(
        //       child:ListTile(
        //         title: Text(homecontroller.userList.value.data![index].firstName.toString()),
        //       ) ,
        //     );
        //    }
        //    )
        //    );
        //  // default:'';
        //    }
      
      //}),
    );
  }
  }