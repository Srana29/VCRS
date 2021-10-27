import 'package:flutter/material.dart';
import 'package:flutter/services.dart';



class GivenPressure extends StatefulWidget {
  const GivenPressure({Key? key}) : super(key: key);

  @override
  _CreateNewLeadState createState() => _CreateNewLeadState();
}

class _CreateNewLeadState extends State<GivenPressure> {


 // TextEditingController mof = TextEditingController();
  late double mof;
  late double q1;
  late double q2;
  late double wc;
  late double cop;
  late double h1;
  late double h2;
  late double h3;
  late double h4;
  late double pressure1;
  late double pressure2;
  double? p1;
  double? p2;
  bool isLoading= true;

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  getResult(double pressure1, double pressure2, double mof) async{
    if(pressure2 == 227.8) {
      h3=h4=3.9;
    }else if(pressure2 == 231.5) {
      h3=h4=11.3;
    }else if(pressure2 == 234.5) {
      h3=h4=17.3;
    }else if(pressure2 == 237) {
      h3=h4=22.5;
    }else if(pressure2 == 239.2) {
      h3=h4=27.1;
    }else if(pressure2 == 241.1) {
      h3=h4=31.2;
    }else if(pressure2 == 242.9) {
      h3=h4=35;
    }else if(pressure2 == 244.5) {
      h3=h4=38.5;
    }else if(pressure2 == 245.9) {
      h3=h4=41.7;
    }else if(pressure2 == 247.3) {
      h3=h4=44.7;
    }else if(pressure2 == 248.6) {
      h3=h4=47.5;
    }else if(pressure2 == 249.7) {
      h3=h4=50.2;
    }else if(pressure2 == 250.9) {
      h3=h4=52.8;
    }else if(pressure2 == 251.9) {
      h3=h4=55.2;
    }else if(pressure2 == 252.9) {
      h3=h4=57.5;
    }else if(pressure2 == 253.8) {
      h3=h4=59.8;
    }else if(pressure2 == 255.6) {
      h3=h4=64;
    }else if(pressure2 == 259.3) {
      h3=h4=73.4;
    }else if(pressure2 == 262.4) {
      h3=h4=81.5;
    }else if(pressure2 == 265.1) {
      h3=h4=88.8;
    }else if(pressure2 == 267.3) {
      h3=h4=95.5;
    }else if(pressure2 == 269.3) {
      h3=h4=101.6;
    }else if(pressure2 == 271) {
      h3=h4=107.4;
    }else if(pressure2 == 273.9) {
      h3=h4=117.8;
    }else if(pressure2 == 276.2) {
      h3=h4=127.3;
    }else if(pressure2 == 277.9) {
      h3=h4=136;
    }else if(pressure2 == 279.2) {
      h3=h4=144.1;
    }else if(pressure2 == 280.1) {
      h3=h4=151.8;
    }else if(pressure2 == 280.9) {
      h3=h4=169.7;
    }else{
      h3=h4=186.6;
    }

    h1 = pressure1;
    h2 = pressure2;
    q2 = mof*(h1-h4);
    q1 = mof*(h2-h3);
    wc = mof*(h2-h1);
    cop = (h1-h4)/(h2-h1);
  }

  List<DropdownMenuItem<double>> get dropdownItems{
    List<DropdownMenuItem<double>> menuItems = const [
      DropdownMenuItem(child: Text("0.06"),value: 227.8),
      DropdownMenuItem(child: Text("0.08"),value: 231.5),
      DropdownMenuItem(child: Text("0.10"),value: 234.5),
      DropdownMenuItem(child: Text("0.12"),value: 237),
      DropdownMenuItem(child: Text("0.14"),value: 239.2),
      DropdownMenuItem(child: Text("0.16"),value: 241.1),
      DropdownMenuItem(child: Text("0.18"),value: 242.9),
      DropdownMenuItem(child: Text("0.20"),value: 244.5),
      DropdownMenuItem(child: Text("0.22"),value: 245.9),
      DropdownMenuItem(child: Text("0.24"),value: 247.3),
      DropdownMenuItem(child: Text("0.26"),value: 248.6),
      DropdownMenuItem(child: Text("0.28"),value: 249.7),
      DropdownMenuItem(child: Text("0.30"),value: 250.9),
      DropdownMenuItem(child: Text("0.32"),value: 251.9),
      DropdownMenuItem(child: Text("0.34"),value: 252.9),
      DropdownMenuItem(child: Text("0.36"),value: 253.8),
      DropdownMenuItem(child: Text("0.4"),value: 255.6),
      DropdownMenuItem(child: Text("0.5"),value: 259.3),
      DropdownMenuItem(child: Text("0.6"),value: 262.4),
      DropdownMenuItem(child: Text("0.7"),value: 265.1),
      DropdownMenuItem(child: Text("0.8"),value: 267.3),
      DropdownMenuItem(child: Text("0.9"),value: 269.3),
      DropdownMenuItem(child: Text("1.0"),value: 271),
      DropdownMenuItem(child: Text("1.2"),value: 273.9),
      DropdownMenuItem(child: Text("1.4"),value: 276.2),
      DropdownMenuItem(child: Text("1.6"),value: 277.9),
      DropdownMenuItem(child: Text("1.8"),value: 279.2),
      DropdownMenuItem(child: Text("2.0"),value: 280.1),
      DropdownMenuItem(child: Text("2.5"),value: 280.9),
      DropdownMenuItem(child: Text("3.0"),value: 279.2),
    ];
    return menuItems;
  }

  Future getDetails() async{

    if(mounted) {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDetails();

  }



  @override
  Widget build(BuildContext context) {
    return isLoading ? const Scaffold(body: Center(child: CircularProgressIndicator(color: Colors.black,),),) :
      Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text("At Given Pressure"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              const SizedBox(
                height: 18,
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
                    labelText: 'Mass Flow Rate kg/s',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.ac_unit),
                  ),
                  onChanged: (s) {
                    if (double.tryParse(s) != null) {
                      setState(() {
                        mof = double.parse(s);
                      });
                    }
                  },
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(bottom:12,left: 10,right: 10),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: "Pressure 1 in MPa",
                      enabledBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        //  borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      // fillColor: Colors.blueAccent,
                    ),
                    validator: (value) => value == null ? "Select pressure" : null,

                    //  dropdownColor: Colors.blueAccent,
                    value: p1,
                    onChanged: (double? newValue) {
                      setState(() {
                        p1 = newValue!;
                      });
                    },
                    items: dropdownItems),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom:12,left: 10,right: 10),
                child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      hintText: "Pressure 2 in MPa",
                      enabledBorder: OutlineInputBorder(
                        // borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      border: OutlineInputBorder(
                        //  borderSide: BorderSide(color: Colors.blue, width: 2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      filled: true,
                      //fillColor: Colors.blueAccent,
                    ),
                    validator: (value) => value == null ? "Select pressure" : null,
                    // dropdownColor: Colors.blueAccent,
                    value: p2,
                    onChanged: (double? newValue) {
                      setState(() {
                        p2 = newValue!;
                      });
                    },
                    items: dropdownItems),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  ElevatedButton(
                    onPressed: () async {
                      if(_formkey.currentState!.validate()){

                        await getResult(p1!.toDouble(),p2!.toDouble(),mof.toDouble());
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                              title: const Text("Result:",),
                              content: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text("Q1 = ${q1.toStringAsFixed(3)} Kw",style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(height: 7,),
                                  Text("Q2 = ${q2.toStringAsFixed(3)} Kw",style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(height: 7,),
                                  Text("Wc = ${wc.toStringAsFixed(3)} Kw",style: TextStyle(fontWeight: FontWeight.bold)),
                                  SizedBox(height: 7,),
                                  Text("COP = ${cop.toStringAsFixed(3)}",style: TextStyle(fontWeight: FontWeight.bold)),
                                ],
                              ),
                              actions: <Widget>[
                                ElevatedButton(
                                  onPressed: () =>   Navigator.of(context).pop(true),  //exit(0),
                                  child: const Text("Ok"),
                                ),
                              ],
                            ));
                      }

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
        ),
      )
    );
  }
}
