import 'package:bloc_demo/modules/homepage/presentation/album_model.dart';

class MyHomePageState {
  final int counter;
  MyHomePageState({this.counter = 0});

  MyHomePageState copyWith({int? counter}) {
    return MyHomePageState(
      counter: counter ?? this.counter,
    );
  }
}

class AlbumsInitial extends MyHomePageState {}

class AlbumsLoading extends MyHomePageState {}

class AlbumsLoadSuccess extends MyHomePageState {
  final List<Album> albums;

  AlbumsLoadSuccess(this.albums);
}

class AlbumsLoadFailure extends MyHomePageState {
  final String error;

  AlbumsLoadFailure(this.error);
}
