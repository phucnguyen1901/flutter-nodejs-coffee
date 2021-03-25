
import 'package:flutter/material.dart';
import 'body.dart';
import 'bottom.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Body(),
        bottomNavigationBar: Bottom()
    );
  }
}
