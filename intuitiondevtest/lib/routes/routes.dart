import 'package:flutter/material.dart';
import 'package:intuitiondevtest/screens/create_new.dart';
import 'package:intuitiondevtest/screens/general_lists.dart';
import 'package:intuitiondevtest/screens/general_menu.dart';
import 'package:intuitiondevtest/screens/itemDescription.dart';
import 'package:intuitiondevtest/screens/mainscreen.dart';
import 'package:intuitiondevtest/screens/register.dart';
import 'package:intuitiondevtest/screens/welcome.dart';

import '../screens/register_options.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case '/main_screen':
        return MaterialPageRoute(builder: (_) => const MainScreen());
      case '/welcome':
        return MaterialPageRoute(builder: (_) => const Welcome());
      case '/registro_opciones':
        return MaterialPageRoute(builder: (_) => const RegisterOption());
      case '/register':
        return MaterialPageRoute(builder: (_) => const Register());
      case '/general_menu':
        return MaterialPageRoute(builder: (_) => const GeneralMenu());
      case '/general_lists':
        return MaterialPageRoute(builder: (_) => const GeneralLists());
      case '/item_description':
        return MaterialPageRoute(builder: (_) => ItemDescription());
      case '/create_new':
        return MaterialPageRoute(builder: (_) => CreateNew());
      // case '/map_screen':
      //   return MaterialPageRoute(builder: (_) => MapScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Error'),
        ),
        body: const Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
