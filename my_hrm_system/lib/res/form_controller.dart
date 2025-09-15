import 'package:my_hrm_system/res/imports.dart';

class FormController {
   String selectedGender = '';
    bool isObscure = true;
    String originalFirstName = '';
   String originalLastName = '';
    String originalEmail = '';
   String originalGender = '';
    String originalPincode = '';
   String originalPassword = '';
   String originalMobileNo = '';
   String originalAddress='';
    String name = '';
  String email = '';
   void clearData() {
    name = '';
    email = '';
   
  }

  void toggleVisibility() {
    isObscure = !isObscure;
   
  }
   DateTime? selectedFromDate;
  DateTime? selectedToDate;
   @override
  void onInit() {
    
    final now = DateTime.now();
    fromDateController.text = DateFormat('dd-MM-yyyy').format(now);
  }

  void pickFromDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedFromDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectedFromDate = picked;
      fromDateController.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }

  void pickToDate(BuildContext context) async {
    final picked = await showDatePicker(
      context: context,
      initialDate: selectedToDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      selectedToDate = picked;
      toDateController.text = DateFormat('dd-MM-yyyy').format(picked);
    }
  }
  
  static final TextEditingController emailController = TextEditingController();
  static final TextEditingController passwordController = TextEditingController();
  static final TextEditingController dateController = TextEditingController();
  static final TextEditingController nameController = TextEditingController();
 static final TextEditingController inTimeController = TextEditingController();
 static final TextEditingController outTimeController = TextEditingController();
 static final TextEditingController lunchInTimeController = TextEditingController();
 static final TextEditingController lunchOutTimeController = TextEditingController();
 final formKey = GlobalKey<FormState>();

 static final TextEditingController fromDateController = TextEditingController();
static  final TextEditingController toDateController = TextEditingController();
 static final TextEditingController reasonController = TextEditingController();

  
 
 static final TextEditingController addressController = TextEditingController();
 static final TextEditingController first_nameController = TextEditingController();
  static  final TextEditingController last_nameController = TextEditingController();
  static      final TextEditingController genderController = TextEditingController();


 static final TextEditingController pincodeController = TextEditingController();

static  final TextEditingController mobilenoController = TextEditingController();
   TextEditingController textController = TextEditingController();

void setUserData(Map<String, dynamic> userData) {
  first_nameController.text = userData['first_name'] ?? '';
  originalFirstName = userData['first_name'] ?? '';

  last_nameController.text = userData['last_name'] ?? '';
  originalLastName = userData['last_name'] ?? '';

  emailController.text = userData['email'] ?? '';
  originalEmail = userData['email'] ?? '';

  passwordController.text = userData['password'] ?? '';
  originalPassword = userData['password'] ?? '';

  mobilenoController.text = userData['mobile no'] ?? '';
  originalMobileNo = userData['mobile no'] ?? '';

  addressController.text = userData['address'] ?? '';
  originalAddress = userData['address'] ?? '';

  pincodeController.text = userData['pincode'] ?? '';
  originalPincode = userData['pincode'] ?? '';

  genderController.text = userData['gender'] ?? '';
  originalGender = userData['gender'] ?? '';

  selectedGender = userData['gender'] ?? '';

}

  
   void selectGender(String gender) {
    selectedGender = gender;
     genderController.text = gender;
  
  }

  static void disposeAll() {
    emailController.dispose();
    passwordController.dispose();
    dateController.dispose();
    nameController.dispose();
      addressController.dispose();
    first_nameController.dispose();
     last_nameController.dispose();
    genderController.dispose();
    mobilenoController.dispose();
    pincodeController.dispose();
  }
}
