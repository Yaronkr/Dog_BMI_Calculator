import 'dart:math';

class Dog {
  final String? name;
  final int? weight;
  final int? height;
  final int? maxWeight;
  final int? minWeight;
  final int? maxHeight;
  final int? minHeight;
  final String? lifeSpan;
  final String? temperament;
  final String? referenceImageId;
  double? minHealthyBMI;
  double? maxHealthyBMI;
  double? dogBMI;

  Dog({
    this.name,
    this.weight,
    this.height,
    this.dogBMI,
    this.maxWeight,
    this.minWeight,
    this.maxHeight,
    this.minHeight,
    this.lifeSpan,
    this.temperament,
    this.referenceImageId,
    this.minHealthyBMI,
    this.maxHealthyBMI,
  });

  double _calculateBMI([int? weight = 1, int? height = 1]) {
    return (weight! * 703 / pow(height!, 2));
  }

  String checkHealthy() {
    minHealthyBMI = _calculateBMI(minWeight, maxHeight);
    maxHealthyBMI = _calculateBMI(maxWeight, minHeight);
    dogBMI = _calculateBMI(weight, height);
    if (dogBMI! > max(maxHealthyBMI ?? 1, minHealthyBMI ?? 1)) {
      return "Overweight";
    } else if (dogBMI! < min(maxHealthyBMI ?? 1, minHealthyBMI ?? 1)) {
      return "Underweight";
    } else {
      return "Healthy";
    }
  }

  factory Dog.fromJson(Map<String, dynamic> json, formName, formWeight, formHeight) {
    return Dog(
      name: formName as String?,
      weight: formWeight as int?,
      height: formHeight as int?,
      maxWeight: int.parse(json['weight']['metric'].split('-')[1]),
      minWeight: int.parse(json['weight']['metric'].split('-')[0]),
      maxHeight: int.parse(json['height']['metric'].split('-')[1]),
      minHeight: int.parse(json['height']['metric'].split('-')[0]),
      lifeSpan: json['life_span'] as String?,
      temperament: json['temperament'] as String?,
      referenceImageId: json['reference_image_id'] as String?,
    );
  }

  Map<String, String> getDogInformation() {
    return {
      'Height:': ' $height Cm',
      'Weight:': ' $weight Kg',
      'BMI:': ' ${(dogBMI?.toStringAsFixed(1))}',
      'Healthy Height Range:': ' $minHeight - $maxHeight cm',
      'Healthy Weight Range:': ' $minWeight - $maxWeight Kg',
      'life_span:': ' $lifeSpan',
      'temperament:': ' $temperament',
    };
  }
}
