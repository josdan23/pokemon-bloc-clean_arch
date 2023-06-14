part of 'all_pokemons_bloc.dart';

sealed class AllPokemonsState {}

class AllPokemonsInitial extends AllPokemonsState {}

class AllPokemonsLoading extends AllPokemonsState {}

class AllPokemonsSuccess extends AllPokemonsState {
  final List<Pokemon> allPokemons;

  AllPokemonsSuccess({required this.allPokemons});
}

class AllPokemonsFaiulure extends AllPokemonsState {
  final Faiulure faiulure;

  AllPokemonsFaiulure({required this.faiulure});
}
