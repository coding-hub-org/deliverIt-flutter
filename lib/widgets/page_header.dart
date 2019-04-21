import 'package:flutter/material.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({Key key, @required this.header})
      : assert(header != null),
        super(key: key);

  final String header;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      header,
      style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
    ));
  }
}
