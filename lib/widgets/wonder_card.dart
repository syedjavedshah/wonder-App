import 'package:flutter/material.dart';
import 'package:wonder_app/models/wonder.dart';
import 'package:wonder_app/screens/wonder_detail.dart';

class WonderCard extends StatelessWidget {
  const WonderCard({super.key, required this.wonder, required this.onReturningFromDetailScreen});
final Wonder wonder;

final void Function() onReturningFromDetailScreen;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: ()async{
      await  Navigator.push(context,
        MaterialPageRoute(builder: (_)
        =>wonderScreen(wonder: wonder,)));
        onReturningFromDetailScreen();
      },
      child: SizedBox(
          height: 230,
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: wonder.title,
                  child: Image(image: NetworkImage(wonder.imageUrl),
                    fit: BoxFit.cover,
                  width: double.maxFinite,
                    color: Colors.black.withValues(alpha: .6),
                    colorBlendMode:BlendMode.srcOver,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(wonder.title
                      ,style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),),
                    Text(wonder.description
                      ,style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white
                      ),
                      maxLines: 2,
                      textAlign: TextAlign.justify,
                    ),
                  ],
                ),
              ),
            ],
          ),

      ),
    );
  }
}
