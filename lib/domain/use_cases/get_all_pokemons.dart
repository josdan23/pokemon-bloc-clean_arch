import 'package:dartz/dartz.dart';
import 'package:pokemon/domain/entities/failure.dart';
import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';

class GetAllPokemons {
  final PokemonRepository repository;

  GetAllPokemons(this.repository);

  Future<Either<Faiulure, List<Pokemon>>> call() async {
    return await repository.getAll();
  }
}
