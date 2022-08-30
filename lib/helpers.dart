import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

String? validateData(String? value) {
  if (value == null || value.isEmpty) {
    return 'value not valid';
  } else if (int.tryParse(value) == null || double.tryParse(value) == null) {
    return 'value not whole number';
  } else if (int.parse(value) < 0 || int.parse(value) > 100) {
    return 'Number not valid';
  } else {
    return null;
  }
}

Map<String, IconData> icons() {
  return {
// The underscore declares a variable as private in dart.
    'height': Icons.height,
    'scale': Icons.scale,
    'pets': Icons.pets,
    'home': Icons.home,
  };
}

Icon buildIcon(String icon) {
  return (Icon(
    icons()[icon],
    color: HexColor("#FFFFFF"),
    size: 35,
  ));
}

Icon builFormIcon(String icon) {
  return (Icon(
    icons()[icon],
    color: HexColor("#0c3a53"),
    size: 25,
  ));
}

Future<void> showMyDialog(BuildContext context) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('Breed Not Found'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('The breed you are looking for was not found'),
              Text('Please try again'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Close'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

double screeHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}

double screeWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}
