import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wonder_app/appdrawer.dart';
import 'package:wonder_app/screens/fav_screen.dart';
import 'package:wonder_app/screens/wonder_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedTab=0;
bool isCardView=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('7 wonders')),
          actions: [
            PopupMenuButton(
                initialValue: isCardView? 'Card':'List',
                onSelected: (newSelectedValue){
                  if(newSelectedValue=='Card'){
                    setState(() {
                      isCardView=true;
                    });
                  }
                  else{
                    setState(() {
                      isCardView=false;
                    });
                  }
                },
                itemBuilder: (context)
            => [
              PopupMenuItem(child: Text('List'),
                value: 'List',),
              PopupMenuItem(child: Text('Card'),
                value: 'Card',),
            ])
          ],
      ),
      drawer: Drawer(
        child:ListView(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.grey.shade300,
              ),
              accountName: Text('Wonder',style: TextStyle(
                  color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 20
              ),),
              accountEmail: Text('www.javedshah78@gmail.com',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                ),),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage('https://m.media-amazon.com/images/I/51A3gUji6AL._SX300_SY300_QL70_FMwebp_.jpg'),
              ),),
           AppDrawer(icon: Icon(Icons.home,size: 30,), title: 'Home'),
           AppDrawer(icon: Icon(Icons.card_membership_sharp,size: 30,), title: 'Card'),
           AppDrawer(icon: Icon(Icons.list,size: 30,), title: 'List')
          ],
        )
      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
           WonderScreen(isCardView: isCardView),
          FavScreen(key: UniqueKey(), isCardView: isCardView,)
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade300
        ),
        child: Row(
          children: [
            Expanded(child: GestureDetector(
              onTap: (){
              setState(() {
                selectedTab=0;
              });
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(textAlign: TextAlign.center,
                    'Wonders',style: TextStyle(fontSize: 25,
                      fontWeight: selectedTab==0 ?FontWeight.bold:FontWeight.normal
                    ),)),
            )),
            Expanded(child: GestureDetector(
              onTap: (){
              setState(() {
                selectedTab=1;
              });
              },
              child: Container(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    'Favorite',style: TextStyle(fontSize: 25,
                      fontWeight: selectedTab==1 ?FontWeight.bold:FontWeight.normal
                  ),)),
            ))
          ],
        ),
      ),
    );
  }

launchMap({String lat = "47.6", String long = "-122.3"}) async {
  final Uri uri = Uri.parse("geo:$lat,$long?q=$lat,$long(Wonder Location)");

  if (await canLaunchUrl(uri)) {
    await launchUrl(uri, mode: LaunchMode.externalApplication);
  } else {
    debugPrint("Could not launch $uri");
    throw "Could not launch $uri";
  }
}
}
