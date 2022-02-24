import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/screens/details/components/product_desc.dart';
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
          ProductDescription(
            productItem: productItem,
            callback: () {},
          )
        ],
      ),
    );
  }
}
