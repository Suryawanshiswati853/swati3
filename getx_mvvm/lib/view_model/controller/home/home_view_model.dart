
// import 'package:get/get.dart';
// import 'package:getx_mvvm/response/status.dart';

// import '../../../models/Home/user_list_model.dart';
// import '../../../repository/home_repository/home_repository.dart';

// class Homecontroller extends GetxController{



//   final api=HomeRepository();

//   final rxRequestStatus=Status.LOADING.obs;
//   final userList=UserListModel().obs;
//   void setRxRequestStatus(Status _value)=>rxRequestStatus.value=_value;
//   void setUserList(UserListModel _value)=>userList.value=_value;



//   void userListApi(){
//     api.userListApi().then((value) => {
//     setRxRequestStatus(Status.COMPLETED),
//     setUserList(value),
//     }).onError((error, stackTrace) => {
// setRxRequestStatus(Status.ERROR)

//     });
    
//   }

// }