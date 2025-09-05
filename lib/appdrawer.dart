import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key, required this.icon, required this.title});
  final Icon icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
      child: ListTile(
        tileColor: Colors.grey.shade300,
        shape: RoundedRectangleBorder(borderRadius:
        BorderRadiusGeometry.circular(10)),
        leading: icon,
        title: Text(title,style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
