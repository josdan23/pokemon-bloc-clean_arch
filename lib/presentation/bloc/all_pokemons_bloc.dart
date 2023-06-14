import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/domain/entities/failure.dart';
import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/use_cases/get_all_pokemons.dart';

part 'all_pokemons_event.dart';
part 'all_pokemons_state.dart';

class AllPokemonsBloc extends Bloc<AllPokemonsEvent, AllPokemonsState> {
  final GetAllPokemons getAllPokemons;

  AllPokemonsBloc({required this.getAllPokemons})
      : super(AllPokemonsInitial()) {
    on<FetchAllPokemonsEvent>(_onFetchAllPokemon);
  }

  FutureOr<void> _onFetchAllPokemon(event, emit) async {
    emit(AllPokemonsLoading());
    final either = await getAllPokemons.call();
    either.fold((failure) => emit(AllPokemonsFaiulure(faiulure: failure)),
        (listPokemons) => emit(AllPokemonsSuccess(allPokemons: listPokemons)));
  }
}
