

import 'package:getx_mvvm/Network/network_api_services.dart';
import 'package:getx_mvvm/res/app_url/app_url.dart';

class LoginRepository{

  final _apiservices=NetworkApiServices();
  Future<dynamic>loginApi(var data) async{
    dynamic response= await _apiservices.postApi(data, AppUrl.loginApi);
    return response;

  }
}