import 'package:firedot/main.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

class TopUpPage extends StatefulWidget {
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();

  PermissionStatus _status;

  _permissionHandler() {
    PermissionHandler().checkPermissionStatus(PermissionGroup.sms).then(_updateStatus);
  }

  _updateStatus(PermissionStatus status) {
    if (status != _status) {
      setState(() {
        _status = status;
      });
    }
  }

  _askPermission() {
    PermissionHandler().requestPermissions([PermissionGroup.sms]).then(_onStatusRequested);
  }

  _onStatusRequested(Map<PermissionGroup, PermissionStatus> statuses) {
    final status = statuses[PermissionGroup.sms];
    if (status != PermissionStatus.granted) {
      PermissionHandler().openAppSettings();
    } else {
      _updateStatus(status);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
//    _permissionHandler();
//    _askPermission();
    super.initState();
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
                    child: Center(child: Text("TOP UP", style: TextStyle(fontSize: 25),)),
                  ),
                ),


                SizedBox(height: 50,),

                Container(
                  height: bodyHeight,
                  width: MediaQuery.of(context).size.width - 50,
                  child: Form(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[

                        TextFormField(
                          controller: _phoneNumberController,
                          decoration: InputDecoration(
                            helperText: "Input phone number",
                            prefixIcon: Icon(Icons.phone),
                            hintText: "Your phone number"
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "Please input number";
                            }
                            return null;
                          },
                        ),

                        TextFormField(
                          controller: _pinCodeController,
                          decoration: InputDecoration(
                            helperText: "Input PinCode",
                            prefixIcon: Icon(Icons.vpn_key),
                            hintText: "Pin Code"
                          ),
                          validator: (value) {
                            if (value == "") {
                              return "Please input pincode";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 50,),

                        InkWell(
                          onTap: () {
                            _submitTopup(_phoneNumberController.text, _pinCodeController.text);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width - 50,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.orange
                            ),
                            child: Center(
                              child: Text("TOP UP", style: TextStyle(color: Colors.white, fontSize: 20),),
                            ),
                          ),
                        )


                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MyHomePage(currentIndex: 2)));
        },
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width + 50,
          color: Colors.orange,
          child: Center(
            child: ListTile(
              leading: Icon(Icons.arrow_back),
              title: Text("BACK"),
            ),
          ),
        ),
      ),
    );
  }

  _submitTopup(String phoneNumber, String pinCode) {
    print(phoneNumber + " " + pinCode);
  }
}
