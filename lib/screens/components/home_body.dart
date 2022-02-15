import 'package:flutter/material.dart';
import 'package:furnitureapi/components/title_text.dart';
import 'package:furnitureapi/models/categories.dart';
import 'package:furnitureapi/screens/components/category_list.dart';
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
              const Padding(
                padding: EdgeInsets.only(left: 8, right: 8),
                child: Divider(
                  height: 5,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(defaultSize * 2),
                child: const TitleText(titleText: 'Recommends For You'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
