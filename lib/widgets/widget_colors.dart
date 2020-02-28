import 'package:flutter/material.dart';

class ColorsSelect extends StatefulWidget {
  @override
  _ColorsSelectState createState() => _ColorsSelectState();
}

class _ColorsSelectState extends State<ColorsSelect> {
  final List<String> colorName = [
    'Navy',
    'Milo',
    'Maroon',
    'Grey',
  ];
  final List<Color> ListColors = [
    Color(0xff000080),
    Color(0xffd7ba97),
    Color(0xff9c606c),
    Color(0xffabbcbd)
  ];
  int _indexSelected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _indexSelected = ListColors.length - 1;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        RichText(
            text: TextSpan(children: [
          TextSpan(
            text: 'Color: ',
            style:
                TextStyle( color: Colors.black87),
          ),
          TextSpan(
              text: colorName[_indexSelected],
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
              itemCount: ListColors.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: GestureDetector(
                    onTap: () => setState(() {
                      _indexSelected = index;
                    }),
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                          color: ListColors[index],
                          shape: BoxShape.circle,
                          border: Border.all(
                              color: Colors.white,
                              width: _indexSelected == index ? 4 : 0),
                          boxShadow: [
                            _indexSelected == index
                                ? BoxShadow(
                                    color: Color(0xff757575),
                                    blurRadius: 5,
                                    offset: Offset(0, 4))
                                : BoxShadow()
                          ]),
                    ),
                  ),
                );
              }),
        ))
      ],
    );
  }
}
