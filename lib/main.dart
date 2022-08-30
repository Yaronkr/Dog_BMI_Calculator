import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

import 'package:healthy_dog_calculator/theme/style.dart';
import 'package:healthy_dog_calculator/screens/welcome_screen/welcome_screen.dart';
import 'package:healthy_dog_calculator/routes.dart';
import 'package:healthy_dog_calculator/models/image_uploader.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ImageUploader()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // using Get package for pages routes, and trasitions
    return GetMaterialApp(
      debugShowCheckedModeBanner: false, // remove debug banner from emulator

      title: 'Healthy Dog Calculator',
      theme: appTheme(),
      home: WelcomeScreen(),
      getPages: getRoutes(),
    );
  }
}
