import 'package:flutter/material.dart';

class PageViewCard extends StatefulWidget {
  @override
  _PageViewCardState createState() => _PageViewCardState();
}

class _PageViewCardState extends State<PageViewCard> {
  int _index =0;
  final listImage = [
    'https://sgfm.elcorteingles.es/SGFM/dctm/MARKET/354/291/314/354291314980500_WWW_516x640.jpg',
    'https://www.modalia.es/images/stories/2015/marzo/vestidos-verino-5.jpg',
    'https://sgfm.elcorteingles.es/SGFM/dctm/MEDIA03/201908/06/00129434503214____5__516x640.jpg',
    'https://www.modalia.es/images/stories/2015/marzo/vestidos-verino-4.jpg'
  ];
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height / 1.6,
      child: Stack(
        children: <Widget>[
          PageView.builder(itemBuilder: (context, index) {
            return Image.network(
              listImage[index],
              fit: BoxFit.cover,
            );
          },itemCount: listImage.length,
            onPageChanged: (index){
            setState(() {
              _index= index;
            });
            },
          ),
          Padding(padding: EdgeInsets.only(top: size.height/1.9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                for (int i =0;i<listImage.length;i++)
                  if(i == _index) circleBar(true) else circleBar(false)

              ],
            ),
          )
        ],
      ),
    );
  }
}
Widget circleBar(bool isActive){
  return AnimatedContainer(duration: Duration(milliseconds: 200),
    margin: EdgeInsets.symmetric(horizontal: 8),
    height:  isActive?16:12,
    width:  isActive?16:12,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(12)),
          border: isActive?Border.all(color: Colors.pink):null
    ),
    padding: EdgeInsets.all(isActive?4:0),
    child: Container(
      width: isActive?8:16,
      height: isActive?8:16,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(12)),
            color: Colors.white
      ),
    ),
  );
}