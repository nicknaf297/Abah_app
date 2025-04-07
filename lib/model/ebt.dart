import 'package:objectbox/objectbox.dart';

@Entity()
class EBT {
  @Id()
  int id;

  String name;
  double fraction;
  double dosePerFraction;
  double bedValue;
  double eqd2Value;

  EBT({
    this.id = 0,
    this.name = "",
    this.fraction = 0.0,
    this.dosePerFraction = 0.0,
    this.bedValue = 0.0,
    this.eqd2Value = 0.0
  });

  void calculateValues(double aOverBRatio) {
    bedValue = fraction * dosePerFraction * (1 + dosePerFraction / aOverBRatio);
    eqd2Value = bedValue / (1 + 2 / aOverBRatio);
  }
}