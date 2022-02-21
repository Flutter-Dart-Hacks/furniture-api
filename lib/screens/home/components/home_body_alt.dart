import 'package:flutter/material.dart';
import 'package:furnitureapi/components/title_text.dart';
import 'package:furnitureapi/models/categories.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/screens/home/components/category_card.dart';
import 'package:furnitureapi/screens/home/components/category_list.dart';
import 'package:furnitureapi/screens/home/components/product_card.dart';
import 'package:furnitureapi/services/fetch_category.dart';
import 'package:furnitureapi/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return SafeArea(
      child: Scrollbar(
        isAlwaysShown: false,
        scrollbarOrientation: ScrollbarOrientation.right,
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
              Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 6,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.693,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                  ),
                  itemBuilder: (context, index) {
                    return ProductCard(
                        productData: product, pressCallback: () {});
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding createListGridsOk(double defaultSize) {
    return Padding(
      padding: EdgeInsets.all(defaultSize * 2), //20
      child: GridView.builder(
        // We just turn off grid view scrolling
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        // just for demo
        itemCount: 3,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount:
              SizeConfig.orientation == Orientation.portrait ? 2 : 4,
          mainAxisSpacing: 20,
          crossAxisSpacing: 20,
          childAspectRatio: 0.693,
        ),
        itemBuilder: (context, index) =>
            ProductCard(productData: product, pressCallback: () {}),
      ),
    );
  }
}

class ListWidgetCategoryCard extends StatelessWidget {
  const ListWidgetCategoryCard({
    Key? key,
    required this.listCategoryMock,
  }) : super(key: key);

  final List<Category> listCategoryMock;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: true,
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
    );
  }
}
