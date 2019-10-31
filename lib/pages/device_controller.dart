import 'package:flutter/material.dart';
import 'package:gps/gps.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:toast/toast.dart';

class DeviceControllerPage extends StatefulWidget {
  @override
  _DeviceControllerPageState createState() => _DeviceControllerPageState();
}

class _DeviceControllerPageState extends State<DeviceControllerPage> {

  TextEditingController _idController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  TextEditingController _phone1Controller = TextEditingController();
  TextEditingController _phone2Controller = TextEditingController();
  TextEditingController _cityController = TextEditingController();

  String lat = "";
  String long = "";

  _getLoc() async {
    var latlng = await Gps.currentGps();
    print(latlng.lat);
    print(latlng.lng);
    setState(() {
      lat = latlng.lat;
      long = latlng.lng;
    });
  }

  String result = "Device id here";

  Future _scanQR() async {
    try {
      String qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult;
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.CameraAccessDenied) {
        setState(() {
          Toast.show("Camera permission was denied", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        });
      } else {
        setState(() {
          Toast.show("Unknown Error $ex", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
        });
      }
    } on FormatException {
      setState(() {
        Toast.show("You pressed the back button before scanning anything", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      });
    } catch (ex) {
      setState(() {
        Toast.show("Unknown Error $ex", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
      });
    }
    _idController.text = result;
    print(result);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getLoc();
  }

  @override
  Widget build(BuildContext context) {

    var bodyHeight = MediaQuery.of(context).size.height - 201;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[

                Card(
                  elevation: 10,
                  child: Container(
                    height: 100,
                    child: Center(child: Text("Alarm Setting", style: TextStyle(fontSize: 25),)),
                  ),
                ),


                SizedBox(height: 20,),

                Container(
                  height: bodyHeight,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Form(

                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          // TODO: Device Info

                          InkWell(
                            onTap: () {
                              _scanQR();
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width / 2,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.orange
                              ),
                              child: Center(
                                child: Text("SCAN", style: TextStyle(color: Colors.white, fontSize: 20),),
                              ),
                            ),
                          ),

                          SizedBox(height: 20,),

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text("Device Information*", textAlign: TextAlign.left,),
                            ),
                          ),

                          TextFormField(
                            controller: _idController,
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: "$result",
                              helperText: "(Device ID : )",
                              prefixIcon: Icon(Icons.code),
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Please input number";
                              }
                              return null;
                            },
                          ),

                          TextFormField(
                            controller: _nameController,
                            decoration: InputDecoration(
                              prefixIcon: Icon(Icons.title),
                              helperText: "Device Name ",
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Please input pincode";
                              }
                              return null;
                            },
                          ),

                          TextFormField(
                            enabled: false,
                            decoration: InputDecoration(
                              hintText: "lat: $lat, long: $long",
                              prefixIcon: InkWell(
                                child: Icon(Icons.my_location),
                                onTap: () {
                                  print("HELLO");
                                },
                              ),
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Please input pincode";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 50,),

                          // TODO: USER INFO

                          Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              child: Text("User's information*", textAlign: TextAlign.left,),
                            ),
                          ),

                          TextFormField(
                            controller: _phone1Controller,
                            decoration: InputDecoration(
                              helperText: "Primary number",
                              prefixIcon: Icon(Icons.phone),
                              hintText: "(eg 011323270)"
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Please input number";
                              }
                              return null;
                            },
                          ),

                          TextFormField(
                            controller: _phone2Controller,
                            decoration: InputDecoration(
                              helperText: "Secondary number",
                              prefixIcon: Icon(Icons.phone),
                              hintText: "(eg 011323270)"
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Please input pincode";
                              }
                              return null;
                            },
                          ),

                          TextFormField(
                            controller: _cityController,
                            decoration: InputDecoration(
                              helperText: "Address",
                            ),
                            validator: (value) {
                              if (value == "") {
                                return "Please input address";
                              }
                              return null;
                            },
                          ),

                          SizedBox(height: 50,),

                          InkWell(
                            onTap: () {
//                            _submitTopup(_phoneNumberController.text, _pinCodeController.text);
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width - 50,
                              height: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.orange
                              ),
                              child: Center(
                                child: Text("SAVE", style: TextStyle(color: Colors.white, fontSize: 20),),
                              ),
                            ),
                          ),

                          SizedBox(height: 50,),

                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );

  }

}
