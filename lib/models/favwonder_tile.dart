import 'package:flutter/material.dart';

import 'package:wonder_app/models/wonder.dart';
import '../screens/wonder_detail.dart';
class FavWonderTile extends StatelessWidget {
  const  FavWonderTile ({super.key, required this.wonder, required this.onReturningFromDetailScreen});
  final Wonder wonder;
  final Function() onReturningFromDetailScreen;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Colors.grey.shade300,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      onTap: () async {
        await Navigator.push(context,
            MaterialPageRoute(builder: (_)
            =>wonderScreen(wonder: wonder,)));
        onReturningFromDetailScreen();
      },
      leading: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(10),
        child: Hero(
          tag: wonder.title,
          child: Image(image: NetworkImage(wonder.imageUrl),
              fit: BoxFit.cover,
              height: 70,
              width: 70),
        ),
      ),
      title: Text(wonder.title),
      subtitle: Text(wonder.description,maxLines: 2,),
    );
  }
}