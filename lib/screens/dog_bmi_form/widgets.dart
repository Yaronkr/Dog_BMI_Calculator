import 'package:flutter/cupertino.dart';
import 'package:healthy_dog_calculator/src/import.dart';
import 'package:hexcolor/hexcolor.dart';

Padding fomrField(TextEditingController dogController, String icon, String label, String hintText) {
  return Padding(
    padding: const EdgeInsets.only(top: 20),
    child: (TextFormField(
      controller: dogController,
      decoration: InputDecoration(
        icon: builFormIcon(icon),
        hintText: hintText,
        labelText: label,
      ),
      validator: (value) {
        return validateData(value);
      },
    )),
  );
}

/// TODO Implement slider, better for data validation.
class SliderFomrField extends StatefulWidget {
  final label;
  final unit;
  late TextEditingController dogController;
  SliderFomrField(this.dogController, this.label, this.unit);

  @override
  State<SliderFomrField> createState() => _SliderFomrField();
}

class _SliderFomrField extends State<SliderFomrField> {
  int maxValue = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '${widget.label}',
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
        Text(
          ("${maxValue.toStringAsFixed(0)} ${widget.unit}  "),
          style: Theme.of(context).textTheme.subtitle1,
        ),
        Slider(
          min: 0,
          max: 100.0,
          divisions: 50,
          value: maxValue.toDouble(),
          onChanged: (value) {
            controller:
            widget.dogController;
            setState(() {
              maxValue = value.toInt();
              widget.dogController.text = maxValue.toString();
            });
          },
        ),
      ],
    );
  }
}

class PictureButton extends StatelessWidget {
  const PictureButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
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
        width: screeWidth(context) / 2.5,
        child: CupertinoButton(
          onPressed: () {
            context.read<ImageUploader>().getImage();
          },
          padding: const EdgeInsets.all(14),
          pressedOpacity: 0.6,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Icon(
                Icons.camera,
                color: Color.fromRGBO(12, 58, 83, 1.0),
              ),
              Flexible(
                child: Text(
                  'Gallery Picture',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, color: const Color.fromRGBO(12, 58, 83, 1.0)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CheckAvatar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircleAvatar(
        radius: 30,
        backgroundColor: Colors.green,
        child: Icon(
          Icons.check,
          color: Colors.white,
          size: 60,
        ),
      ),
    );
  }
}
