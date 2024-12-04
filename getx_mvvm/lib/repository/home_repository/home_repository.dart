


// import 'package:getx_mvvm/Network/network_api_services.dart';
// import 'package:getx_mvvm/res/app_url/app_url.dart';

// import '../../models/Home/user_list_model.dart';

// class HomeRepository{

//   final _apiservices=NetworkApiServices();
// //   Future<UserListModel> userListApi() async {
// //   try {
// //     dynamic response = await _apiservices.getApi(AppUrl.userListApi);
// //     if (response != null) {
// //       return UserListModel.fromJson(response);
// //     } else {
// //       throw Exception('Null response from API');
// //     }
// //   } catch (e) {
// //     print('Error fetching user list: $e');
// //     throw e; 
// //   }
// // }

//   Future<UserListModel>userListApi() async{
//        dynamic response=await  _apiservices.getApi(AppUrl.userListApi);
//        print(response);
//     return UserListModel.fromJson(response);

//   }
// }