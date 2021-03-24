
import 'package:flutter/material.dart';
class ElementMenu extends StatelessWidget {
  final String pathImage;
  final String text;
  const ElementMenu({
    Key key,
    this.pathImage,
    this.text,
    @required this.size,
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top:30.0),
          width: size.width * 0.13,
          height: size.height * 0.15,
          decoration: BoxDecoration(
            // color: Colors.blue,
              image: DecorationImage(
                  image: AssetImage(pathImage),
                  fit: BoxFit.cover
              )
          ),
        ),
        Container(
          child: Text(text),
        ),
      ],
    );
  }
}

