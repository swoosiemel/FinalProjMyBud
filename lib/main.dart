import 'package:flutter/material.dart' hide Router;
import 'package:moneymanager/locator.dart';
import 'package:moneymanager/ui/router.dart' show Router;
import 'package:moneymanager/ui/shared/app_colors.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MYBUDAPP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: backgroundColor,
        accentColor: Colors.brown,
      ),
      initialRoute: 'home',
      onGenerateRoute: Router.generateRoute,
    );
  }
}
