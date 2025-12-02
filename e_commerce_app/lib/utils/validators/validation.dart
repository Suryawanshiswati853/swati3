class TValidator{
static String? validatemptyfiled(String? filedName,String? value){
    if(value==null || value.isEmpty){
      return '$filedName is required.';
    }
   
      return null;
  }



  
  static String? validateEmail(String? value){
    if(value==null || value.isEmpty){
      return 'Email is required.';
    }
    final emailRegExp=RegExp(r'^[\w-\.]+\@([\w-]+\.)+[\w-]{2,4}$');
    if(!emailRegExp.hasMatch(value)){
      return 'Invalid email address';
    }
      return null;
  }
    static String? validatePassword(String? value){
    if(value==null || value.isEmpty){
      return 'Password is required.';
    }
  //  final emailRegExp=RegExp(r'^[\w-\.]+\@([\w-]+\.)+[\w-]{2,4}$');
    if(value.length<6){
      return 'Password must be 6 characters';
    }
    // if(!value.contains(RegExp(r'^[!@#$%&*(),.?":{}|<>]'))){
    //   return 'Password Must contain at lease one special character';
    // }
      return null;
  }
    static String? validatePhoneNumber(String? value){
    if(value==null || value.isEmpty){
      return 'Phone number is required.';
    }
    final phoneRegExp=RegExp(r'^\d{10}$');
    if(!phoneRegExp.hasMatch(value)){
      return 'Invalid phone number format';
    }
      return null;
  }

}