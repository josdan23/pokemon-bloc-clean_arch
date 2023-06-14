import 'package:http/http.dart' as http;
import 'package:pokemon/data/models/all_pokemon_response.dart';

class PokemonRemoteDataSource {
  final http.Client client;

  PokemonRemoteDataSource({required this.client});

  Future<AllPokemonsResponse> fetchAllPokemons(
      [int offset = 0, int limit = 100]) async {
    final response = await client.get(Uri.parse(
        "https://pokeapi.co/api/v2/poksdemon/?offset=${offset}&limit=${limit}"));

    if (response.statusCode != 200) {
      throw Exception("fallo el server");
    }

    return AllPokemonsResponse.fromRawJson(response.body);
  }
}
