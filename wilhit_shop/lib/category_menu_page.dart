import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'colors.dart';
import 'model/product.dart';

class CategoryMenuPage extends StatelessWidget {
  final Category currentCategory;
  final ValueChanged<Category> onCateoryTap;
  final List<Category> _categories = Category.values;

  const CategoryMenuPage(
      {Key key, @required this.currentCategory, @required this.onCateoryTap})
      : assert(currentCategory != null),
        assert(onCateoryTap != null);

  Widget _buildCategory(Category category, BuildContext context) {
    final categoryString =
        category.toString().replaceAll('Category.', '').toUpperCase();
    final ThemeData theme = Theme.of(context);

    return GestureDetector(
      onTap: () => onCateoryTap(category),
      child: category == currentCategory 
      ? Column( 
        children: [
          SizedBox(height: 16.0,), 
          Text(
            categoryString, 
            style: theme.textTheme.bodyText1, 
            textAlign: TextAlign.center,
            ), 
          SizedBox(height: 14.0,),
          Container(
            width: 70.0,
            height: 2.0,
            color: kWilhitYellow400,
          ), 
        ],
      )
      : Padding(
        padding: EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          categoryString,
          style: theme.textTheme.bodyText1.copyWith(
            color: kWilhitYellow900.withAlpha(150)
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 40.0),
        color: kWilhitYellow100,
        child: ListView(
          children: _categories.map(
            (Category c) => _buildCategory(c, context)
          ).toList(),
        ),
      ),
    );
  }
}
