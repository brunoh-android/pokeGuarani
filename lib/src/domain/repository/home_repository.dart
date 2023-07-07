import '../../utils/constants/endpoints.dart';
import '../model/pokemon_details_model.dart';
import '../result/home_result.dart';
import '../service/http_manager.dart';

class HomeRepository {
  final HttpManager _httpManager = HttpManager();

  int initialLimit = 10;
  int initialOffset = 0;

  Future<HomeResult<PokemonDetails>> getAllPokemon({int newValue = 0}) async {
    final result = await _httpManager.restRequest(
      url: Endpoints.listPokemon,
      method: HttpMethods.get,
      queryParameters: {
        'limit': initialLimit.toString(),
        'offset': initialOffset.toString(),
      },
    );

    if (result['results'] != null) {
      List<PokemonDetails> data = [];
      List<Future> futures = [];

      for (var pokemonData in result['results']) {
        Future pokemonFuture = _httpManager.restRequest(
          url: pokemonData['url'],
          method: HttpMethods.get,
        );
        futures.add(pokemonFuture);
      }

      List<dynamic> responses = await Future.wait(futures);

      for (var pokemonResponse in responses) {
        if (pokemonResponse is Map<String, dynamic>) {
          final pokemon = PokemonDetails.fromJson(pokemonResponse);
          data.add(pokemon);
        }
      }

      initialOffset += newValue;
      return HomeResult<PokemonDetails>.success(data);
    } else {
      return HomeResult.error(
        'Ocorreu um erro inesperado ao carregar os pokemons.',
      );
    }
  }
}
