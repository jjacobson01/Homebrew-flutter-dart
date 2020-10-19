import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'recommend.dart';

class CupScreen extends StatefulWidget {
  final String saved;
  CupScreen(this.saved);
  @override
  _CupScreenState createState() => _CupScreenState();
}

class _CupScreenState extends State<CupScreen> {
  var controller = TextEditingController();
  bool _pressed = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios,
              color: Color(0xff4C748B),
            ),
            key: Key('backButton'),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        backgroundColor: Color(0xffF3F3F3),
        body: Container(
          padding: const EdgeInsets.all(20),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
              Widget>[
            Text(
              "How many cups would you like?",
              key: Key('cupScreen'),
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
              padding: const EdgeInsets.all(15),
              child: TextFormField(
                  key: Key('Cups'),
                  decoration: InputDecoration.collapsed(hintText: ""),
                  inputFormatters: [WhitelistingTextInputFormatter.digitsOnly],
                  keyboardType: TextInputType.number,
                  controller: controller,
                  onChanged: (value) {
                    if (value.isEmpty) {
                      setState(() {
                        _pressed = false;
                      });
                    }
                    var isDigitsOnly = int.tryParse(value);
                    if (isDigitsOnly > 0) {
                      setState(() {
                        _pressed = true;
                      });
                    }
                  }),
            )),
            Padding(
              padding: EdgeInsets.all(15),
            ),
            SizedBox(
              height: 46,
              width: 280,
              child: FlatButton(
                key: Key('Continue2'),
                color: Color(0xff4C748B),
                textColor: Color(0xffFFFFFF),
                disabledColor: Color(0xffE2E2E2),
                disabledTextColor: Color(0xff757474),
                splashColor: Color(0xffE2E2E2),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                onPressed: _pressed
                    ? () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Recommend(widget.saved,
                                value: controller.text)));
                      }
                    : null,
                child: Text(
                  "Continue",
                  style: TextStyle(fontSize: 14.0, fontFamily: "Montserrat"),
                ),
              ),
            ),
          ]),
        ));
  }
}
