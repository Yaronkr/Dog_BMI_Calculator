import 'package:flutter/cupertino.dart';
import 'dart:io';

import 'package:healthy_dog_calculator/src/import.dart';
import 'package:healthy_dog_calculator/services/network_helper.dart';
import 'package:healthy_dog_calculator/screens/dog_bmi_form/widgets.dart';

class DogBmiForm extends StatefulWidget {
  static String id = 'dog_bmi_form';

  @override
  State<DogBmiForm> createState() => _DogBmiFormState();
}

class _DogBmiFormState extends State<DogBmiForm> {
  final _formKey = GlobalKey<FormState>(); // save form state
  final dogWeight = TextEditingController(); // save form field value
  final dogHeight = TextEditingController(); // save form field value
  late String dogType;
  List<String> breeds = [];

  void futureToList(String inputText) async {
    var data = await getBreeds(inputText);
    setState(() {
      breeds = data;
    });
  }

  @override
  void initState() {
    Provider.of<ImageUploader>(context, listen: false).loadCloudApi();
    super.initState();
  }

  void showResults() async {
    if (_formKey.currentState!.validate()) {
      // If the form is valid, display a Snackbar.
      await getBreedData(dogType).then(
        (response) => {
          if (response == null || response.isEmpty || response.length > 1)
            {
              showMyDialog(context),
            }
          else
            {
              setState(
                () {
                  final File? image = context.read<ImageUploader>().image;
                  var userDog = Dog.fromJson(
                    response.first,
                    dogType,
                    int.parse(dogWeight.text),
                    int.parse(dogHeight.text),
                  );
                  Get.to(Results(userDog, image), duration: const Duration(seconds: 1), transition: Transition.fade);
                },
              )
            }
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    void printScreen() {
      print(screeWidth(context));
      print(screeHeight(context));
    }

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
        printScreen();
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true, // prevet widget change size when keyboard appears
        appBar: appBar(context: context, title: "Enter Dog Breed Height And Weight"),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: screeWidth(context) / 1.3,
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              builFormIcon('pets'),
                              SizedBox(
                                width: 250,
                                child: Autocomplete<String>(
                                  optionsBuilder: (TextEditingValue textEditingValue) {
                                    dogType = textEditingValue.text;
                                    if (textEditingValue.text == '') {
                                      return const Iterable<String>.empty();
                                    }
                                    if (textEditingValue.text.length > 2) {
                                      futureToList(textEditingValue.text);
                                      if (breeds.isNotEmpty) {
                                        return breeds;
                                      }
                                    }
                                    breeds = [];
                                    return const Iterable<String>.empty();
                                  },
                                  onSelected: (String selection) {
                                    debugPrint('You just selected $selection');
                                  },
                                ),
                              ),
                            ],
                          ),
                          fomrField(dogHeight, 'height', 'Height', 'Enter Your Dog Height (cm)'),
                          fomrField(dogWeight, 'scale', 'Weight', 'Enter Your Dog Weight (Kg)'),
                          SizedBox(height: 40.0),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    gradient: const LinearGradient(
                                      begin: Alignment.topRight,
                                      end: Alignment.bottomLeft,
                                      colors: [
                                        Color.fromARGB(250, 0, 97, 255),
                                        Color.fromARGB(250, 96, 239, 255),
                                      ],
                                    ),
                                  ),
                                  child: CupertinoButton(
                                    onPressed: showResults,
                                    padding: const EdgeInsets.all(16),
                                    child: const Text(
                                      'Check BMI',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(12, 58, 83, 1.0),
                                      ),
                                    ),
                                  ),
                                ),
                                context.watch<ImageUploader>().imageBytes == null ? const PictureButton() : CheckAvatar(),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: Text("BMI = weight (kg) / height^2 (meters)"),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: NavBar(2),
      ),
    );
  }
}
