import 'package:flutter/material.dart';
import 'package:wonder_app/wonder.dart';
import 'package:wonder_app/wonder_card.dart';
class WonderScreen extends StatefulWidget {
  const WonderScreen({super.key});

  @override
  State<WonderScreen> createState() => _WonderScreenState();
}

class _WonderScreenState extends State<WonderScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(15),
        itemCount: wonderOfWorld.length,
        itemBuilder: (context,index)
    {
      return WonderCard(wonder: wonderOfWorld[index]);
    },
      separatorBuilder: (context,index){
        return SizedBox(height: 20,);
      },

    );
  }
}
