import 'package:flutter/material.dart';

class CreatedBy extends StatelessWidget {
  const CreatedBy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Created By"),
      ),
      body: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.symmetric(vertical: 150,horizontal: 10),
        child: Material(
          color: Colors.white,
          elevation: 14.0,
          borderRadius: BorderRadius.circular(24.0),
          shadowColor: const Color(0x802196F3),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Column(
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const <Widget>[
                      Text("Saksham Rana 2K20/AE/56",style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 18),),
                      Text("Mansi Kohli 2K20/AE/38",style: TextStyle(color: Colors.blueAccent,fontWeight: FontWeight.bold,fontSize: 18),),
                      Text("Yash Dalal 2K20/AE/78",style: TextStyle(color: Colors.green,fontWeight: FontWeight.bold,fontSize: 18),),
                      SizedBox(height: 5,),
                      Text("DTU Thermodynamics AE205\n MTE Project",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold)),
                      SizedBox(height: 3,),
                      Text(" UNDER GUIDANCE OF: PROF R.S. MISHRA  \nEX- DEAN\nEX-HOD\nEX-CHAIRMAN (DRC)",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold))
                    ],),
                ],),
            ],
          ),
        ),
      ),
    );
  }
}
