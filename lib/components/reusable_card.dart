import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  ReuseableCard({@required this.colour, this.cardChild ,this.onPress});

  final Function onPress;
  final Color colour;
  final Widget cardChild;
  //  const ReuseableCard({
//    Key key,
//  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
//                  height: 200.0,
//                  width: 170.0,
      ),
    );
  }
}
