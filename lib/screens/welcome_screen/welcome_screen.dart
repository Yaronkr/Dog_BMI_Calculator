//package for using cupertino iphone style buttons

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

import 'package:healthy_dog_calculator/screens/welcome_screen/widgets.dart';
import 'package:healthy_dog_calculator/components/top_gradient.dart';
import 'package:healthy_dog_calculator/components/nav_bar.dart';

///Welcome Screen
class WelcomeScreen extends StatefulWidget {
  static String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                const TopGradient(width: 300.0),
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: 110),
                    child: Text(
                      'Healthy Dog',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.headline1,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: GridView.count(
                childAspectRatio: (50 / 60),
                scrollDirection: Axis.vertical,
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                padding: const EdgeInsets.only(left: 20.0, right: 20, top: 40),
                children: [
                  ClickableCard(path: '/dog_bmi_form', text: 'Check Your Dog BMI', image: 'assets/images/get_moving.png'),
                  ClickableCard(path: '/breed_collection', text: 'Dog Breeds Collection', image: 'assets/images/dog_breeds.png'),
                ],
              ),
            ),
          ],
        ),
        bottomNavigationBar: NavBar(1),
      ),
    );
  }
}
