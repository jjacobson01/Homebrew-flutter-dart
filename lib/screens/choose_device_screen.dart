import 'package:flutter/material.dart';
import 'cups.dart';

class ChooseDeviceScreen extends StatefulWidget {
  @override
  _ChooseDeviceScreenState createState() => _ChooseDeviceScreenState();
}

class _ChooseDeviceScreenState extends State<ChooseDeviceScreen> {
  bool french = false;
  bool drip = false;
  String saved;
  @override
  Widget build(BuildContext context) {
    var pressed;
    if (french || drip) {
      {
        pressed = () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => CupScreen(saved)));
        };
      }
    }
    return Scaffold(
      backgroundColor: Color(0xffF3F3F3),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "What coffee maker are you using?",
              key: Key('deviceScreen'),
              style: TextStyle(
                  fontSize: 18,
                  fontFamily: "Montserrat",
                  color: Color(0xff4C748B)),
            ),
            LimitedBox(
              child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff4C748B),
                      width: 2,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Column(children: <Widget>[
                    CheckboxListTile(
                      value: french,
                      onChanged: (value) {
                        setState(() {
                          if (french == true) {
                            french = false;

                            saved = "g - medium ground coffee";
                          } else {
                            french = true;
                            drip = false;
                            saved = "g - course ground coffee";
                          }
                        });
                      },
                      key: Key('French'),
                      title: Text("French Press",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Roboto",
                              color: Color(0xff4C748B))),
                    ),
                    Divider(
                      color: Color(0xff4C748B),
                      thickness: 1,
                    ),
                    CheckboxListTile(
                      value: drip,
                      onChanged: (value) {
                        setState(() {
                          if (drip == true) {
                            drip = false;
                            saved = "g - course ground coffee";
                          } else {
                            drip = true;
                            french = false;
                            saved = "g - medium ground coffee";
                          }
                        });
                      },
                      key: Key('Drip'),
                      title: Text("Drip Machine",
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: "Montserrat",
                              color: Color(0xff4C748B))),
                    ),
                  ])),
            ),
            Padding(
              padding: EdgeInsets.all(10),
            ),
            SizedBox(
              height: 46,
              width: 280,
              child: FlatButton(
                key: Key('Continue'),
                color: Color(0xff4C748B),
                textColor: Color(0xffFFFFFF),
                disabledColor: Color(0xffE2E2E2),
                disabledTextColor: Color(0xff757474),
                splashColor: Color(0xffE2E2E2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: pressed,
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 14.0, fontFamily: "Montserrat"),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
/*InkWell(
                onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Color(0xff4C748B),
                    width: 2,
                  ),
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                
                child: Column(
                    
                    children: <Widget>[
                      Row(
                        
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Text("French Press",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                  ))),
                                  IconButton(icon: Icon(Icons.check), onPressed: () {}),
                                  
                        ],
                        
                      ),
                      
                      Divider(
                        thickness: 1,
                        color: Color(0xff4C748B),

                      ),
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                              child: Text("Drip Machine",
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: "Montserrat",
                                    color: Color(0xff4C748B),
                                  ))),
                                  IconButton(icon: Icon(Icons.check), onPressed: () {}),
                        ],
                        
                      ),
                     

                    ]),
              ),
             
            ),*/
