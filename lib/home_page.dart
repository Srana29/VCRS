import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vcrs/created_by.dart';
import 'package:vcrs/pressure_given.dart';
import 'package:vcrs/temperature_given.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("VCRS"),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const GivenPressure()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 25,horizontal: 10),
                child: Material(
                color: Colors.redAccent,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: const Color(0x802196F3),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Container(
                             margin: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                            child: Text("Calculate COP of VCRS\n (given pressure)",style: TextStyle(color: Colors.white))
                           ),
                          ],),
                      ],),
                    ],
                  ),

                ),
          ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const TemperatureGiven()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Material(
                color: Colors.blueAccent,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: const Color(0x802196F3),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                        Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: <Widget>[
                           Container(
                               margin: EdgeInsets.symmetric(horizontal: 10,vertical: 30),
                            child: Text("Calculate COP of VCRS\n (given temperature)",style: TextStyle(color: Colors.white),)
                           ),
                          ],),
                      ],),
                    ],
                  ),

                ),
          ),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const CreatedBy()));
              },
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 15,horizontal: 10),
                child: Material(
                color: Colors.green,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: const Color(0x802196F3),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                        Container(
                            padding: EdgeInsets.all(20),
                            child: Row(
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: <Widget>[
                               Container(
                                child: Text("Created By...",style: TextStyle(color: Colors.white))
                               ),
                          ],)),
                      ],),
                    ],
                  ),

                ),
          ),
              ),
            ),
            ],
          ),
        ),
      ),
    );
  }
}
