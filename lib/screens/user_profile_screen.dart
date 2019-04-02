import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class UserProfileScreen extends StatelessWidget {
  UserProfileScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var assetsImage = new AssetImage('assets/images/image1.png');
    // var image = new AssetImage(image: assetsImage, width: 48.0, height: 48.0);

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
              child: Column(
            children: <Widget>[
              ImageView(),
              MyButton(
                name: "CHANGE PHOTO",
              ),
              StyledText1(name: "Gaurav Jayasawal"),
              StatsSection("125", "150", "15"),
              StyledSubtitle(
                name: "Account Details",
              ),
              AccountDetails("jgaurav6@gmail.com", "518-223-4644"),
              HorizontalDivider(),
              StyledSubtitle(
                name: "Addresses",
              ),
              Align(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 10.0),
                  child: MyButton(name: "+ ADD ADDRESS"),
                ),
                alignment: Alignment.bottomLeft,
              ),
              HorizontalDivider(),
              StyledSubtitle(
                name: "Payments",
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30.0, 0.0, 0.0, 10.0),
                  child: MyButton(
                    name: "+ ADD PAYMENT CARD",
                  ),
                ),
              ),
              HorizontalDivider(),
              StyledSubtitle(
                name: "Change Password",
              ),
              StyledInputField("New Password"),
              StyledInputField("Confirm Password"),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0.0, 0.0, 30.0, 0.0),
                  child: MyButton(name: "CHANGE PASSWORD"),
                ),
              )
            ],
          )),
        ),
      ),
    );
  }
}

// My Custom Widgets

class AccountDetails extends StatelessWidget {
  final email;
  final phone;

  AccountDetails(this.email, this.phone);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Padding(
                child: Text(
                  "Email",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                padding: EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 0.0),
              ),
              Text(
                email,
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    ),
              )
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(30.0, 10.0, 20.0, 10.0),
                child: Text(
                  "Phone",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Text(
                phone,
                style: TextStyle(
                    // fontWeight: FontWeight.bold,
                    ),
              )
            ],
          )
        ],
      ),
    );
  }
}

class ImageView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(
        child: Image.asset(
          'assets/image1.png',
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {
  final String name;
  MyButton({String name}) : this.name = name;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.0),
        child: RaisedButton(
          child: Padding(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
              child: new Text(
                name,
                style: new TextStyle(
                  fontSize: 10.0,
                  fontWeight: FontWeight.w100,
                ),
              )),
          shape: new RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(8.0)),
          textColor: Colors.white,
          onPressed: () {
            debugPrint("TEST");
          },
        ));
  }
}

class StyledText1 extends StatelessWidget {
  final String name;
  StyledText1({String name}) : this.name = name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 0, 0, 10.0),
      child: Text(
        name,
        style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class StyledSubtitle extends StatelessWidget {
  final String name;
  StyledSubtitle({String name}) : this.name = name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        name,
        style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF9A9A9A)),
      ),
    );
  }
}

class VerticalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      height: 30.0,
      width: 1.0,
      color: Color(0xFFE2E2E2),
      margin: const EdgeInsets.only(left: 10.0, right: 10.0),
    );
  }
}

class HorizontalDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 10.0),
      child: new Container(
          height: 1.0,
          color: Color(0xFFE2E2E2),
          margin: const EdgeInsets.only(left: 30.0, right: 30.0)),
    );
  }
}

class StatsSection extends StatelessWidget {
  final delivery;
  final likes;
  final reviews;

  StatsSection(this.delivery, this.likes, this.reviews);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  delivery,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Delivery",
                  style: TextStyle(color: Color(0xFF9A9A9A)),
                ),
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  likes,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Likes",
                  style: TextStyle(color: Color(0xFF9A9A9A)),
                ),
              ],
            ),
          ),
          VerticalDivider(),
          Expanded(
            child: Column(
              children: <Widget>[
                Text(
                  reviews,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  "Reviews",
                  style: TextStyle(color: Color(0xFF9A9A9A)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StyledInputField extends StatelessWidget {
  final name;
  StyledInputField(this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.0),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 0.0, 30.0, 0.0),
        child: TextFormField(
          decoration: InputDecoration(
              hintStyle: TextStyle(color: Color(0xFF9A9A9A)),
              fillColor: Colors.black,
              hintText: name,
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFFE2E2E2)),
                  borderRadius: BorderRadius.all(Radius.circular(0))),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(0)))),
        ),
      ),
    );
  }
}
