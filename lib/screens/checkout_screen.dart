import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double usingHeight = MediaQuery.of(context).size.height - statusBarHeight;

    return Scaffold(
      appBar: AppBar(
        title: Text("Checkout"),
      ),
      body: SafeArea(
          child: Container(
        child: Column(children: <Widget>[
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Text("Payment Details", textScaleFactor: 1.5),
                ],
              ),
              Divider(height: 4.0, color: Colors.black),
              new Padding(
                padding: EdgeInsets.only(top: 20),
              ),
              Row(
                children: <Widget>[Text("Name"), Text("Email")],
              ),
              new Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Row(
                children: <Widget>[Text("Street Name")],
              ),
              new Padding(
                padding: EdgeInsets.only(top: 10),
              ),
              Row(
                children: <Widget>[Text("City"), Text("State"), Text("zip")],
              ),
              new Padding(
                padding: EdgeInsets.only(top: 10),
              ),
            ],
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Padding(
                  padding: EdgeInsets.only(top: 10),
                ),
                Text("Name On Card"),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                              height: 100,
                              width: 250,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(4)),
                              )),
                        ),
                      ],
                    ),
                    Text("Card Number"),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: SizedBox(
                              height: 100,
                              width: 250,
                              child: TextField(
                                keyboardType: TextInputType.text,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.all(4)),
                              )),
                        ),
                      ],
                    ),
                  ],
                ),
                Text("Expiration Date"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    SizedBox(
                        height: 100,
                        width: 150,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(4)),
                        )),
                    SizedBox(
                        height: 100,
                        width: 150,
                        child: TextField(
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(4)),
                        )),
                  ],
                )
              ]),
        ]),
      )),
    );
  }
}
