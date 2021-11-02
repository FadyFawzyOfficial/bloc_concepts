import 'package:bloc/bloc.dart';

// Here we're declaring the Cubit for managing the counter feature.
class CounterCubit extends Cubit<int> {
  // We are set the default 'state' of the counter to zero in the constractor.
  CounterCubit() : super(0);

  // Then we create an increment & decrement functions so that when we call it
  // from the UI, then your increment & decrement in state will be emitted
  void increment() => emit(state + 1);
  void decrement() => emit(state - 1);
}

// The main function acts like the UI currently.
// The function is designed for eductional purpose to easy understand.
void main(List<String> args) {
  // We declate the CounterCubit.
  final cubit = CounterCubit();

  // Then we can observe how we can update the state of the counter value easily
  // by calling the specific function we created earlier (inside cubit)
  print(cubit.state); //! Should print 0 = the initial state of the counter

  cubit.increment();

  print(cubit.state); //! Should print 1

  cubit.increment();

  print(cubit.state); //! Should print 2

  cubit.decrement();

  print(cubit.state); //! Should print 1
}
