import 'package:flutter/material.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/size_config.dart';

class DetailBody extends StatelessWidget {
  const DetailBody({Key? key, required this.productItem}) : super(key: key);

  final Product productItem;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));

    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: defaultSize * 2),
            height: defaultSize * 37.5,
            width: defaultSize * 15,
            // color: Colors.black45.withOpacity(0.8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  productItem.category.toUpperCase(),
                  style: lightTextStyle,
                ),
                SizedBox(
                  height: defaultSize,
                ),
                Text(
                  productItem.title,
                  style: TextStyle(
                    fontSize: defaultSize * 2.4,
                    fontWeight: FontWeight.bold,
                    letterSpacing: -0.8,
                    height: 1.4,
                  ),
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                Text(
                  'Form',
                  style: lightTextStyle,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
