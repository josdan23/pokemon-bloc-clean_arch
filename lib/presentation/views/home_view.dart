import 'package:flutter/material.dart';
import 'package:pokemon/main.dart';
import 'package:pokemon/presentation/bloc/all_pokemons_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Pokemons")),
        body: BlocProvider(
          create: (context) => AllPokemonsBloc(getAllPokemons: getIt())
            ..add(FetchAllPokemonsEvent()),
          child: BlocBuilder<AllPokemonsBloc, AllPokemonsState>(
            builder: (context, state) {
              switch (state) {
                case AllPokemonsInitial _:
                  return const Text("initial");
                case AllPokemonsLoading _:
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                case AllPokemonsFaiulure f:
                  return Center(
                      child: Center(
                    child: Text(f.faiulure.message),
                  ));
                case AllPokemonsSuccess s:
                  return ListView.builder(
                    itemCount: s.allPokemons.length,
                    itemBuilder: (context, index) =>
                        Text(s.allPokemons[index].name),
                  );
              }
            },
          ),
        ));
  }
}
