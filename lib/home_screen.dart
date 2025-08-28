import 'package:flutter/material.dart';
import 'package:wonder_app/wonder_screen.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
int selectedTab=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('7 wonders')),
          actions: [
            PopupMenuItem(child: Icon(Icons.more_vert_rounded))
          ],
      ),
      drawer: Container(
        color: Colors.green,
        width: 300,
      ),
      body: IndexedStack(
        index: selectedTab,
        children: [
          WonderScreen(),
          Center(child: Text('favorite Screen')),
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
}
