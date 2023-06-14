import 'dart:convert';

import 'package:pokemon/domain/entities/pokemon.dart';

class AllPokemonsResponse {
  int count;
  String next;
  dynamic previous;
  List<Result> results;

  AllPokemonsResponse({
    required this.count,
    required this.next,
    this.previous,
    required this.results,
  });

  factory AllPokemonsResponse.fromRawJson(String str) =>
      AllPokemonsResponse.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AllPokemonsResponse.fromJson(Map<String, dynamic> json) =>
      AllPokemonsResponse(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results:
            List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
      };

  List<Pokemon> toDomain() {
    return results.map((e) => e.toDomain()).toList();
  }
}

class Result {
  String name;
  String url;

  Result({
    required this.name,
    required this.url,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        name: json["name"],
        url: json["url"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
      };

  Pokemon toDomain() {
    return Pokemon(idPokemon: url, name: name);
  }
}
