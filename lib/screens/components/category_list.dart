import 'package:flutter/material.dart';
import 'package:furnitureapi/models/categories.dart';
import 'package:furnitureapi/screens/components/category_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isNotEmpty) {
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
    } else {
      return Container(
        child: createMockListcard(),
      );
    }
  }

  // Alternatif menggunakan Listview
  ListView createListCard() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Category categorydata = categories[index];
        return CategoryCard(categoryItem: categorydata);
      },
      itemCount: categories.length,
      scrollDirection: Axis.horizontal,
    );
  }

  ListView createMockListcard() {
    List<Category> listCategoryMock = [category, category, category];

    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        Category categorydata = listCategoryMock[index];
        return CategoryCard(categoryItem: categorydata);
      },
      itemCount: listCategoryMock.length,
      scrollDirection: Axis.horizontal,
    );
  }
}
