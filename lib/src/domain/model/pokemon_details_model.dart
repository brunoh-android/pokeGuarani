import 'package:json_annotation/json_annotation.dart';

part 'pokemon_details_model.g.dart';

@JsonSerializable()
class PokemonModel {
  String name;
  String url;

  PokemonModel({
    required this.name,
    required this.url,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);

  @override
  String toString() => 'Pokemon(name: $name, url: $url)';
}

@JsonSerializable()
class PokemonDetails {
  List<Ability>? abilities;
  @JsonKey(name: 'base_experience')
  int baseExperience;
  List<Species>? forms;
  @JsonKey(name: 'game_indices')
  List<GameIndex>? gameIndices;
  int height;
  @JsonKey(name: 'held_items')
  List<dynamic>? heldItems;
  int? id;
  @JsonKey(name: 'is_default')
  bool? isDefault;
  @JsonKey(name: 'location_area_encounters')
  String? locationAreaEncounters;
  List<Move> moves;
  String? name;
  int? order;
  @JsonKey(name: 'past_abilities')
  List<dynamic>? pastAbilities;
  @JsonKey(name: 'past_types')
  List<dynamic>? pastTypes;
  Species? species;
  Sprites? sprites;
  List<Stat>? stats;
  List<Type>? types;
  int? weight;

  PokemonDetails({
    required this.abilities,
    required this.baseExperience,
    required this.forms,
    required this.gameIndices,
    required this.height,
    required this.heldItems,
    required this.id,
    required this.isDefault,
    required this.locationAreaEncounters,
    required this.moves,
    required this.name,
    required this.order,
    required this.pastAbilities,
    required this.pastTypes,
    required this.species,
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonDetails.fromJson(Map<String, dynamic> json) =>
      _$PokemonDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonDetailsToJson(this);
}

@JsonSerializable()
class Ability {
  Species ability;
  @JsonKey(name: 'is_hidden')
  bool isHidden;
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Species {
  String name;
  String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}

@JsonSerializable()
class GameIndex {
  @JsonKey(name: 'game_index')
  int gameIndex;
  Species version;

  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) =>
      _$GameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$GameIndexToJson(this);
}

@JsonSerializable()
class Move {
  Species move;
  @JsonKey(name: 'version_group_details')
  List<VersionGroupDetail> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@JsonSerializable()
class VersionGroupDetail {
  @JsonKey(name: 'level_learned_at')
  int levelLearnedAt;
  @JsonKey(name: 'move_learn_method')
  Species moveLearnMethod;
  @JsonKey(name: 'version_group')
  Species versionGroup;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupDetailToJson(this);
}

@JsonSerializable()
class GenerationV {
  @JsonKey(name: 'black-white')
  Sprites blackWhite;

  GenerationV({
    required this.blackWhite,
  });

  factory GenerationV.fromJson(Map<String, dynamic> json) =>
      _$GenerationVFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationVToJson(this);
}

@JsonSerializable()
class GenerationIv {
  @JsonKey(name: 'diamond-pearl')
  Sprites diamondPearl;
  @JsonKey(name: 'heartgold-soulsilver')
  Sprites heartgoldSoulsilver;
  Sprites platinum;

  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) =>
      _$GenerationIvFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIvToJson(this);
}

@JsonSerializable()
class Versions {
  @JsonKey(name: 'generation-i')
  GenerationI generationI;
  @JsonKey(name: 'generation-ii')
  GenerationIi generationIi;
  @JsonKey(name: 'generation-iii')
  GenerationIii generationIii;
  @JsonKey(name: 'generation-iv')
  GenerationIv generationIv;
  @JsonKey(name: 'generation-v')
  GenerationV generationV;
  @JsonKey(name: 'generation-vi')
  Map<String, Home> generationVi;
  @JsonKey(name: 'generation-vii')
  GenerationVii generationVii;
  @JsonKey(name: 'generation-viii')
  GenerationViii generationViii;

  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionsToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: 'back_default')
  String backDefault;
  @JsonKey(name: 'back_female')
  dynamic backFemale;
  @JsonKey(name: 'back_shiny')
  String backShiny;
  @JsonKey(name: 'back_shiny_female')
  dynamic backShinyFemale;
  @JsonKey(name: 'front_default')
  String frontDefault;
  @JsonKey(name: 'front_female')
  dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  String frontShiny;
  @JsonKey(name: 'front_shiny_female')
  dynamic frontShinyFemale;
  Other? other;
  Versions? versions;
  Sprites? animated;

  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class GenerationI {
  @JsonKey(name: 'red-blue')
  RedBlue redBlue;
  RedBlue yellow;

  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) =>
      _$GenerationIFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIToJson(this);
}

@JsonSerializable()
class RedBlue {
  @JsonKey(name: 'back_default')
  String backDefault;
  @JsonKey(name: 'back_gray')
  String backGray;
  @JsonKey(name: 'back_transparent')
  String backTransparent;
  @JsonKey(name: 'front_default')
  String frontDefault;
  @JsonKey(name: 'front_gray')
  String frontGray;
  @JsonKey(name: 'front_transparent')
  String frontTransparent;

  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) =>
      _$RedBlueFromJson(json);

  Map<String, dynamic> toJson() => _$RedBlueToJson(this);
}

@JsonSerializable()
class GenerationIi {
  Crystal crystal;
  Gold gold;
  Gold silver;

  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) =>
      _$GenerationIiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIiToJson(this);
}

@JsonSerializable()
class Crystal {
  @JsonKey(name: 'back_default')
  String backDefault;
  @JsonKey(name: 'back_shiny')
  String backShiny;
  @JsonKey(name: 'back_shiny_transparent')
  String backShinyTransparent;
  @JsonKey(name: 'back_transparent')
  String backTransparent;
  @JsonKey(name: 'front_default')
  String frontDefault;
  @JsonKey(name: 'front_shiny')
  String frontShiny;
  @JsonKey(name: 'front_shiny_transparent')
  String frontShinyTransparent;
  @JsonKey(name: 'front_transparent')
  String frontTransparent;

  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) =>
      _$CrystalFromJson(json);

  Map<String, dynamic> toJson() => _$CrystalToJson(this);
}

@JsonSerializable()
class Gold {
  @JsonKey(name: 'back_default')
  String backDefault;
  @JsonKey(name: 'back_shiny')
  String backShiny;
  @JsonKey(name: 'front_default')
  String frontDefault;
  @JsonKey(name: 'front_shiny')
  String frontShiny;
  @JsonKey(name: 'front_transparent')
  String? frontTransparent;

  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);

  Map<String, dynamic> toJson() => _$GoldToJson(this);
}

@JsonSerializable()
class GenerationIii {
  OfficialArtwork emerald;
  @JsonKey(name: 'firered-leafgreen')
  Gold fireredLeafgreen;
  @JsonKey(name: 'ruby-sapphire')
  Gold rubySapphire;

  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) =>
      _$GenerationIiiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIiiToJson(this);
}

@JsonSerializable()
class OfficialArtwork {
  @JsonKey(name: 'front_default')
  String frontDefault;
  @JsonKey(name: 'front_shiny')
  String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);
}

@JsonSerializable()
class Home {
  @JsonKey(name: 'front_default')
  String frontDefault;
  dynamic frontFemale;
  @JsonKey(name: 'front_shiny')
  String frontShiny;
  dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);
}

@JsonSerializable()
class GenerationVii {
  DreamWorld icons;
  @JsonKey(name: 'ultra-sun-ultra-moon')
  Home ultraSunUltraMoon;

  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromJson(Map<String, dynamic> json) =>
      _$GenerationViiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViiToJson(this);
}

@JsonSerializable()
class DreamWorld {
  @JsonKey(name: 'front_default')
  String frontDefault;
  dynamic frontFemale;

  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);
}

@JsonSerializable()
class GenerationViii {
  DreamWorld icons;

  GenerationViii({
    required this.icons,
  });

  factory GenerationViii.fromJson(Map<String, dynamic> json) =>
      _$GenerationViiiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViiiToJson(this);
}

@JsonSerializable()
class Other {
  @JsonKey(name: 'dream_world')
  DreamWorld dreamWorld;
  Home home;
  @JsonKey(name: 'official-artwork')
  OfficialArtwork officialArtwork;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}

@JsonSerializable()
class Stat {
  @JsonKey(name: 'base_stat')
  int baseStat;
  int effort;
  Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}

@JsonSerializable()
class Type {
  int slot;
  Species type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
