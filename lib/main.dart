import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:pokemon/data/data_source/pokemon_remote_datasource.dart';
import 'package:pokemon/data/repositories/pokemon_repository_impl.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';
import 'package:pokemon/domain/use_cases/get_all_pokemons.dart';
import 'package:pokemon/presentation/views/home_view.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(home: HomeView());
  }
}

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton(() => PokemonRemoteDataSource(client: Client()));

  getIt.registerLazySingleton<PokemonRepository>(
      () => PokemonRepositoryImpl(dataSource: getIt()));

  getIt.registerLazySingleton(() => GetAllPokemons(getIt()));
}
