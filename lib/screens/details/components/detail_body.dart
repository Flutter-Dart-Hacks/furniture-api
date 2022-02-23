import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/screens/details/components/product_info.dart';
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          ProductInfo(
            productItem: productItem,
          ),
          Container(
            constraints: BoxConstraints(minHeight: defaultSize * 44),
            padding: EdgeInsets.only(
              top: defaultSize * 9, // 90
              left: defaultSize * 2, // 20
              right: defaultSize * 2,
            ),
            // height: 500,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(defaultSize * 1.2),
                topRight: Radius.circular(defaultSize * 1.2),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  productItem.subTitle,
                  style: TextStyle(
                    fontSize: defaultSize * 1.8,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: defaultSize * 3,
                ),
                Text(
                  productItem.description,
                  style: TextStyle(
                      color: kTextColor.withOpacity(0.7), height: 1.5),
                ),
                SizedBox(
                  height: defaultSize * 3,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
