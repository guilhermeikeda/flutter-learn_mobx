import 'package:flutter/material.dart';

class DiceSumComponent extends StatelessWidget {
  final int total;

  DiceSumComponent({@required this.total});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Total $total',
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.black87,
        fontSize: 16,
        fontFamily: 'Verdana',
      ),
    );
  }
}
