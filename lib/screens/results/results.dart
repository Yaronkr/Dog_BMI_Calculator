import 'dart:io';
import 'package:healthy_dog_calculator/src/import.dart';
import 'package:healthy_dog_calculator/screens/results/widgets.dart';

class Results extends StatefulWidget {
  final Dog userDog;
  final File? image;

  const Results(this.userDog, this.image);

  @override
  State<Results> createState() => _ResultsState();
}

class _ResultsState extends State<Results> {
  late Dog userDog;
  late Map<String, String> dogInformation;

  @override
  void initState() {
    super.initState();
    userDog = widget.userDog;
  }

  @override
  Widget build(BuildContext context) {
    // will close the emulator keyboard when user click on the screen
    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      // ignore: avoid_print
      child: Scaffold(
        appBar: appBar(context: context, title: 'Your ${userDog.name} is ' + userDog.checkHealthy()),
        // change screen to scrollable
        body: SingleChildScrollView(
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(102),
              ),
              width: screeWidth(context) / 1.2,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      ),
                      child: widget.image != null
                          ? Image.file(
                              widget.image!,
                              fit: BoxFit.scaleDown,
                              height: screeWidth(context) / 2.75,
                            )
                          : const Image(
                              image: NetworkImage(
                                  "https://cdn-fastly.petguide.com/media/2022/02/16/8235403/top-10-funniest-dog-breeds.jpg?size=720x845&nocrop=1"),
                              fit: BoxFit.contain,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: createTextList(context, userDog),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        bottomNavigationBar: NavBar(1),
      ),
    );
  }
}

class avatarImage extends StatelessWidget {
  final File image;
  avatarImage(this.image);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircleAvatar(
        radius: 40,
        backgroundColor: Colors.black,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(40.0),
          child: Image.file(
            image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
