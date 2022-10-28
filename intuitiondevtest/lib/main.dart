import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intuitiondevtest/core/firebase_initialize_app.dart';
import 'package:intuitiondevtest/providers/provider.dart';
import 'package:intuitiondevtest/routes/routes.dart';
import 'package:intuitiondevtest/screens/mainscreen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
  await FirebaseConfig.firebaseInit();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MyProvider(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: RouteGenerator.generateRoute,
          initialRoute: '/main_screen',
          title: 'Equipesados',
          home: const MainScreen()),
    );
  }
}
