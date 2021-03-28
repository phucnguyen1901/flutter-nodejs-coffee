import 'package:chatapp/repository/HistoryRes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OrderHistory extends StatefulWidget {
  @override
  _OrderHistoryState createState() => _OrderHistoryState();
}

class _OrderHistoryState extends State<OrderHistory> {
  String id;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SharedPreferences.getInstance().then((value) => {
      setState((){
        id = value.getString("id");
      })
    });
  }



  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Order History"),
          centerTitle: true,
        ),
        body:Container(
            height: size.height,
            width: size.width,
            child:FutureBuilder<List>(
              future: id !=null ?HistoryRes.orderHistory(id): null,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: Text('Loading...'));
                } else {
                  if (snapshot.data == null)
                    return Center(child: Text('Empty Cart...'));
                  else
                    return OrderList(snapshot.data);
                }
              },
            )
        )
    );
  }

  ListView OrderList(List orderList) {
    return ListView.builder(
        itemCount: orderList.length,
        itemBuilder: (context,index){
          return ItemOrderHistory(
            total: orderList[index]["items"]["totalPrice"].toString(),
            id:  orderList[index]["_id"],
            address: orderList[index]["address"],
            phone: orderList[index]["phone"].toString(),
            qty: orderList[index]["items"]["totalQty"].toString(),
            status: orderList[index]["status"],
            itemList: orderList[index]["items"]["items"],

          );
        }
    );
  }
}

class ItemOrderHistory extends StatelessWidget {
  final String id,phone,address,qty,total,status;
  final Map itemList;
  const ItemOrderHistory({
    this.id,
    this.phone,
    this.address,
    this.qty,
    this.total,
    this.status,
    this.itemList,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0,horizontal: 10.0),
        padding: EdgeInsets.symmetric(vertical: 10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Theme.of(context).primaryColor
      ),
        child:FlatButton(
          onPressed: (){
            Navigator.pushNamed(context, '/detailOrder', arguments: itemList);
          },
          child: Column(
            children: [
              Text("ID Order: $id"),
              Text("Phone: $phone"),
              Text("Adress: $address"),
              Text("Status: $status"),
              Text("Qty: $qty"),
              Text("Total: \$${double.parse(total).toStringAsFixed(2)}"),
            ],
          ),
        )
    );
  }
}
