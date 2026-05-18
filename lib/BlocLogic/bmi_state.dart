import 'package:equatable/equatable.dart';

class BmiState extends Equatable {
  @override
  List<Object> get props => [
    heightState,
    weightState,
    Formula,
  ];

  final double heightState;
  final double weightState;
  final double Formula;
  static BmiState resetResultValue = BmiState();

  const BmiState({
    this.heightState = 0,
    this.weightState = 0,
    this.Formula = 0,
  });

  BmiState copyWith(double? weightState, double? heightState, double? Formula) {
    return BmiState(
      weightState: weightState ?? this.weightState,
      heightState: heightState ?? this.heightState,
      Formula: Formula ?? this.Formula,
    );
  }
}
