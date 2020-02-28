import 'package:flutter/material.dart';
import 'package:store_app/widgets/widget_description.dart';
import 'package:store_app/widgets/widget_pageview.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageViewCard(),
          Align(
            alignment: Alignment.bottomCenter,
            child: DescriptionItem(),
          )
        ],
      ),
    );
  }
}
