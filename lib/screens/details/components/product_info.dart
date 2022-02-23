import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/size_config.dart';

class ProductInfo extends StatelessWidget {
  const ProductInfo({
    Key? key,
    required this.productItem,
  }) : super(key: key);

  final Product productItem;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));

    return Container(
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
            'From',
            style: lightTextStyle,
          ),
          Text(
            '\$${productItem.price}',
            style: TextStyle(
              fontSize: defaultSize * 1.6,
              fontWeight: FontWeight.bold,
              height: 1.6,
            ),
          ),
          SizedBox(
            height: defaultSize * 2,
          ),
          Text(
            'Available Colors',
            style: lightTextStyle,
          ),
          Row(
            children: [
              buildColorBox(
                defaultSize,
                color: const Color(0xff7ba275),
                isActive: true,
              ),
              buildColorBox(
                defaultSize,
                color: const Color(0xffd7d7d7),
              ),
              buildColorBox(
                defaultSize,
                color: kTextColor,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Container buildColorBox(double defaultSize,
      {required Color color, bool isActive = false}) {
    return Container(
      margin: EdgeInsets.only(top: defaultSize, right: defaultSize),
      padding: const EdgeInsets.all(5),
      height: defaultSize * 2.4,
      width: defaultSize * 2.4,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(6),
      ),
      child: isActive
          ? SvgPicture.asset(
              'assets/icons/check.svg',
              fit: BoxFit.cover,
            )
          : const SizedBox(),
    );
  }
}
