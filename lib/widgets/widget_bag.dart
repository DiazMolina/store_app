import 'package:flutter/material.dart';
import 'package:store_app/widgets/widget_mycart.dart';

class AddBag extends StatefulWidget {
  @override
  _AddBagState createState() => _AddBagState();
}

class _AddBagState extends State<AddBag> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height - size.height / 1.1,
      child: GestureDetector(
        onTap: (){FocusScope.of(context).requestFocus(FocusNode());},
        child: Material(
          type: MaterialType.canvas,
          color: Color(0xff32312d),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(36), topRight: Radius.circular(36)),
          child: InkWell(
            onTap: () {
              showBottomSheet(
                  context: context,
                  builder: (context) {
                    return MyCart();
                  },
                  backgroundColor: Colors.transparent);
            },
            child: Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Text(
                      'Add to bag +',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
