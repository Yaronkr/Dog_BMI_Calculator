import 'package:flutter/material.dart';
import 'package:healthy_dog_calculator/helpers.dart';
import './top_gradient.dart';

PreferredSize appBar({required BuildContext context, required String title}) {
  return PreferredSize(
    preferredSize: const Size.fromHeight(220),
    child: Stack(
      children: [
        TopGradient(width: screeWidth(context) / 2),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(bottom: 50),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline1,
            ),
          ),
        ),
      ],
    ),
  );
}
