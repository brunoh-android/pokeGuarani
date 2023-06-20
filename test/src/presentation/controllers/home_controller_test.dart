import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:mockito/mockito.dart';
import 'package:poke_guarani/src/data/hive/favorites_hive.dart';
import 'package:poke_guarani/src/domain/repository/home_repository.dart';
import 'package:poke_guarani/src/presentation/controllers/home_controller.dart';
import 'package:poke_guarani/src/utils/services/utils_service.dart';

class MockHomeRepository extends Mock implements HomeRepository {}

class MockUtilsService extends Mock implements UtilsService {}

class MockRxInt extends Mock implements RxInt {}

void main() {
  late HomeController homeController;
  late MockRxInt mockRxInt;

  setUp(() {
    mockRxInt = MockRxInt();
    homeController = HomeController();
    homeController.box = mockRxInt;
  });

  group('HomeController', () {
    test('getAllPokemon success', () async {
      await homeController.getAllPokemon();
      expect(homeController.isPokemonLoading, false);
    });

    test('setLoading updates isPokemonLoading', () {
      homeController.setLoading(true);
      expect(homeController.isPokemonLoading, true);
      homeController.setLoading(false);
      expect(homeController.isPokemonLoading, false);
    });
  });
}

class MockFavoritesHive extends Mock implements FavoritesHive {}
