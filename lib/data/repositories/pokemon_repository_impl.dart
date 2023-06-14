import 'package:dartz/dartz.dart';
import 'package:pokemon/data/data_source/pokemon_remote_datasource.dart';
import 'package:pokemon/domain/entities/failure.dart';
import 'package:pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonRemoteDataSource dataSource;

  PokemonRepositoryImpl({required this.dataSource});

  @override
  Future<Either<Faiulure, List<Pokemon>>> getAll(
      [int offset = 0, int limit = 100]) async {
    try {
      final response = await dataSource.fetchAllPokemons(offset, limit);
      return right(response.toDomain());
    } on Exception {
      return left(Faiulure(message: "fallo la obtención de datos"));
    }
  }
}
