// Here, instead of having a precooked increment and decrement functions,
// we have an enum called CounterEvent which contains two events the
// increment & decrement ones.
import 'package:bloc/bloc.dart';

enum CounterEvent {
  increment,
  decrement,
}

// Here, we're declaring the Bloc responsible for managing the counter feature.
class CounterBloc extends Bloc<CounterEvent, int> {
  // We are set the default 'state' of the counter to zero in the constructor.
  CounterBloc() : super(0);

  // The CounterEvent(s) can be entered as an input into the mapEventToState()
  // function, and then a new increment & decrement state will be yielded
  // into output Stream.
  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    switch (event) {
      case CounterEvent.increment:
        yield state + 1;
        break;
      case CounterEvent.decrement:
        yield state - 1;
        break;
    }
  }
}

// The main function acts like the UI currently.
// The function is designed for educational purpose to easy understand.
Future<void> main(List<String> args) async {
  // As Cubit, in order to use bloc, you have to declare it wherever there
  // should be a new event dispatched.
  final bloc = CounterBloc();

  // The bloc 'print' will listen to the event stream, receive the event,
  // just how your friend was receiving the boat on the river, calculate
  // the next value and yield it on the State Stream.
  // this subscription to the block state stream and prints the state value
  // emitted by it.
  final streamSubscription = bloc.listen(print);

  // Wherever there should be a new event dispatched, we call 'bloc.add(event)'
  // the 'event what we want to.
  // For example, when the plus or minus button is pressed, there should be an
  // increment or decrement event dispatched.
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);

  bloc.add(CounterEvent.decrement);
  bloc.add(CounterEvent.decrement);
  bloc.add(CounterEvent.decrement);

  //! We use this to not cancel the subscription immediately down here
  await Future.delayed(Duration.zero);

  await streamSubscription.cancel();
  await bloc.close();
}
