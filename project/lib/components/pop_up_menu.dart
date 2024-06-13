 import 'package:flutter/material.dart';


class CustomPopupMenuButton extends StatelessWidget {
  final void Function(String) onItemSelected;

  const CustomPopupMenuButton({
    Key? key,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      icon: Icon(Icons.menu, color: Colors.orange),
      onSelected: onItemSelected,
      itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
        PopupMenuItem<String>(
          value: 'user',
          height: 100, // Set height for user item
          child: ListTile(
            title: Column(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                SizedBox(height: 5),
                Text('John Doe'),
                Text('john.doe@example.com'),
              ],
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option1',
          child: SizedBox(
            width: 500, // Set width for options
            height: 60, // Set height for options
            child: ListTile(
              leading: Icon(Icons.settings),
              title: Text('Option 1'),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: SizedBox(
            width: 500, // Set width for options
            height: 60, // Set height for options
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('Option 2'),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: SizedBox(
            width: 500, // Set width for options
            height: 60, // Set height for options
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('Option 2'),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: SizedBox(
            width: 500, // Set width for options
            height: 60, // Set height for options
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('Option 2'),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: SizedBox(
            width: 500, // Set width for options
            height: 60, // Set height for options
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('Option 2'),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: SizedBox(
            width: 500, // Set width for options
            height: 60, // Set height for options
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('Option 2'),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: SizedBox(
            width: 500, // Set width for options
            height: 60, // Set height for options
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('Option 2'),
            ),
          ),
        ),
        PopupMenuItem<String>(
          value: 'option2',
          child: SizedBox(
            width: 500, // Set width for options
            height: 60, // Set height for options
            child: ListTile(
              leading: Icon(Icons.info),
              title: Text('Option 2'),
            ),
          ),
        ),
      ],
    );
  }
}


// import 'package:flutter/material.dart';

// class CustomPopupMenuButton extends StatelessWidget {
//   final void Function(String) onItemSelected;

//   const CustomPopupMenuButton({
//      Key? key,
//     required this.onItemSelected,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return PopupMenuButton<String>(
//       icon: Icon(Icons.menu, color: Colors.orange),
//       onSelected: onItemSelected,
//       itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
//         PopupMenuItem<String>(
//           value: 'option1',
//           child: ListTile(
//             leading: Icon(Icons.home_outlined),
//             title: Text('Home'),
//              onTap: () => onItemSelected('option1'),
//           ),
//         ),
//         PopupMenuItem<String>(
//           value: 'option2',
//           child: ListTile(
//             leading: Icon(Icons.info),
//             title: Text('Option 2'),
//              onTap: () => onItemSelected('option2'),
//           ),
//         ),
//       ],
//     );
//   }
// }
