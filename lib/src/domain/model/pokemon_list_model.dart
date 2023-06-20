import 'package:json_annotation/json_annotation.dart';

import 'pokemon_details_model.dart';

part 'pokemon_list_model.g.dart';

@JsonSerializable()
class PokemonListModel {
  int count;
  String? next;
  String? previous;
  List<PokemonModel> results;

  PokemonListModel({
    required this.count,
    this.next,
    this.previous,
    required this.results,
  });

  factory PokemonListModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonListModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonListModelToJson(this);
}
