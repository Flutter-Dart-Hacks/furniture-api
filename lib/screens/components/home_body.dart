import 'package:flutter/material.dart';
import 'package:furnitureapi/components/title_text.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/categories.dart';
import 'package:furnitureapi/models/product.dart';
import 'package:furnitureapi/screens/components/category_card.dart';
import 'package:furnitureapi/screens/components/category_list.dart';
import 'package:furnitureapi/screens/components/product_card_alt.dart';
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.count(
                  // Create a grid with 2 columns. If you change the scrollDirection to
                  // horizontal, this produces 2 rows.
                  crossAxisCount: 2,
                  // Generate 100 widgets that display their index in the List.
                  children: List.generate(100, (index) {
                    return Center(
                      child: Text(
                        'Item $index',
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
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
    );
  }
}
