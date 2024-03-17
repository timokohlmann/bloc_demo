import 'package:bloc_demo/modules/homepage/bloc/home_bloc.dart';
import 'package:bloc_demo/modules/homepage/bloc/home_event.dart';
import 'package:bloc_demo/modules/homepage/data/repository/home_repository.dart';
import 'package:bloc_demo/modules/homepage/presentation/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final AlbumRepository albumRepository = AlbumRepository();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) =>
            MyHomePageBloc(albumRepository)..add(MyHomePageStarted()),
        child: const MyHomePage(
          title: 'Flutter Bloc Demo',
        ),
      ),
    );
  }
}
