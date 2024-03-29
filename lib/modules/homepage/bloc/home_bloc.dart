import 'package:bloc_demo/modules/homepage/bloc/home_event.dart';
import 'package:bloc_demo/modules/homepage/bloc/home_state.dart';
import 'package:bloc_demo/modules/homepage/data/repository/home_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

class MyHomePageBloc extends Bloc<MyHomePageEvent, MyHomePageState> {
  MyHomePageBloc(this.albumRepository) : super(MyHomePageState()) {
    on<MyHomePageStarted>((_onStarted));
    on<MyHomePageCounterPressedPlus>((_incrementCounter));
    on<MyHomePageCounterPressedMinus>((_decrementCounter));
  }
  final AlbumRepository albumRepository;

  Future<void> _onStarted(
    MyHomePageStarted event,
    Emitter<MyHomePageState> emit,
  ) async {
    emit(AlbumsLoading());
    try {
      final albums = await albumRepository.fetchAlbums();
      emit(AlbumsLoadSuccess(albums));
    } catch (error) {
      emit(AlbumsLoadFailure(error.toString()));
    }
  }

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
