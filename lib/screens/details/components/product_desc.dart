import 'package:flutter/material.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/size_config.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription({
    Key? key,
    required this.productItem,
    required this.callback,
  }) : super(key: key);

  final Product productItem;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Container(
      constraints: BoxConstraints(minHeight: defaultSize * 44),
      padding: EdgeInsets.only(
        top: defaultSize * 9, // 90
        left: defaultSize * 2, // 20
        right: defaultSize * 2, // 20
      ),
      // height: 500,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(defaultSize * 1.2),
          topRight: Radius.circular(defaultSize * 1.2),
        ),
      ),
      child: SafeArea(
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
                color: kTextColor.withOpacity(0.7),
                height: 1.5,
              ),
            ),
            SizedBox(
              height: defaultSize * 3,
            ),
            SizedBox(
              width: double.infinity,
              height: defaultSize * 5,
              child: ElevatedButton(
                onPressed: () {
                  callback();
                },
                style: ElevatedButton.styleFrom(
                  primary: kPrimaryColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50)),
                ),
                child: Text(
                  'Add To Cart',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: defaultSize * 1.6),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
