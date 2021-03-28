import 'package:chatapp/components/dialog.dart';
import 'package:chatapp/components/full_text_field.dart';
import 'package:chatapp/repository/OrderRes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  String user , id;
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _noteController = TextEditingController();



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) => {
      setState((){
        user = value.getString("user");
        id = value.getString("id");
      })
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final Map items = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        resizeToAvoidBottomPadding:false,
        appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Text("Confirm Order",style:TextStyle(color:Colors.white)),
        centerTitle: true,
      ),
      body:Container(
        height: size.height,
        width: size.width,
        child: Column(
          children: <Widget>[
            SizedBox(height:20.0),
            Container(
              width: size.width * 0.8,
              height: size.height*0.07,
              // margin: EdgeInsets.fromLTRB(0.0,0.0,0.0,10.0),
              padding: EdgeInsets.symmetric(vertical: 10.0,horizontal: 15.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor,
                  borderRadius: BorderRadius.circular(30.0)
              ),
              child: Center(child: Text(user,style:TextStyle(fontSize: 15.0))),
            ),
            SizedBox(height:20.0),
            FullTextField(hintText: 'Phone',icon: Icons.phone, iconColor: Colors.white,
              controller: _phoneController,
            ),
            SizedBox(height:20.0),
            FullTextField(hintText: 'Address',icon: Icons.location_on_rounded, iconColor: Colors.white, maxLine: 6,
              controller: _addressController,
            ),
            SizedBox(height:20.0),
            FullTextField(hintText: 'Note',icon: Icons.assignment, iconColor: Colors.white, maxLine: 6,
              controller: _noteController,
            )
            ],
        )
      ),
      bottomNavigationBar: RaisedButton(
        padding: EdgeInsets.all(0.0),
        color: Colors.white,
        onPressed: (){
          id != null ?
          OrderRes.postOrder(
              {
                  "customerId":id,
                  "itemCart": items,
                  "phone" : _phoneController.text,
                  "address" : _addressController.text,
                  "note" : _noteController.text,
              }
          ).then((value) =>  {
              Future.delayed(Duration(seconds: 3), () {
              Navigator.pushNamed(context,"/home");
              }),
            showDialog(
                context: context,
                child: AuthenticationDialog(
                  textAction: "Back to home after 3 seconds",
                  actionTextColor: Colors.green,
                  titleText: "Order Successfully",
                  titleTextColor: Colors.green,
                  pathImage: "assets/login/image_dialog_success.png",
                  fnc: (){
                      Navigator.pushNamed(context,"/home");
                  },
                )
            )
          }):
          showDialog(
              context: context,
              child: AuthenticationDialog(
                textAction: "Wait a minute",
                actionTextColor: Colors.green,
                titleText: "Wait a second and try again",
                titleTextColor: Colors.green,
                pathImage: "assets/login/image_dialog.png",
              )
          );

        },
        child: Container(
            height: size.height*0.08,
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(40.0))
              // borderRadius: BorderRadius.circular(10.0)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Confirm Order",style: TextStyle(color: Colors.white),),
                SizedBox(width: 10.0,),
                Icon(Icons.assignment_turned_in_outlined,color: Colors.white),
              ],
            )
        ),
      ),
    );
  }

}
