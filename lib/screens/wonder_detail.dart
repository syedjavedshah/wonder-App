import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:wonder_app/models/wonder.dart';
class wonderScreen extends StatelessWidget {
  const wonderScreen ({super.key, required this.wonder});
final Wonder wonder;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(
  title: Center(child: Text(wonder.title,
  style: TextStyle(
      fontFamily: 'Medium'
  ),)),
      leading: GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios_outlined)),
),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image(image: NetworkImage(wonder.imageUrl)))
            ,SizedBox(height: 20,)
            ,Text(
                textAlign: TextAlign.justify,
                wonder.description,style:TextStyle(
              fontSize: 20
            ),),
            SizedBox(height: 20,),
           RichText(text: TextSpan(
             text: 'Country:  ',style: TextStyle(
             color: Colors.black,
             fontSize: 20,
             fontFamily: 'Rubik',
             fontWeight: FontWeight.bold
           ),
             children:[
               TextSpan(
                 text: wonder.country,style: TextStyle(
               fontWeight: FontWeight.normal
           ),
               )
             ]
           )),
            RichText(text: TextSpan(
                text: 'Region:  ',style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
                children:[
                  TextSpan(
                    text: wonder.region,style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                  )
                ]
            )),
            RichText(text: TextSpan(
                text: 'Coordinates:  ',style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
                children:[
                  TextSpan(
                    text:'${wonder.coordinates.longitude},${wonder.coordinates.latitude}'
                    ,recognizer: TapGestureRecognizer()..onTap=(){
                      print('javed');
                  },
                    style: TextStyle(
                    decoration: TextDecoration.underline,
                      fontWeight: FontWeight.normal,
                        color: Colors.blue,
                  ),
                  )
                ]
            ))
          ],
        ),
      ),
    );
  }
}
