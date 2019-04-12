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
    var taxes = 1.8;
    var deliverFee = 7.5;

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
      },
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
      },
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

    return Scaffold(
        appBar: AppBar(
          title: Text("Your Order"),
          actions: <Widget>[buildButton()],
        ),
        body: SafeArea(
          child: Container(
              child: Column(
            children: <Widget>[
              // buildHeader(),
              Expanded(
                child: CartDetails(
                    itemList: itemList,
                    totalPrice: totalPrice,
                    taxes: taxes,
                    deliverFee: deliverFee),
              ),
            ],
          )),
        ));
  }

  Widget buildButton() {
    return new FlatButton(
        onPressed: () {},
        padding: const EdgeInsets.only(left: 8.0),
        textColor: Colors.white,
        color: Colors.blue,
        child: new Text(
          "Checkout",
        ));
  }

  Container buildHeader() {
    return Container(
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
    );
  }
}

class CartDetails extends StatelessWidget {
  const CartDetails({
    Key key,
    @required this.itemList,
    @required this.totalPrice,
    @required this.taxes,
    @required this.deliverFee,
  }) : super(key: key);

  final List<Widget> itemList;
  final double totalPrice;
  final double taxes;
  final double deliverFee;

  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Column(
        // shrinkWrap: true,
        // padding: const EdgeInsets.all(20.0),
        children: itemList,
      ),
      Column(
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                "SUBTOTAL",
              ),
              Padding(
                padding: const EdgeInsets.only(left: 75.0, right: 10),
                child: Text("\$" + (totalPrice.toStringAsFixed(2))),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("TAXES"),
              Padding(
                padding: const EdgeInsets.only(left: 75.0, right: 10),
                child: Text("\$" + taxes.toStringAsFixed(2)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("DELIVERY FEE"),
              Padding(
                padding: const EdgeInsets.only(left: 75.0, right: 10),
                child: Text("\$" + deliverFee.toStringAsFixed(2)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text("TOTAL"),
              Padding(
                padding: const EdgeInsets.only(left: 75.0, right: 10),
                child: Text("\$" +
                    (deliverFee + taxes + totalPrice).toStringAsFixed(2)),
              ),
            ],
          ),
        ],
      ),
    ]);
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
                      keyboardType: TextInputType.number,
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
