class CounterState {
  final int counterA;
  final int counterB;

  CounterState({
    required this.counterA,
    required this.counterB,
  });

  CounterState copyWith({
    int? counterA,
    int? counterB,
  }) {
    return CounterState(
      counterA: counterA ?? this.counterA,
      counterB: counterB ?? this.counterB,
    );
  }
}
