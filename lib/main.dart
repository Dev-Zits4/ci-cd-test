import 'package:bloc_prac/app_bloc_observer.dart';
import 'package:bloc_prac/bloc/theme_bloc.dart';
import 'package:bloc_prac/bloc/theme_event.dart';
import 'package:bloc_prac/bloc/theme_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  Bloc.observer = AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory:
        HydratedStorageDirectory((await getTemporaryDirectory()).path),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(title),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocSelector<CounterBloc, CounterState, int>(
            selector: (state) => state.counterA,
            builder: (context, counterA) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Counter A :$counterA',
                  ),
                ],
              );
            },
          ),
          BlocSelector<CounterBloc, CounterState, int>(
            selector: (state) => state.counterB,
            builder: (context, counterB) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Counter B :$counterB',
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(IncrementCounterA()),
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(DecrementCounterA()),
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(IncrementCounterB()),
                child: const Icon(Icons.add),
              ),
              const SizedBox(height: 20),
              FloatingActionButton(
                onPressed: () =>
                    context.read<CounterBloc>().add(DecrementCounterB()),
                child: const Icon(Icons.remove),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
