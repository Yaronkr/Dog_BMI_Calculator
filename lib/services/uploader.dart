import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'dart:ui' as ui;

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Upload all data from assets/data/breed_details.json to firestore collection

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  printDocument(firestore);
}

void write(FirebaseFirestore firestore) async {
  final String response = await rootBundle.loadString('assets/data/breed_details.json');
  var data = await json.decode(response);

  data.forEach(
    (breed) {
      firestore.collection("breeds").add(breed);
    },
  );
}

void update(FirebaseFirestore firestore, var document_id) async {
  firestore.collection("breeds").doc(document_id).update({"breed_group": "60"});
}

void delete(FirebaseFirestore firestore, var document_id) async {
  firestore.collection("breeds").doc(document_id).delete();
}

void printDocument(FirebaseFirestore firestore) async {
  final results = await firestore.collection("breeds").limit(2).where("name", isEqualTo: "Border Terrier").get();

  if (results != null) {
    List list = results.docs.map((res) {
      return (res.data());
    }).toList();
    print(list);
  } else {
    print('no results');
  }
}
