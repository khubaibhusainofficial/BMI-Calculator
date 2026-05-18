import 'package:bloc/bloc.dart';
import 'package:bmi_calculator/BlocLogic/bmi_event.dart';
import 'package:bmi_calculator/BlocLogic/bmi_state.dart';

class BmiBloc extends Bloc<BmiEvent, BmiState> {
  BmiBloc() : super(BmiState()) {
    on<MetricEvent>(metricCalculation);
    on<ImperialEvent>(imperialCalculation);
    on<ResetResult>(resetAll);
  }

  void metricCalculation(MetricEvent event, Emitter<BmiState> emit) {
    final mWeight = event.weight;
    final mHeight = event.height;
    final double metricFormula = mWeight / (mHeight * mHeight);
    emit(state.copyWith(mWeight, mHeight, metricFormula));
  }

  void imperialCalculation(ImperialEvent event, Emitter<BmiState> emit) {
    final iWeight = event.myWeight;
    final iHeight = event.myHeight;
    final imperialFormula = ((iWeight * 703) / (iHeight * iHeight));
    emit(state.copyWith(iWeight, iHeight, imperialFormula));
  }

  void resetAll(ResetResult event, Emitter<BmiState> emit) {
    emit(BmiState.resetResultValue);
  }
}
