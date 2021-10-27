import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:vcrs/webview.dart';

class TemperatureGiven extends StatefulWidget {
  const TemperatureGiven({Key? key}) : super(key: key);

  @override
  _TemperatureGivenState createState() => _TemperatureGivenState();
}

class _TemperatureGivenState extends State<TemperatureGiven> {

  late double mfr;
  late double qL;
  late double q2;
  late double wc;
  late double cop;
  late double h1;
  late double h2;
  late double h3;
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  getResult(double mfr,double h1,double h2,double h3) async{
   wc = mfr*(h2-h1);
    qL = mfr*(h1-h3);
    cop = qL/wc;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("At Given Temperature"),
      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 8.0, right: 8.0),
              child: Material(
                color: Colors.white,
                elevation: 14.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(children: <Widget>[
                            InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>View("http://www.peacesoftware.de/einigewerte/r134a_e.html")));

                              },
                              child: Container(child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,

                                children: <Widget>[
                                  Container(
                                    child: Icon(CupertinoIcons.question_circle,
                                      color: Color(0xFFED1D7F),
                                    ),),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 5),
                                    child: Text("Calculate Saturated vapour,\nSaturated Liquid,\nSuperheated Vapor" ,
                                      style: TextStyle(
                                          color: Colors.black, fontSize: 18.0)),),
                                ],)),
                            ),
                          ],)
                      ),
                    ],
                  ),

                ),
              ),
            ),
            const SizedBox(
              height: 18,
            ),

            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom:12,left: 10,right: 10),
                  child: TextFormField(
                    // controller: mof,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    keyboardType: TextInputType.phone,
                    decoration:  const InputDecoration(
                      labelText: 'Mass Flow Rate kg/s',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.ac_unit),
                    ),
                    onChanged: (s) {
                      if (double.tryParse(s) != null) {
                        setState(() {
                          mfr = double.parse(s);
                        });
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:12,left: 10,right: 10),
                  child: TextFormField(
                    // controller: mof,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    keyboardType: TextInputType.phone,
                    decoration:  const InputDecoration(
                      labelText: 'Saturated Vapor Enthalpy kJ/kg',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.ac_unit),
                    ),
                    onChanged: (s) {
                      if (double.tryParse(s) != null) {
                        setState(() {
                          h1 = double.parse(s);
                        });
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:12,left: 10,right: 10),
                  child: TextFormField(
                    // controller: mof,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    keyboardType: TextInputType.phone,
                    decoration:  const InputDecoration(
                      labelText: 'Superheated Vapor Enthalpy kJ/kg',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.ac_unit),
                    ),
                    onChanged: (s) {
                      if (double.tryParse(s) != null) {
                        setState(() {
                          h2 = double.parse(s);
                        });
                      }
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom:12,left: 10,right: 10),
                  child: TextFormField(
                    // controller: mof,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?\.?\d{0,2}'))
                    ],
                    keyboardType: TextInputType.phone,
                    decoration:  const InputDecoration(
                      labelText: 'Saturated Liquid Enthalpy kJ/kg',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.ac_unit),
                    ),
                    onChanged: (s) {
                      if (double.tryParse(s) != null) {
                        setState(() {
                          h3 = double.parse(s);
                        });
                      }
                    },
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    ElevatedButton(
                      onPressed: () async {
                        // if(_formkey.currentState!.validate()){

                          await getResult(mfr.toDouble(),h1.toDouble(),h2.toDouble(),h3.toDouble());
                          showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: const Text("Result:",),
                                content: Column(
                                  //mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("Ql = ${qL.toStringAsFixed(3)} Kw",style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(height: 7,),
                                    Text("Wc = ${wc.toStringAsFixed(3)} Kw",style: TextStyle(fontWeight: FontWeight.bold)),
                                    SizedBox(height: 7,),
                                    Text("COP = ${cop.toStringAsFixed(3)}",style: TextStyle(fontWeight: FontWeight.bold),),
                                  ],
                                ),
                                actions: <Widget>[
                                  ElevatedButton(
                                    onPressed: () =>   Navigator.of(context).pop(true),  //exit(0),
                                    child: const Text("Ok"),
                                  ),
                                ],
                              ));
                       // }

                      }, child: const Text('Submit'),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width/3.6,
                    ),
                    ElevatedButton(
                      onPressed: (){
                        Navigator.of(context).pop();
                      }, child: const Text('Cancel'),
                    ),

                  ],
                )
              ],
            ),
            
          ],
        ),
      ),
    );
  }
}
