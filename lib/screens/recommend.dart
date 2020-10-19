import 'package:flutter/material.dart';
import 'package:homebrew/screens/choose_device_screen.dart';
import 'package:homebrew/utils/coffee_tools.dart';

// ignore: must_be_immutable
class Recommend extends StatefulWidget {
  String value;
  String saved;
  Recommend(this.saved, {Key key, this.value}) : super(key: key);
  @override
  _RecommendState createState() => _RecommendState();
}

class _RecommendState extends State<Recommend> {
  @override
  Widget build(BuildContext context) {
    int cups = int.parse(widget.value);
    double totalWater = CoffeeTools.water(cups);
    double frenchCoffee = CoffeeTools.french(cups);
    double dripCoffee = CoffeeTools.drip(cups);
    double coffee;

    if (widget.saved == "g - course ground coffee") {
      coffee = frenchCoffee;
    } else if (widget.saved == "g - medium ground coffee") {
      coffee = dripCoffee;
    }
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff4C748B),
            ),
            key: Key('backButton1'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Color(0xffF3F3F3),
        body: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(90),
                  ),
                  LimitedBox(
                      child: Container(
                          padding: const EdgeInsets.all(20.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Color(0xff4C748B),
                              width: 3,
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Column(children: <Widget>[
                            Text("Recommended",
                                style: TextStyle(
                                  fontSize: 18,
                                  fontFamily: "Kollektif",
                                  color: Color(0xff4C748B),
                                )),
                            Divider(
                              thickness: 1,
                              color: Color(0xff4C748B),
                            ),
                            SizedBox(height: 20),
                            Text("${coffee.round()}${widget.saved}",
                                key: Key('Coffee'),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Kollektif",
                                  color: Color(0xff4C748B),
                                )),
                            Text("${totalWater.round()}g - water",
                                key: Key('Water'),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "Kollektif",
                                  color: Color(0xff4C748B),
                                )),
                            SizedBox(height: 45),
                            Text(" Enjoy your delicious coffee.",
                                style: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  fontSize: 10,
                                  fontFamily: "Montserrat",
                                  color: Color(0xff4C748B),
                                )),
                          ]))),
                  Expanded(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: <Widget>[
                        SizedBox(
                            height: 46,
                            width: 280,
                            child: FlatButton(
                                key: Key('Done'),
                                child: Text("Done",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontFamily: "Montserrat",
                                    )),
                                textColor: Color(0xffFFFFFF),
                                color: Color(0xff4C748B),
                                shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15))),
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ChooseDeviceScreen()));
                                })),
                      ]))
                ])));
  }
}
