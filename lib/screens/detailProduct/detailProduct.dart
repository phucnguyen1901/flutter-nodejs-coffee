
import 'package:flutter/material.dart';

import 'body.dart';
import 'bottom.dart';


class DetailProDuct extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(icon:Icon(Icons.arrow_back),
        onPressed: (){
          Navigator.pop(context);
        },
        ),
      ),
      body:Body(),
      bottomNavigationBar: Bottom()
    );
  }
}
