// ignore_for_file: depend_on_referenced_packages

import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

import '../../data/hive/favorites_hive.dart';
import '../../data/repository/box.dart';
import '../../domain/model/pokemon_details_model.dart';
import '../../domain/model/pokemon_list_model.dart';
import '../../domain/repository/home_repository.dart';
import '../../domain/result/home_result.dart';
import '../../utils/services/utils_service.dart';

class HomeController extends GetxController {
  final homeRepository = HomeRepository();
  final utilsService = UtilsService();
  ConnectivityResult? connectivityResult;

  RxInt box = 0.obs;

  bool isPokemonLoading = true;
  bool noNetWork = false;
  List<PokemonDetails> pokemonDetails = [];
  List<PokemonModel> get allPokemon => currentPokemon?.results ?? [];
  PokemonListModel? currentPokemon;

  int itemsPerPage = 5;

  @override
  void onInit() {
    super.onInit();

    checkConnectivity();
    refreshQty();
  }

  Future<void> checkConnectivity() async {
    var connectivity = Connectivity();
    connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.wifi ||
        connectivityResult == ConnectivityResult.ethernet || connectivityResult == ConnectivityResult.mobile) {
      getAllPokemon();
    } else {
      noNetWork = true;
    }
    refreshQty();
  }

  Future<void> getAllPokemon({bool loadMore = false}) async {
    int newValue = loadMore ? 10 : 0;
    HomeResult<PokemonDetails> pokemonResult =
        await homeRepository.getAllPokemon(newValue: newValue);
    isPokemonLoading = false;

    pokemonResult.when(success: (data) {
      final newItems = data.where((newItem) =>
          !pokemonDetails.any((existingItem) => existingItem.id == newItem.id));
      pokemonDetails.addAll(newItems);
      update();
    }, error: (message) {
      utilsService.showToast(message: message, isError: true);
    });
  }

  void setLoading(bool value) {
    isPokemonLoading = value;

    update();
  }

  void refreshQty() {
    box = Boxes.getData().length.obs;
    update();
  }

  void delete(FavoritesHive item) async {
    await item.delete();
  }
}
