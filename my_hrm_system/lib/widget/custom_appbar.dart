import 'package:my_hrm_system/res/imports.dart';


class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool showBackButton;
   final bool? showMenuButton;
  final VoidCallback? onBackPressed;
    final VoidCallback? onPressed;
      final bool? showCalenderIcon; 


  final bool showAddIcon; 
   final VoidCallback? onAddPressed;
   
 
  CustomAppBar({
    Key? key,
    required this.title,
    this.showMenuButton,
    this.showBackButton = true,
    this.onBackPressed,
    this.showAddIcon = true, 
    this.onAddPressed,
    this.onPressed,
    this.showCalenderIcon
   
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double allPadding = ResponsiveHelper.isMobile(context)
    ? 10.0
    : ResponsiveHelper.isTablet(context)
        ? 20.0
        : 30.0;
    return AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 250, 250, 250),
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark,
      ),
      backgroundColor: AppColours.blue2,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: showMenuButton == true
    ? Padding(
        padding: EdgeInsets.all(allPadding),
        child: IconButton(
          icon: Icon(Icons.menu, color: AppColours.onPrimary),
          onPressed: onBackPressed ?? () {
            Scaffold.of(context).openDrawer();
          },
        ),
      )
    : showBackButton
        ? Padding(
            padding: EdgeInsets.all(allPadding),
            child: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: AppColours.onPrimary),
              onPressed: onBackPressed ?? () => Navigator.of(context).pop(),
            ),
          )
        : null,

      
      title: Text(
        title,
        style: AppTextStyles.appBar(context),
      ),
      centerTitle: true,
      actions: [
  if (showCalenderIcon == true)
    IconButton(
      icon: Icon(Icons.calendar_today, color: AppColours.onPrimary),
      onPressed: onPressed,
    ),
  if (showAddIcon) 
  Container(
  width: MediaQuery.of(context).size.width * 0.08, 
  height: MediaQuery.of(context).size.width * 0.08, 
  decoration: BoxDecoration(
    shape: BoxShape.circle,
    color: AppColours.blue, 
    //borderRadius: BorderRadius.circular(12), 
  ),
  child: IconButton(
    icon: Icon(Icons.add_outlined, color: AppColours.onPrimary),
    onPressed: onAddPressed,
    tooltip: "Add",
  ),
),

    // IconButton(
    //   icon: Icon(Icons.add_outlined, color: AppColours.onPrimary),
    //   onPressed: onAddPressed,
    // ),
],

      // actions: [
      //   if (showAddIcon) 
      //     IconButton(
      //       icon: Icon(Icons.add, color: AppColours.onPrimary),
      //       onPressed: onAddPressed
      //     ),
      // ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

