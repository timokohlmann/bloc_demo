import 'package:bloc_demo/modules/homepage/bloc/home_bloc.dart';
import 'package:bloc_demo/modules/homepage/bloc/home_event.dart';
import 'package:bloc_demo/modules/homepage/bloc/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final myHomePageBloc = BlocProvider.of<MyHomePageBloc>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: BlocBuilder<MyHomePageBloc, MyHomePageState>(
        builder: (context, state) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '${state.counter}',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                const SizedBox(height: 70),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      hoverElevation: 20,
                      onPressed: () {
                        myHomePageBloc.add(MyHomePageCounterPressedMinus());
                      },
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 20),
                    FloatingActionButton(
                      onPressed: () {
                        myHomePageBloc.add(MyHomePageCounterPressedPlus());
                      },
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: buildStateDependentWidget(state),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    myHomePageBloc.add(MyHomePageStarted());
                  },
                  child: const Icon(Icons.label),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget buildStateDependentWidget(MyHomePageState state) {
    if (state is AlbumsLoading) {
      return const CircularProgressIndicator();
    } else if (state is AlbumsLoadSuccess) {
      return Expanded(
        child: ListView.builder(
          itemCount: state.albums.length,
          itemBuilder: (context, index) {
            final album = state.albums[index];
            return ListTile(
                title: Text(album.title),
                subtitle: Text('Album-ID: ${album.id}'));
          },
        ),
      );
    } else if (state is AlbumsLoadFailure) {
      return Text('Failed to load Albums: ${state.error}');
    }
    return Text('Press the refresh button to load Albums');
  }
}
