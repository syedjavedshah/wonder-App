import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:wonder_app/models/wonder.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main.dart';
class wonderScreen extends StatefulWidget {
  const wonderScreen ({super.key, required this.wonder});
final Wonder wonder;
  @override
  State<wonderScreen> createState() => _wonderScreenState();

   static Future<void> openMap(Coordinates coordinates) async {
      String googleUrl = 'https://www.google.com/maps/search/?api=1&query=${coordinates.latitude},${coordinates.longitude}';
      if (await canLaunchUrl(Uri.parse(googleUrl))) {
    await launchUrl(Uri.parse(googleUrl));
    } else {
    throw 'Could not open the map.';
    }
  }
  }

class _wonderScreenState extends State<wonderScreen> {

  bool isFav=false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    setState(() {
      isFav=widget.wonder.isFavorite;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text(widget.wonder.title,
          style: TextStyle(
              fontFamily: 'Medium'
          ),)),
        actions: [
         IconButton(onPressed: (){
           final newWonder=Wonder(
             id: widget.wonder.id,
               coordinates: widget.wonder.coordinates,
               country: widget.wonder.country,
               region: widget.wonder.region,
               title: widget.wonder.title,
               description: widget.wonder.description,
               imageUrl: widget.wonder.imageUrl,
               isFavorite: !isFav);
           isar!.writeTxnSync(() {
             isar!.collection<Wonder>().putSync(newWonder);

           });
           setState(() {
             isFav=!isFav;
           });
         },
             icon:  Icon(isFav?Icons.favorite:Icons.favorite_outline_outlined,),),
          SizedBox(width: 20,)
        ],
        leading: GestureDetector(
            onTap: () {
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
                child: Hero(
                  tag: widget.wonder.title,
                  child: Image(image: NetworkImage(widget.wonder.imageUrl),
                  height: 300,
                  fit: BoxFit.cover,),
                ))
            , SizedBox(height: 20,)
            , Text(
              textAlign: TextAlign.justify,
              widget.wonder.description, style: TextStyle(
                fontSize: 20
            ),),
            SizedBox(height: 20,),
            RichText(text: TextSpan(
                text: 'Country:  ', style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontFamily: 'Rubik',
                fontWeight: FontWeight.bold
            ),
                children: [
                  TextSpan(
                    text: widget.wonder.country, style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                  )
                ]
            )),
            RichText(text: TextSpan(
                text: 'Region:  ', style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
                children: [
                  TextSpan(
                    text: widget.wonder.region, style: TextStyle(
                      fontWeight: FontWeight.normal
                  ),
                  )
                ]
            )),
            RichText(text: TextSpan(
                text: 'Coordinates:  ', style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold
            ),
                children: [
                  TextSpan(
                    text: '${widget.wonder.coordinates.latitude},${widget.wonder.coordinates
                        .longitude}'
                    , recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      wonderScreen.openMap(widget.wonder.coordinates);
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



