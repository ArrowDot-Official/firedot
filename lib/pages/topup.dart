import 'package:firedot/main.dart';
import 'package:flutter/material.dart';

class TopUpPage extends StatefulWidget {
  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {

  TextEditingController _phoneNumberController = TextEditingController();
  TextEditingController _pinCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    var bodyHeight = MediaQuery.of(context).size.height - 201;
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Column(
            children: <Widget>[
              Card(
                elevation: 10,
                child: Container(
                  height: 100,
                  child: Center(child: Text("TOP UP", style: TextStyle(fontSize: 25),)),
                ),
              ),

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
                          helperText: "Input phone number"
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
                            helperText: "Input PinCode"
                        ),
                        validator: (value) {
                          if (value == "") {
                            return "Please input pincode";
                          }
                          return null;
                        },
                      ),

                      SizedBox(height: 50,),

                      FlatButton(
                        onPressed: () {
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
      bottomNavigationBar: FlatButton(
        onPressed: () {
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

  }
}
