import 'package:equatable/equatable.dart';

abstract class BmiEvent extends Equatable {
  @override
  List<Object> get props => [];

  const BmiEvent();
}

class MetricEvent extends BmiEvent {
  final double weight;
  final double height;

  @override
  List<Object> get props => [weight, height];

  const MetricEvent({this.weight = 0, this.height = 0});
}

class ImperialEvent extends BmiEvent {
  final double myWeight;
  final double myHeight;

  @override
  List<Object> get props => [myWeight, myHeight];

  const ImperialEvent({this.myWeight = 0, this.myHeight = 0});
}

class ResetResult extends BmiEvent{}
