import 'package:flutter/material.dart';
import 'package:chatapp/style.dart';

class Body extends StatefulWidget {

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map data = ModalRoute.of(context).settings.arguments;
    return Container(
      height: size.height,
      width: size.width,
      child: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: size.height - 80,
                width: size.width,
                color: midPinkColor,
              ),
              IconButton(
                  color: Colors.white,
                  icon: Icon(Icons.arrow_back),
                  onPressed: (){
                    Navigator.pop(context);
                  }),
              Positioned(
                top: size.height / 2 -20,
                child: Container(
                  height: size.height / 2,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(40.0),
                        topLeft: Radius.circular(40.0)
                    ),
                    color: Colors.white,
                  ),
                ),
              ),
              Positioned(
                top: size.height / 2 + 40,
                left: 25.0,
                child:Container(
                  // color: Colors.blue,
                  height: size.height/2 - 20,
                  width: size.width,
                  child:ListView(
                    children: <Widget>[
                      Text("NAME",style: TextStyle(fontSize:15.0,fontFamily: 'Exo', letterSpacing: 5.0, fontWeight: FontWeight.bold),),
                      SizedBox(height: 5.0,),
                      Text(data["name"],style: TextStyle(color:Colors.green,fontSize:20.0,fontFamily: 'Exo', letterSpacing: 3.0,  fontWeight: FontWeight.bold),),
                      SizedBox(height: 10.0,),
                      Text("QUANTITY",style: TextStyle(fontSize:15.0,fontFamily: 'Exo', letterSpacing: 3.0,  fontWeight: FontWeight.bold),),
                      Row(
                          children: <Widget>[
                            IconButton(
                              padding: EdgeInsets.only(right: 30),
                                focusColor: lightColor,
                                icon: Icon(Icons.remove_circle),
                                iconSize: 30.0,
                                onPressed: (){
                                  setState(() {
                                    qty > 1 ? qty--: null;
                                  });
                                }
                            ),
                            Text("$qty",style: TextStyle(color:Colors.green,fontSize:20.0,fontFamily: 'Exo', letterSpacing: 3.0,  fontWeight: FontWeight.bold),),
                            IconButton(
                                focusColor: lightColor,
                                padding: EdgeInsets.only(left: 30),
                                icon: Icon(Icons.add_circle),
                                iconSize: 30.0,
                                onPressed: (){
                                  setState(() {
                                    qty++;
                                  });
                                }
                            ),
                          ],
                        ),
                      SizedBox(height: 10.0,),
                      Text("TOTAL",style: TextStyle(fontSize:15.0,fontFamily: 'Exo', letterSpacing: 3.0,  fontWeight: FontWeight.bold),),
                      SizedBox(height: 5.0,),
                      Text("${(data["price"]*qty).toStringAsFixed(2)}",style: TextStyle(color:Colors.green,fontSize:20.0,fontFamily: 'Exo', letterSpacing: 3.0,  fontWeight: FontWeight.bold),),
                    ],
                  )
                )
              ),
              Positioned(
                left: size.width * 0.47,
                top: size.height * 0.17,
                child:Container(
                  height: size.height*0.45,
                  width: size.width * 0.5,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/home/${data["img"]}"),
                      fit: BoxFit.cover
                    ),
                  ),
                )
              ),
              Positioned(
                  left: size.width * 0.03,
                  top: size.height * 0.06,
                  child:Container(
                    height: size.height*0.45,
                    width: size.width * 0.6,
                    child: Text("${data["name"]}",style: TextStyle(color:Colors.white,fontSize:25.0,fontFamily: 'Exo', letterSpacing: 3.0,  fontWeight: FontWeight.bold),),
                  )
              )
            ],
          )
        ],
      ),
    );
  }
}
