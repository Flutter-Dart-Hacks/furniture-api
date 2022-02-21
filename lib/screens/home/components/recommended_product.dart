import 'package:flutter/material.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/screens/details/detail_screen.dart';
import 'package:furnitureapi/screens/home/components/product_card.dart';
import 'package:furnitureapi/size_config.dart';

class RecommendedProduct extends StatelessWidget {
  const RecommendedProduct({
    Key? key,
    required this.listProduct,
  }) : super(key: key);

  final List<Product> listProduct;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: listProduct.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          childAspectRatio: 0.693,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
        ),
        itemBuilder: (context, index) {
          return ProductCard(
            productData: listProduct[index],
            pressCallback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(product: listProduct[index]);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
