// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'counter_bloc.dart';

// States
sealed class CounterState extends Equatable {
  final int value;

  const CounterState(this.value);

  @override
  List<Object?> get props => [value];
}

class CounterInitial extends CounterState {
  const CounterInitial(super.value);

  @override
  List<Object?> get props => [value];
}
