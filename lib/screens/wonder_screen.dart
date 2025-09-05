import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:wonder_app/models/wonder.dart';
import 'package:wonder_app/models/wonder_tile.dart';
import 'package:wonder_app/widgets/wonder_card.dart';

import '../main.dart';
class WonderScreen extends StatefulWidget {
  const WonderScreen({super.key, required this.isCardView});
  final bool isCardView;

  @override
  State<WonderScreen> createState() => _WonderScreenState();
}

class _WonderScreenState extends State<WonderScreen> {
  List<Wonder> wonderOfWorld=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    wonderOfWorld= isar!.writeTxnSync((){
     return isar!.collection<Wonder>().where().findAllSync();
    });
    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(15),
        itemCount: wonderOfWorld.length,
        itemBuilder: (context,index)
    {
      return widget.isCardView
          ? WonderCard(wonder: wonderOfWorld[index],
        onReturningFromDetailScreen: () {
          wonderOfWorld= isar!.writeTxnSync((){
            return isar!.collection<Wonder>().where().findAllSync();
          });
          setState(() {

          });
        },)
          :WonderTile(wonder: wonderOfWorld[index],
        onReturningFromDetailScreen: () {
          wonderOfWorld= isar!.writeTxnSync((){
            return isar!.collection<Wonder>().where().findAllSync();
          });
          setState(() {

          });
        },);
    },
      separatorBuilder: (context,index){
        return SizedBox(height: 20,);
      },

    );
  }
}
