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
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenHeight * 1.2
            : SizeConfig.screenHeight * 1.2 - (AppBar().preferredSize.height),
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ProductInfo(
              productItem: productItem,
            ),
            Positioned(
              top: defaultSize * 37.5,
              left: 0,
              right: 0,
              child: Container(
                margin: const EdgeInsets.only(bottom: 10),
                child: ProductDescription(
                  productItem: productItem,
                  callback: () {
                    print('Add To card clicked');
                  },
                ),
              ),
            ),
            Positioned(
              top: defaultSize * 8.5,
              right: -1 * (defaultSize * 3.5),
              child: Hero(
                tag: productItem.id,
                child: Image.network(
                  productItem.image,
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8,
                  width: defaultSize * 36.4,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
