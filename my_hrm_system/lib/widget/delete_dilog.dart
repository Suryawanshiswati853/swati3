import 'package:my_hrm_system/res/imports.dart';


class DeleteConfirmationDialog extends StatelessWidget {
  final VoidCallback onDelete;

  const DeleteConfirmationDialog({super.key, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColours.onBackground,
      title:  Text("Confirm Delete",style: AppTextStyles.body(context),),
      content:  Text("Are you sure you want to delete this user?",style: AppTextStyles.body(context),),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child:  Text("Cancel",style: AppTextStyles.body(context),),
        ),
        ElevatedButton(
          onPressed: () {
            onDelete(); 
            Navigator.pop(context);
          },
          child:  Text("Delete",style:AppTextStyles.dialog,),
        ),
      ],
    );
  }
}
