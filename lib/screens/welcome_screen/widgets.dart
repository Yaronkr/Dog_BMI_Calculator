import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ClickableCard extends StatelessWidget {
  String path;
  String image;
  String text;

  ClickableCard({Key? key, required this.path, required this.image, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(path),
      child: Card(
        elevation: 3,
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Image.asset(
                image,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 10),
            Text(
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
