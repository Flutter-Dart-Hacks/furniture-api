import 'package:flutter/material.dart';
import 'package:furnitureapi/components/title_text.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/size_config.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.productData,
    required this.pressCallback,
  }) : super(key: key);

  final Product productData;

  // Function dan callback
  // https://www.digitalocean.com/community/tutorials/flutter-widget-communication
  final Function pressCallback;
  // final VoidCallback presscb;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Container(
      width: defaultSize * 14.5,
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: AspectRatio(
        aspectRatio: 0.693,
        // Ripple effect
        // https://flutteragency.com/inkwell-not-showing-ripple-effect-in-flutter/
        child: Material(
          color: Colors.white.withOpacity(0),
          child: InkWell(
            borderRadius: BorderRadius.circular(30),
            onTap: () {
              pressCallback();
            },
            child: Column(
              children: <Widget>[
                AspectRatio(
                  aspectRatio: 1,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/spinner.gif',
                    image: product.image,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: defaultSize,
                  ),
                  child: TitleText(titleText: product.title),
                ),
                SizedBox(height: defaultSize / 2),
                Text("\$${product.price}"),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
