
import 'package:getx_mvvm/response/status.dart';

class ApiResponse<T>{
  Status? status;
  T? data;
  String? message;
  ApiResponse(this.status,this.data,this.message);
  
  ApiResponse.loading(this.data):status=Status.LOADING;

  ApiResponse.completed():status=Status.COMPLETED;

  ApiResponse.error(this.message):status=Status.ERROR;

  @override
   String toString(){
  return 'Status:$status \n Message:$message \n Data:$data';
}
}