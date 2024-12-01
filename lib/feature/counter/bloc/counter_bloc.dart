import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

// BLoC
class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial(0)) {
    on<Increment>((event, emit) => emit(CounterInitial(state.value + 1)));
    on<Decrement>((event, emit) => emit(CounterInitial(state.value - 1)));
  }
}
