import 'package:flutter/material.dart';
import 'package:store_app/widgets/widget_bag.dart';
import 'package:store_app/widgets/widget_colors.dart';
import 'package:store_app/widgets/widget_size.dart';

class DescriptionItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      width: double.infinity,
      height: size.height / 2.3,
      decoration: BoxDecoration(
          color: Color(0xffe0e0e0),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(48), topLeft: Radius.circular(48))),
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 24.0, top: 40, right: 24),
            child: LayoutBuilder(
              builder: (context, constraints) {
                return ListView(
                  padding: EdgeInsets.only(bottom: size.height / 1.1 + 16),
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        _widgetProductName(context),
                        _widgetProductPrice(context),
                        Padding(
                          padding: EdgeInsets.only(top: 16, bottom: 16),
                          child: Divider(
                            height: 2.0,
                            color: Colors.black,
                          ),
                        ),
                        ColorsSelect(),
                        SizedBox(height: 5,),
                        ProductSize(),
                        _widgetProductInfo(context),
                        SizedBox(height: 16),

                      ],
                    )
                  ],
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: AddBag(),
          )
        ],
      ),
    );
  }
}

Widget _widgetProductName(BuildContext context) {
  return Wrap(
    children: <Widget>[
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
              child: Text(
            'Sleeve Bodycon Midi Dress Crew Neck Fitted Dresses',
            style: Theme.of(context).textTheme.title,
          )),
          Wrap(
            direction: Axis.vertical,
            children: <Widget>[
              Icon(Icons.share),
              SizedBox(height: 12),
              Icon(Icons.favorite_border)
            ],
          )
        ],
      ),
    ],
  );
}

Widget _widgetProductPrice(BuildContext context) {
  return Text(
    '\$200',
    style: Theme.of(context).textTheme.body1.merge(TextStyle(fontSize: 16)),
  );
}

Widget _widgetProductInfo(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(top: 4),
    child: RichText(
        textAlign: TextAlign.justify,
        text: TextSpan(children: [
          TextSpan(
              text:
                  'Featuring a flattering 3/4 sleeve ideal for all seasons. Comfortable brushed jersey fabric is luxuriously soft and stretchy like a light t-shirt...',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .merge(TextStyle(fontSize: 16))),
          TextSpan(
              text: 'more',
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .merge(TextStyle(fontSize: 16, fontWeight: FontWeight.w600)))
        ])),
  );
}

