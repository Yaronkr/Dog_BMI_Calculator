import 'package:flutter/material.dart';
import 'package:healthy_dog_calculator/models/dog.dart';

// building titleText

Text titleText(String content, BuildContext context) {
  return (Text(
    content,
    textAlign: TextAlign.center,
    style: Theme.of(context).textTheme.headline1,
  ));
}

// building form field

Padding dogDetailsText(String title, String data, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(top: 17.0, right: 4),
    child: Wrap(
      children: [
        Text(
          title,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodyText2,
        ),
        Text(
          data,
          textAlign: TextAlign.end,
          style: Theme.of(context).textTheme.bodyText1,
        ),
      ],
    ),
  );
}

// building user dog text widgets
List<Widget> createTextList(BuildContext context, Dog userDog) {
  List<Widget> textList = [];
  userDog.getDogInformation().forEach((key, value) => textList.add(dogDetailsText(key, value, context)));
  return (textList);
}
