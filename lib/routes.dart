import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:healthy_dog_calculator/screens/welcome_screen/welcome_screen.dart';
import 'package:healthy_dog_calculator/screens/dog_bmi_form/dog_bmi_form.dart';
import 'package:healthy_dog_calculator/screens/breed_collection/breed_collection.dart';

/// deprecated, replaced with the Get package.
/// maybe will be useful  ll later

final Map<String, WidgetBuilder> routes = <String, WidgetBuilder>{
  WelcomeScreen.id: (BuildContextcontext) => WelcomeScreen(),
  DogBmiForm.id: (BuildContextcontext) => DogBmiForm(),
};

// Method define pages routes, and transition animation
List<GetPage<dynamic>> getRoutes() {
  return [
    GetPage(name: '/dog_bmi_form', page: () => DogBmiForm(), transitionDuration: const Duration(seconds: 1), transition: Transition.zoom),
    GetPage(name: '/welcome_screen', page: () => WelcomeScreen(), transitionDuration: const Duration(seconds: 1), transition: Transition.fadeIn),
    GetPage(name: '/breed_collection', page: () => BreedCollection(), transitionDuration: const Duration(seconds: 1), transition: Transition.zoom),
  ];
}
