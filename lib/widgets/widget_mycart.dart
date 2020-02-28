import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:store_app/model/cart.dart';
import 'package:store_app/widgets/widget_quantity.dart';

class MyCart extends StatefulWidget {
  @override
  _MyCartState createState() => _MyCartState();
}

class _MyCartState extends State<MyCart> {
  List<Cart> listMyCart = [];

  @override
  void initState() {
    listMyCart
      ..add(Cart(
          productName: 'Columbia Women\'s PG',
          price: 290,
          size: 'L',
          quantity: 2,
          color: 'Blue',
          image:
              'https://www.modalia.es/images/stories/2015/marzo/vestidos-verino-3.jpg'))
      ..add(Cart(
          productName: 'DUNEA Women\'s Maxi Dress',
          price: 190,
          quantity: 1,
          color: 'Red',
          size: 'M',
          image:
              'https://www.modalia.es/images/stories/2015/marzo/vestidos-verino-2.jpg'));
    super.initState();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BackdropFilter(
      filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
      child: Container(
        height: size.height / 2,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(48), topRight: Radius.circular(48))),
        child: Padding(
          padding: EdgeInsets.only(left: 24, top: 40, right: 24, bottom: 20),
          child: Column(
            children: <Widget>[
              _headerMyCart(context),
              Padding(
                padding: EdgeInsets.only(top: 12),
                child: Divider(
                  height: 2,
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: ListView.separated(
                  itemCount: listMyCart.length,
                  itemBuilder: (context, index) {
                    Cart cart = listMyCart[index];
                    String dolarPrice =
                        NumberFormat('#,##0', 'en_US').format(cart.price);
                    return Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Image.network(
                            cart.image,
                            width: 48,
                            height: 48,
                          ),
                          SizedBox(width: 8),
                          Expanded(
                              child: Wrap(
                            direction: Axis.vertical,
                            children: <Widget>[
                              Text(
                                cart.productName,
                                style: Theme.of(context).textTheme.body1.merge(
                                    TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Text(
                                '\$ $dolarPrice',
                                style: Theme.of(context)
                                    .textTheme
                                    .body1
                                    .merge(TextStyle(fontSize: 12)),
                              ),
                              Text(
                                'Size: ${cart.size}',
                                style: Theme.of(context).textTheme.body1.merge(
                                    TextStyle(
                                        fontSize: 12, color: Colors.grey)),
                              )
                            ],
                          )),
                          ConreollerQuantity(quantity: cart.quantity,)
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 2,
                      color: Colors.grey,
                    );
                  },
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: 4),
                child: Divider(
                  thickness: 2,
                  color: Colors.black,
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total amount',style: Theme.of(context).textTheme.body1.merge(TextStyle(color: Colors.grey)),),
                  Text('\$ 480.00',style: Theme.of(context).textTheme.body1.merge(TextStyle(fontWeight: FontWeight.w600)),)
                ],
              ),SizedBox(
                height: 8,
              ),
              SizedBox(
                width: size.width,
                child: RaisedButton(onPressed: (){},
                  child: Text('Check out',style: TextStyle(color: Colors.white),),
                  padding: EdgeInsets.symmetric(vertical: 12),
                  color: Color(0xff32312d),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget _headerMyCart(context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: <Widget>[
      Text(
        'My Cart',
        style: Theme.of(context)
            .textTheme
            .body1
            .merge(TextStyle(fontWeight: FontWeight.w600, fontSize: 16)),
      ),
      Text('2 items', style: Theme.of(context).textTheme.caption)
    ],
  );
}
