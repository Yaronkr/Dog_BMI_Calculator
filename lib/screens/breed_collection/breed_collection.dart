import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:healthy_dog_calculator/components/nav_bar.dart';
import 'package:healthy_dog_calculator/components/top_gradient.dart';
import 'package:healthy_dog_calculator/helpers.dart';
import 'package:healthy_dog_calculator/screens/breed_collection/widgets.dart';

class BreedCollection extends StatefulWidget {
  @override
  State<BreedCollection> createState() => _BreedCollection();
}

class _BreedCollection extends State<BreedCollection> {
  List<BreedTile> breedTiles = [];
  List<BreedTile> filteredBreedTiles = [];
  final TextEditingController _searchController = TextEditingController();
  final resultsSize = 5;
  var results;
  List resultsList = [];

  Future getDocid() async {
    print(resultsList.length);
    print(breedTiles.length);
    print(filteredBreedTiles.length);

    if (breedTiles.length < resultsSize) {
      print('results = null');

      results = await FirebaseFirestore.instance.collection("breeds").limit(resultsSize).get();

      resultsList = results.docs.map((res) {
        return (res.data());
      }).toList();

      for (var breed in resultsList) {
        breedTiles.add(BreedTile(name: breed['name'], url: breed['image']['url'], temperament: breed['temperament']));
      }
    }
    searchResultsList();
    // docIDs.add(document.reference.id);
  }

  @override
  void initState() {
    _searchController.addListener(() {
      searchResultsList();
    });
    super.initState();
  }

  searchResultsList() {
    List<BreedTile> showResults = [];

    if (_searchController.text != '') {
      // we have a search parameter
      for (var breed in resultsList) {
        var name = breed['name'].toLowerCase();
        if (name.contains(_searchController.text.toLowerCase())) {
          showResults.add(BreedTile(name: breed['name'], url: breed['image']['url'], temperament: breed['temperament']));
        }
      }
    } else {
      showResults = breedTiles;
    }
    setState(() {
      filteredBreedTiles = showResults;
    });
  }

  @override
  void dispose() {
    breedTiles = [];
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false, // prevet widget change size when keyboard appears
        body: SafeArea(
          child: FutureBuilder(
            future: getDocid(),
            builder: ((context, snapshot) {
              return Column(
                children: [
                  Flexible(
                    fit: FlexFit.tight,
                    flex: 1,
                    child: Stack(
                      // AlignmentGeometry alignment = AlignmentDirectional.topStart,
                      children: [
                        TopGradient(width: screeWidth(context) / 2),
                        Padding(
                          padding: const EdgeInsets.only(top: 120.0, left: 120, right: 30),
                          child: SearchBar(searchController: _searchController),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: ListView.builder(
                      itemCount: filteredBreedTiles.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                          child: filteredBreedTiles[index],
                        );
                      },
                    ),
                  ),
                ],
              );
            }),
          ),
        ),
        bottomNavigationBar: NavBar(2),
      ),
    );
  }
}
