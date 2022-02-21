import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/screens/home/components/home_body.dart';
import 'package:furnitureapi/size_config.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // fungsi responsive
    SizeConfig().init(context);

    return Scaffold(
      appBar: buildAppbar(),
      body: const HomeBody(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      leading: IconButton(
        onPressed: () {},
        icon: SvgPicture.asset(
          'assets/icons/menu.svg',
          fit: BoxFit.cover,
          height: SizeConfig.defaultSize * 2,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/scan.svg',
            height: SizeConfig.defaultSize * 2.4,
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Scan',
              style: TextStyle(
                color: kTextColor,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(
              width: SizeConfig.defaultSize,
            )
          ],
        )
      ],
    );
  }
}
