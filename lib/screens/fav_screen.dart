import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:wonder_app/models/favwonder_tile.dart';

import '../main.dart';
import '../models/wonder.dart';
import '../widgets/wonder_card.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key, required this.isCardView});
  final bool isCardView;

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  List<Wonder> favWonderOfWorld =[];
  @override
  void initState() {
    super.initState();
       final allWonder= isar!.writeTxnSync(() {
      return isar!.collection<Wonder>().where().findAllSync();
    });

       setState(() {
         favWonderOfWorld= allWonder.where((Wonder)=>Wonder.isFavorite).toList();
       });

  }
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: EdgeInsets.all(15),
      itemCount:favWonderOfWorld.length,
      itemBuilder: (context,index)
      {
        return  widget.isCardView?
        WonderCard(wonder: favWonderOfWorld[index],
            onReturningFromDetailScreen: () {
              final allWonder = isar!.writeTxnSync(() {
                return isar!.collection<Wonder>().where().findAllSync();
              });
              setState(() {
                favWonderOfWorld= allWonder.where((Wonder)=>Wonder.isFavorite).toList();
              });
            }
        ):

       FavWonderTile(wonder: favWonderOfWorld[index],
           onReturningFromDetailScreen:
               () {
             final allWonder = isar!.writeTxnSync(() {
               return isar!.collection<Wonder>().where().findAllSync();
             });
             setState(() {
               favWonderOfWorld= allWonder.where((Wonder)=>Wonder.isFavorite).toList();
             });
           }
       );

      },
      separatorBuilder: (context,index){
        return SizedBox(height: 20,);
      },
    );
  }
}
//WonderCard(wonder: favWonderOfWorld[index],
//             onReturningFromDetailScreen: () {
//               final allWonder = isar!.writeTxnSync(() {
//                 return isar!.collection<Wonder>().where().findAllSync();
//               });
//               setState(() {
//                 favWonderOfWorld= allWonder.where((Wonder)=>Wonder.isFavorite).toList();
//               });
//             }
//         );