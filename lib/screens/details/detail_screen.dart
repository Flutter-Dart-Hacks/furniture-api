import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/screens/details/components/detail_body.dart';
import 'package:furnitureapi/size_config.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key, required this.product}) : super(key: key);

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return SafeArea(
      child: Scaffold(
        backgroundColor: kSecondaryColor,
        appBar: createAppbar(context),
        body: DetailBody(productItem: widget.product),
      ),
    );
  }

  AppBar createAppbar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: SvgPicture.asset(
          "assets/icons/arrow-long-left.svg",
          fit: BoxFit.cover,
          height: SizeConfig.defaultSize * 1.5,
        ),
      ),
      actions: <Widget>[
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/bag.svg',
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(
          width: SizeConfig.defaultSize,
        )
      ],
    );
  }
}
