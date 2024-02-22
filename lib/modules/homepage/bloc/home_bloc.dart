import 'package:bloc_demo/modules/homepage/bloc/home_event.dart';
import 'package:bloc_demo/modules/homepage/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePageBloc extends Bloc<MyHomePageEvent, MyHomePageState> {
  MyHomePageBloc() : super(MyHomePageState()) {
    on<MyHomePageCounterPressedPlus>((_incrementCounter));
    on<MyHomePageCounterPressedMinus>((_decrementCounter));
  }

  Future<void> _started() async {}

  Future<void> _incrementCounter(
    MyHomePageCounterPressedPlus event,
    Emitter<MyHomePageState> emit,
  ) async {
    emit(
      state.copyWith(counter: state.counter + 1),
    );
  }

  Future<void> _decrementCounter(
    MyHomePageCounterPressedMinus event,
    Emitter<MyHomePageState> emit,
  ) async {
    emit(
      state.copyWith(counter: state.counter - 1),
    );
  }
}
