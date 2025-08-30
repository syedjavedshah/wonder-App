import 'package:flutter/material.dart';
import 'package:wonder_app/models/wonder.dart';
import 'package:wonder_app/screens/wonder_detail.dart';

class WonderCard extends StatelessWidget {
  const WonderCard({super.key, required this.wonder});
final Wonder wonder;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: (){
        Navigator.push(context,
        MaterialPageRoute(builder: (_)
        =>wonderScreen(wonder: wonder,)));
      },
      child: Container(
          height: 230,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                  colorFilter: ColorFilter.mode(Colors.black.withValues(alpha: .6), BlendMode.srcOver),
                  fit: BoxFit.cover,
                  image: NetworkImage(wonder.imageUrl))
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
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

      ),
    );
  }
}
