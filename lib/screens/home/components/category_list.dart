import 'package:flutter/material.dart';
import 'package:furnitureapi/models/categories.dart';
import 'package:furnitureapi/screens/home/components/category_card.dart';

class CategoriesList extends StatelessWidget {
  const CategoriesList({
    Key? key,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;

  @override
  Widget build(BuildContext context) {
    if (categories.isNotEmpty) {
      return Scrollbar(
        trackVisibility: false,
        isAlwaysShown: false,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(
              categories.length,
              (index) {
                return CategoryCard(categoryItem: categories[index]);
              },
            ),
          ),
        ),
      );
    } else {
      return createMockGenerateList();
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

  Widget createMockListcard() {
    List<Category> listCategoryMock = [category, category, category];

    return Container(
      padding: const EdgeInsets.only(left: 10),
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          Category categorydata = listCategoryMock[index];
          return CategoryCard(categoryItem: categorydata);
        },
        itemCount: listCategoryMock.length,
        scrollDirection: Axis.vertical,
      ),
    );
  }

  Widget createMockGenerateList() {
    List<Category> listCategoryMock = [category, category, category];

    return Scrollbar(
      trackVisibility: false,
      isAlwaysShown: false,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: List.generate(
            listCategoryMock.length,
            (index) {
              return CategoryCard(categoryItem: listCategoryMock[index]);
            },
          ),
        ),
      ),
    );
  }
}
