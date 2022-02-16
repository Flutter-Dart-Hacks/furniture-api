import 'package:flutter/material.dart';
import 'package:furnitureapi/components/title_text.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/categories.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/screens/components/category_card.dart';
import 'package:furnitureapi/screens/components/category_list.dart';
import 'package:furnitureapi/services/fetch_category.dart';
import 'package:furnitureapi/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;
    List<Category> listCategoryMock = [category, category, category];

    return SafeArea(
      child: Scrollbar(
        showTrackOnHover: true,
        isAlwaysShown: false,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: const TitleText(
                  titleText: 'Browse by Categories',
                ),
              ),
              FutureBuilder<List<Category>>(
                future: fetchCategories(),
                builder: ((context, snapshot) {
                  if (snapshot.hasData) {
                    // Menggunakan null safety
                    // https://dart.dev/null-safety/understanding-null-safety#unnecessary-code-warnings
                    return CategoriesList(
                        categories: snapshot.data ?? List.empty());
                    // return CategoriesList(
                    //   categories: List.empty(),
                    // );
                  } else if (snapshot.hasError) {
                    // return const Text('Error fetch data');
                    return CategoriesList(categories: List.empty());
                  } else {
                    // return const CircularProgressIndicator();
                    return Center(
                      child: Image.asset('assets/ripple.gif'),
                    );
                  }
                }),
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: 8,
                  right: 8,
                  top: defaultSize,
                  bottom: defaultSize,
                ),
                child: Divider(
                  height: 2,
                  thickness: 2,
                  color: Colors.black.withOpacity(0.1),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: defaultSize,
                  left: defaultSize * 2,
                  right: defaultSize * 2,
                  bottom: defaultSize,
                ),
                child: const TitleText(titleText: 'Recommends to Buy'),
              ),
              ProductCard(
                productData: product,
                pressCallback: () {
                  print("Wow! Ripple");
                },
              ),
              Visibility(
                visible: false,
                child: Container(
                  // https://stackoverflow.com/questions/56131101/how-to-place-a-listview-inside-a-singlechildscrollview-but-prevent-them-from-scr/56137112
                  padding: const EdgeInsets.only(top: 5),
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      Category categorydata = listCategoryMock[index];
                      return CategoryCard(categoryItem: categorydata);
                    },
                    itemCount: listCategoryMock.length,
                    scrollDirection: Axis.vertical,
                    primary: false,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
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
