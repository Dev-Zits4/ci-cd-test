import 'package:bloc_prac/bloc/theme_event.dart';
import 'package:bloc_prac/bloc/theme_state.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(counterA: 0, counterB: 0)) {
    on<IncrementCounterA>((event, emit) {
      _incrementCounterA(emit);
    });
    on<IncrementCounterB>((event, emit) {
      _incrementCounterB(emit);
    });
    on<DecrementCounterA>((event, emit) {
      _decrementCounterA(emit);
    });
    on<DecrementCounterB>((event, emit) {
      _decrementCounterB(emit);
    });
  }

  void _incrementCounterA(Emitter<CounterState> emit) {
    return emit(state.copyWith(counterA: state.counterA + 1));
  }

  void _incrementCounterB(Emitter<CounterState> emit) {
    return emit(state.copyWith(counterB: state.counterB + 1));
  }

  void _decrementCounterA(Emitter<CounterState> emit) {
    return emit(state.copyWith(counterA: state.counterA - 1));
  }

  void _decrementCounterB(Emitter<CounterState> emit) {
    return emit(state.copyWith(counterB: state.counterB - 1));
  }
}
