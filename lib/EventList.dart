import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_basic/ClubScreen.dart';
import 'package:flutter_basic/CulturalScreen.dart';
import 'package:flutter_basic/Officialpagesscreen.dart';
import 'package:flutter_basic/SportsScreen.dart';
import 'package:flutter_basic/WebinarScreen.dart';
import 'package:flutter_basic/logout.dart';
import 'package:flutter_basic/newmessages.dart';
import 'package:flutter_basic/try.dart';
import 'package:googleapis/gmail/v1.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EventCategories(),
    );
  }
}

class EventCategories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Event Categories',style: TextStyle(fontFamily: 'Font6',fontSize: 20,fontWeight: FontWeight.w300),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context)=>LogoutPage()));
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          Text('EVENT CATEGORIES',style: TextStyle(fontSize: 40,fontFamily: 'Font6',fontWeight: FontWeight.w700)),
          Center(child: Image.asset('asset/Images/combined2.png',alignment: Alignment.center,)),


          DraggableScrollableSheet(
          initialChildSize: 0.1, // The initial size of the sheet
          minChildSize: 0.1, // The minimum size of the sheet
          maxChildSize: 0.7, // The maximum size of the sheet
          builder: (BuildContext context, ScrollController scrollController) {
            return Stack(
                children:[
                  Container(
                    color: Color.fromARGB(255, 96, 36, 140),
                    child:
                    ListView(
                      controller: scrollController,
                      children: [
                        Container(
                          height: 100,


                          child:Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.star),
                              TextButton(onPressed: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context)=>GmailApp()));
                              },child: Text('Official Notices',
                                style: TextStyle(fontFamily: 'Font6',fontSize: 20,color: Colors.white),),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(

                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.sports),
                              TextButton(onPressed: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context)=>SportsScreen()));
                              },child: Text('Sports',
                                style: TextStyle(fontFamily: 'Font6',fontSize: 20,color: Colors.white),),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.party_mode),
                              TextButton(onPressed: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context)=>ClubScreen()));
                              },child: Text('Club Events',
                                style: TextStyle(fontFamily: 'Font6',fontSize: 20,color: Colors.white),),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 100,

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.temple_hindu),
                              TextButton(onPressed: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context)=>CulturalScreen()));
                              },child: Text('Cultural Events',
                                style: TextStyle(fontFamily: 'Font6',fontSize: 20,color: Colors.white),),),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          
                          height: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.videocam),
                              TextButton(onPressed: (){
                                Navigator.push(context, CupertinoPageRoute(builder: (context)=>WebinarScreen()));
                              },child: Text('Webinars',
                                style: TextStyle(fontFamily: 'Font6',fontSize: 20,color: Colors.white),),),
                            ],
                          ),
                        ),
                      ],
                    ),



                  )]




            );
          },
        ),]
      ),
    );
  }
}




  
