import 'dart:async';

import 'package:bloc/bloc.dart';

// Here we're declaring the Cubit responsible for managing the counter feature.
class CounterCubit extends Cubit<int> {
  // We are set the default 'state' of the counter to zero in the constructor.
  CounterCubit() : super(0);

  // Then we create an increment & decrement functions so that when we call it
  // from the UI, then you increment & decrement in state will be emitted.
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

// The main function acts like the UI currently.
// The function is designed for educational purpose to easy understand.
Future<void> main(List<String> arguments) async {
  // Cubit is actually a type of Stream emitting states.
  final cubit = CounterCubit();

  // You can listen to it and observe the state change
  //! this subscription to the cubit state stream and prints the state value
  //! emitted by it.
  final streamSubscription = cubit.listen(print);

  cubit.increment();
  cubit.increment();
  cubit.increment();
  cubit.increment();

  //! We use this to not cancel the subscription immediately down here
  await Future.delayed(Duration.zero);

  await streamSubscription.cancel();
  await cubit.close();
}
