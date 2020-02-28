import 'package:flutter/material.dart';
class ConreollerQuantity extends StatefulWidget {
  final int quantity;

  const ConreollerQuantity({Key key, this.quantity}) : super(key: key);
  @override
  _ConreollerQuantityState createState() => _ConreollerQuantityState();
}

class _ConreollerQuantityState extends State<ConreollerQuantity> {
  int quantity =0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    quantity =widget.quantity;
  }
  @override

  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        GestureDetector(
          onTap: (){
            if(quantity==1) return;
            setState(() {
              quantity-=1;
            });
          },
          child: Padding(padding: EdgeInsets.all(12),
            child: Icon(Icons.remove,size: 20,color: Colors.black54,
            ),
          ),
        ),
        Text('$quantity'),
        GestureDetector(
          onTap: (){
            if(quantity==10) return;
            setState(() {
              quantity+=1;
            });
          },
          child: Padding(padding: EdgeInsets.all(12),
            child: Icon(Icons.add,size: 20,color: Colors.black54,
            ),
          ),
        )
      ],
    );
  }
}
