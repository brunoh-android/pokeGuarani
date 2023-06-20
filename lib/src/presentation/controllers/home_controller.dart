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

  RxInt box = 0.obs;

  bool isPokemonLoading = true;
  List<PokemonDetails> pokemonDetails = [];
  List<PokemonModel> get allPokemon => currentPokemon?.results ?? [];
  PokemonListModel? currentPokemon;

  int itemsPerPage = 5;

  @override
  void onInit() {
    super.onInit();

    getAllPokemon();
    refreshQty();
  }

  Future<void> getAllPokemon({bool loadMore = false}) async {
    int newValue = loadMore ? 5 : 0;
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
