import 'package:flutter/material.dart';
import 'package:furnitureapi/components/title_text.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/categories.dart';
import 'package:furnitureapi/size_config.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.categoryItem,
  }) : super(key: key);

  final Category categoryItem;

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return Padding(
      padding: EdgeInsets.all(defaultSize * 2),
      child: SizedBox(
        width: defaultSize * 20.5,
        child: AspectRatio(
          aspectRatio: 0.83,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Menggunakan custom path untuk latar belakang
              ClipPath(
                clipper: CategoryCustomShape(),
                child: AspectRatio(
                  aspectRatio: 1.025,
                  child: Container(
                    padding: EdgeInsets.all(defaultSize * 2),
                    color: kSecondaryColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TitleText(titleText: categoryItem.title),
                        SizedBox(
                          height: defaultSize,
                        ),
                        Text(
                          '${categoryItem.numOfProducts}+ Products',
                          style: TextStyle(
                            color: kTextColor.withOpacity(0.6),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                left: 0,
                right: 0,
                child: AspectRatio(
                  aspectRatio: 1.15,
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/spinner.gif',
                    image: categoryItem.image,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CategoryCustomShape extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double height = size.height;
    double width = size.width;
    double cornerSize = 30;

    // Sisi lengkung sebelah kiri
    path.lineTo(0, height - cornerSize);
    path.quadraticBezierTo(0, height, cornerSize, height);

    // Sisi kanan bawah
    path.lineTo(width - cornerSize, height);
    path.quadraticBezierTo(width, height, width, height - cornerSize);

    // Sisi kanan atas
    path.lineTo(width, cornerSize);
    path.quadraticBezierTo(width, 0, width - cornerSize, 0);

    // Sisi kiri atas
    path.lineTo(cornerSize, cornerSize * 0.75);
    path.quadraticBezierTo(0, cornerSize, 0, cornerSize * 2);

    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
