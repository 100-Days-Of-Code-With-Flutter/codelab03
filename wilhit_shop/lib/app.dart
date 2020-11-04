import 'package:flutter/material.dart';
import 'supplemental/cut_corners_border.dart';

import 'home.dart';
import 'login.dart';
import 'colors.dart';
import 'backdrop.dart';
import 'model/product.dart';
import 'category_menu_page.dart';

// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}

class _ShrineAppState extends State<ShrineApp> {
  Category _currentCategory = Category.all;

  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WilhitShop',
      debugShowCheckedModeBanner: false,
      // TODO: Change home: to a Backdrop with a HomePage frontLayer (104)
      home: Backdrop(
        currentCategory: Category.all,
        frontLayer: HomePage(category: _currentCategory,),
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCateoryTap: _onCategoryTap,
          ),
        frontTitle: Text('WILHIT SHOP'),
        backTitle: Text('MENU'),
      ),
      // TODO: Make currentCategory field take _currentCategory (104)
      // TODO: Pass _currentCategory for frontLayer (104)
      // TODO: Change backLayer field value to CategoryMenuPage (104)
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      // TODO: Add a theme (103)
      theme: _kWhilhitTheme,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}

// TODO: Build a Shrine Theme (103)
final ThemeData _kWhilhitTheme = _buildWilhitTheme();

ThemeData _buildWilhitTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kWilhitYellow900,
    primaryColor: kWilhitYellow100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kWilhitYellow100,
      colorScheme: base.colorScheme.copyWith(
        secondary: kWilhitYellow900,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
      focusedBorder: CutCornersBorder(
        borderSide: BorderSide(
          width: 2.0,
          color: kWilhitYellow900,
        ),
      ),
    ),
    buttonBarTheme: base.buttonBarTheme.copyWith(
      buttonTextTheme: ButtonTextTheme.accent,
    ),
    primaryIconTheme: base.iconTheme.copyWith(
      color: kWilhitYellow900,
    ),
    scaffoldBackgroundColor: kWilhitBackgroundWhite,
    cardColor: kWilhitBackgroundWhite,
    textSelectionColor: kWilhitYellow100,
    errorColor: kWilhitErrorRed,
    textTheme: _buildWilhitTextTheme(base.textTheme),
    primaryTextTheme: _buildWilhitTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildWilhitTextTheme(base.accentTextTheme),
  );
}

// TODO: Build a Shrine Text Theme (103)
TextTheme _buildWilhitTextTheme(TextTheme base) {
  return base
      .copyWith(
        headline5: base.headline5.copyWith(
          fontWeight: FontWeight.w500,
        ),
        headline6: base.headline6.copyWith(fontSize: 18.0),
        caption: base.caption.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 14.0,
        ),
        bodyText1: base.bodyText1.copyWith(
          fontWeight: FontWeight.w500,
          fontSize: 16.0,
        ),
      )
      .apply(
        fontFamily: 'Rubik',
        displayColor: kWilhitYellow900,
        bodyColor: kWilhitYellow900,
      );
}
