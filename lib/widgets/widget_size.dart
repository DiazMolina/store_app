import 'package:flutter/material.dart';

class ProductSize extends StatefulWidget {
  @override
  _ProductSizeState createState() => _ProductSizeState();
}

class _ProductSizeState extends State<ProductSize> {
  final List<String> listSize = ['XL', 'L', 'M', 'S'];
  int _indexSelected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _indexSelected = listSize.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RichText(
            text: TextSpan(children: [
          TextSpan(text: 'Size: ', style: TextStyle(color: Colors.black87)),
          TextSpan(
              text: listSize[_indexSelected],
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.w600))
        ])),
        Expanded(
            child: SizedBox(
          height: 24,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: NeverScrollableScrollPhysics(),
            reverse: true,
            itemCount: listSize.length,
            itemBuilder: (context, index) {
              return Row(
                children: <Widget>[
                  Text(listSize[index]),
                  Radio(
                    value: index,
                    groupValue: _indexSelected,
                    onChanged: (index) {
                      setState(() {
                        _indexSelected = index;
                      });
                    },
                    activeColor: Color(0xff32332d),
                  )
                ],
              );
            },
          ),
        ))
      ],
    );
  }
}
