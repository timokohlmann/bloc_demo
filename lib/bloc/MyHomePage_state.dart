class MyHomePageState {
  final int counter;
  MyHomePageState({this.counter = 0});

  MyHomePageState copyWith({int? counter}) {
    return MyHomePageState(
      counter: counter ?? this.counter,
    );
  }
}
