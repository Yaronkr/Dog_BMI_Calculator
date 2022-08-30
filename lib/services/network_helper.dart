import 'dart:async';
import 'dart:convert';
import 'dart:io';

// env package for ENV varibales
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'package:http/http.dart' as http;

/// get all dog breed information from DOG api
/// TODO Merge both functions, and get final breed data from
/// TODO Handle errors
Future getBreeds(String userInput) async {
  try {
    await dotenv.load();
    List<String> breeds = [];
    String url = "https://api.thedogapi.com/v1/breeds/search?q=$userInput";

    http.Response response = await http.get(
      Uri.parse(url),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: dotenv.get('DOG_API'),
      },
    );

    if (response.statusCode == 200) {
      List responseJson = jsonDecode(response.body);
      responseJson.forEach((breed) => breeds.add(breed["name"].toString()));
      return breeds;
    }
  } on Exception catch (error) {
    print(error);
  }
}

//// get final dog breed information from DOG api
/// TODO function is not necessary, can use only getBreeds
///
Future getBreedData(String breedType) async {
  String url = "https://api.thedogapi.com/v1/breeds/search?q=$breedType";

  try {
    http.Response response = await http.get(
      Uri.parse(url),
      // Send authorization headers to the backend.
      headers: {
        HttpHeaders.authorizationHeader: dotenv.get('DOG_API'),
      },
    );

    if (response.statusCode == 200) {
      List responseJson = jsonDecode(response.body);
      return responseJson;
    } else
      return ('fail to get data');
  } on Exception catch (error) {
    print(error);
  }
}
