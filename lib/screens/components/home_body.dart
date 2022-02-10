import 'package:flutter/material.dart';
import 'package:furnitureapi/components/title_text.dart';
import 'package:furnitureapi/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return SafeArea(
      child: SingleChildScrollView(
        child: Scrollbar(
          scrollbarOrientation: ScrollbarOrientation.right,
          showTrackOnHover: true,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: const TitleText(
                  titleText: 'Browse by Categories',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
