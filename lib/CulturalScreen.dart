import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CulturalScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Text("Cultural Events",style: TextStyle(fontSize: 20,fontFamily: 'Font6',fontWeight: FontWeight.w300),),
      ),
      body: Container(
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/Images/CulturalImage.jpg',alignment: Alignment.bottomCenter,),

          ],
        ),
      ),
    );
  }

}