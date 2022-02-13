import 'package:flutter/material.dart';
import 'package:furnitureapi/components/title_text.dart';
import 'package:furnitureapi/constants.dart';
import 'package:furnitureapi/models/categories.dart';
import 'package:furnitureapi/screens/components/category_card.dart';
import 'package:furnitureapi/services/fetch_category.dart';
import 'package:furnitureapi/size_config.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double defaultSize = SizeConfig.defaultSize;

    return SafeArea(
      child: SingleChildScrollView(
        child: Scrollbar(
          // scrollbarOrientation: ScrollbarOrientation.right,
          showTrackOnHover: true,
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
                      categories: snapshot.data ?? List.empty(),
                    );
                  } else if (snapshot.hasError) {
                    return const Text('Error fetch data');
                  } else {
                    // return const CircularProgressIndicator();
                    return Center(
                      child: Image.asset('assets/ripple.gif'),
                    );
                  }
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          categories.length,
          (index) {
            return CategoryCard(categoryItem: categories[index]);
          },
        ),
      ),
    );
  }

  // Alternatif menggunakan Listview
  ListView createListCard() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Category category = categories[index];
        return CategoryCard(categoryItem: category);
      },
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
