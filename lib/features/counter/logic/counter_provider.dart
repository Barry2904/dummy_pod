import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/counter_model.dart';

// StateNotifier to manage the state
class CounterNotifier extends StateNotifier<Counter> {
  CounterNotifier() : super(Counter(0));

  void increment() => state = Counter(state.value + 1);
  void decrement() => state = Counter(state.value - 1);
}

// StateNotifierProvider to expose the state
final counterProvider = StateNotifierProvider<CounterNotifier, Counter>((ref) {
  return CounterNotifier();
});
