import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/product.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: SvgPicture.asset("assets/icons/arrow-long-left.svg"),
        ),
      ),
    );
  }
}
