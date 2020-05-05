import 'package:flutter/material.dart';

class TreeLines extends StatelessWidget {
  const TreeLines({
    @required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Container(
            height: 30,
            width: 2,
            color: Colors.black38,
          ),
          Container(
            width: screenWidth /2,
            height: 2,
            color: Colors.black38,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                height: 30,
                width: 2,
                color: Colors.black38,
              ),
              SizedBox(
                width: 50,
              ),
              Container(
                height: 30,
                width: 2,
                color: Colors.black38,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
