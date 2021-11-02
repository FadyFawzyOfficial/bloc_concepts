// Imagine the Stream is like a river starts from the uphill where you are stand
// and you will send 10 boats (data) down the river to your friend there.
// The first boat will have no.1, the second will have no.2, and so on ...

// Sender:
// Async Generateor Function that Generate Async Data (Async*)
// It generates asychoronous data, hence marking it with the async* star
Stream<int> createBoatsStream() async* {
  for (int i = 1; i <= 10; i++) {
    print('Sent boat no.$i');

    // await waits for this process to finish (Delay by 2 seconds)
    // before proceeding the next step.
    // In this case, we are waiting for 2 seconds gap between both dispatching.
    await Future.delayed(Duration(seconds: 2));
    // yield pushes the boat through the Stream River
    yield i;
  }
}

void main(List<String> arguments) {
  // Initialize the Stream.
  Stream<int> stream = createBoatsStream();

  // Reciver:
  // Then we will listen to the Stream by analyzing whether
  // a boat is recived or not
  // We use listen method to wait incoming stream boats (data),
  // the method listen doesn't know when the boat will arrive,
  // so it needs to listen or practically watch for it.
  stream.listen((receivedBoat) {
    print('Recived boat no.$receivedBoat');
  });
}
