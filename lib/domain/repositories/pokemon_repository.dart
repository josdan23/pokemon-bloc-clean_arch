import 'package:dartz/dartz.dart';
import 'package:pokemon/domain/entities/failure.dart';
import 'package:pokemon/domain/entities/pokemon.dart';

abstract class PokemonRepository {
  Future<Either<Faiulure, List<Pokemon>>> getAll([int offset, int limit]);
}
