import 'package:decimal/decimal.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double statusBarHeight = MediaQuery.of(context).padding.top;
    double usingHeight = MediaQuery.of(context).size.height - statusBarHeight;

    double margin = 20;

    var itemCount = 4;

    var itemName = "Taco Item";
    var photoLink = "";
    var numItemsController = TextEditingController();
    var itemPrice = 10.20;
    var totalPrice = 0.0;
    var taxes = 0;
    var deliverFee = 0.0;

    var itemData = [
      {
        "itemName": "taco",
        "itemPrice": 10.20,
        "numItemsController": TextEditingController(),
        "photoLink":
            "https://media.wired.com/photos/592713647034dc5f91bed905/master/w_582,c_limit/STORY-GettyImages-498648767a.jpg",
      },
      {
        "itemName": "taco",
        "itemPrice": 10.20,
        "numItemsController": TextEditingController(),
        "photoLink":
            "https://media.wired.com/photos/592713647034dc5f91bed905/master/w_582,c_limit/STORY-GettyImages-498648767a.jpg",
      }
    ];

    List<Widget> itemList = List.generate(itemData.length, (index) {
      return CartItem(
        itemName: itemData[index]["itemName"],
        itemPrice: itemData[index]["itemPrice"],
        numItemsController: itemData[index]["numItemsController"],
        photoLink: itemData[index]["photoLink"],
      );
    });

    itemData.forEach((item) {
      totalPrice += item["itemPrice"];
    });

    // List<Widget> itemList = [
    //   CartItem(
    //     itemName: "taco",
    //     itemPrice: 10.20,
    //     numItemsController: TextEditingController(),
    //     photoLink:
    //         "https://media.wired.com/photos/592713647034dc5f91bed905/master/w_582,c_limit/STORY-GettyImages-498648767a.jpg",
    //   ),
    //   CartItem(
    //     itemName: "taco",
    //     itemPrice: 10.20,
    //     numItemsController: TextEditingController(),
    //     photoLink:
    //         "https://media.wired.com/photos/592713647034dc5f91bed905/master/w_582,c_limit/STORY-GettyImages-498648767a.jpg",
    //   ),
    //   CartItem(
    //     itemName: "taco",
    //     itemPrice: 10.20,
    //     numItemsController: TextEditingController(),
    //     photoLink:
    //         "https://media.wired.com/photos/592713647034dc5f91bed905/master/w_582,c_limit/STORY-GettyImages-498648767a.jpg",
    //   ),
    //   CartItem(
    //     itemName: "taco",
    //     itemPrice: 10.20,
    //     numItemsController: TextEditingController(),
    //     photoLink:
    //         "https://media.wired.com/photos/592713647034dc5f91bed905/master/w_582,c_limit/STORY-GettyImages-498648767a.jpg",
    //   )
    // ];

    return Scaffold(
        body: SafeArea(
      child: Container(
          child: Column(
        children: <Widget>[
          Container(
            margin: const EdgeInsets.only(
              top: 15,
              left: 20,
            ),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Your Order",
                textScaleFactor: 2,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Column(children: <Widget>[
            ListView(
              shrinkWrap: true,
              padding: const EdgeInsets.all(20.0),
              children: itemList,
            )
          ]),
          Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    totalPrice.toString(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0, right: 10),
                    child: Text("US AMOUNT"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("TAXES"),
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0, right: 10),
                    child: Text("US AMOUNT"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("DELIVERY FEE"),
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0, right: 10),
                    child: Text("US AMOUNT"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text("TOTAL"),
                  Padding(
                    padding: const EdgeInsets.only(left: 75.0, right: 10),
                    child: Text("US AMOUNT"),
                  ),
                ],
              ),
              Row(
                children: <Widget>[
                  Container(
                    margin: const EdgeInsets.only(left: 70.0, top: 50),
                    child: new RaisedButton(
                        padding: const EdgeInsets.only(left: 8.0),
                        textColor: Colors.black,
                        color: Colors.blue,
                        child: new Text("Back")),
                  ),
                  Container(
                      margin: const EdgeInsets.only(left: 70.0, top: 50),
                      child: new RaisedButton(
                          padding: const EdgeInsets.only(left: 8.0),
                          textColor: Colors.white,
                          color: Colors.blue,
                          child: new Text("Checkout")))
                ],
              ),
            ],
          ),
          // ],
          // ),
        ],
      )),
    ));
  }
}

class CartItem extends StatelessWidget {
  const CartItem({
    Key key,
    @required this.photoLink,
    @required this.itemName,
    @required this.numItemsController,
    @required this.itemPrice,
  }) : super(key: key);

  final String photoLink;
  final String itemName;
  final TextEditingController numItemsController;
  final double itemPrice;

  @override
  Widget build(BuildContext context) {
    numItemsController.text = "1";
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Image.network(
            photoLink,
            width: 70,
            height: 70,
          ),
        ),
        Expanded(flex: 1, child: Center(child: Text(itemName))),
        Expanded(
            flex: 1,
            child: Center(
                child: SizedBox(
                    height: 50,
                    width: 50,
                    child: TextField(
                      controller: numItemsController,
                    )))),
        Expanded(
            flex: 1,
            child: Center(
                child: Text(((itemPrice) * int.parse(numItemsController.text))
                    .toStringAsFixed(2))))
      ],
    );
  }
}
