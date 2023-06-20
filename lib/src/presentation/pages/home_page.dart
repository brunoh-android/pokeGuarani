import 'package:add_to_cart_animation/add_to_cart_animation.dart';
import 'package:add_to_cart_animation/add_to_cart_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/state_manager.dart';

import '../controllers/home_controller.dart';
import '../widgets/custom_shimmer.dart';
import '../widgets/item_tile.dart';
import 'favorites_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey<CartIconKey> globalKeyPokemonFavorite = GlobalKey<CartIconKey>();
  late Function(GlobalKey) runAddToFavoriteAnimation;
  final searchController = TextEditingController();

  void itemSelectedPokemonAnimation(GlobalKey gkImage) {
    runAddToFavoriteAnimation(gkImage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Transform(
          alignment: Alignment.center,
          transform: Matrix4.rotationY(3.14),
          child: Image.asset(
            'assets/charizard.gif',
            fit: BoxFit.fill,
          ),
        ),
        leadingWidth: 90,
        elevation: 0,
        backgroundColor: Colors.red,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "PokeGuarani",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(width: 10.w),
            Image.asset(
              'assets/logo.png',
              height: 54.h,
              width: 54.w,
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(top: 15.h, right: 15.w),
            child: GetBuilder<HomeController>(
              builder: (controller) => GestureDetector(
                onTap: () {},
                child: Badge(
                  backgroundColor: Colors.black,
                  label: Text(
                    '${controller.box}',
                    style: TextStyle(color: Colors.white, fontSize: 12.sp),
                  ),
                  child: IconButton(
                    onPressed: () {
                      Get.to(() => const FavoritesPage());
                    },
                    icon: AddToCartIcon(
                      key: globalKeyPokemonFavorite,
                      icon: Icon(
                        Icons.favorite,
                        size: 35.sp,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
        toolbarHeight: 110.h,
      ),
      body: AddToCartAnimation(
        gkCart: globalKeyPokemonFavorite,
        previewDuration: const Duration(milliseconds: 100),
        previewCurve: Curves.ease,
        receiveCreateAddToCardAnimationMethod: (addToCardAnimationMethod) {
          runAddToFavoriteAnimation = addToCardAnimationMethod;
        },
        child: Column(
          children: [
            SizedBox(height: 10.h),
            GetBuilder<HomeController>(
              builder: (controller) {
                return Expanded(
                  child: !controller.isPokemonLoading
                      ? Visibility(
                          replacement: Column(
                            children: [
                              Icon(
                                Icons.search_off,
                                size: 40.sp,
                                color: Colors.red,
                              ),
                              const Text('Não há itens para apresentar')
                            ],
                          ),
                          child: GridView.builder(
                              padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 2,
                                      mainAxisSpacing: 10,
                                      crossAxisSpacing: 10,
                                      childAspectRatio: 9 / 11.5),
                              itemCount: controller.pokemonDetails.length,
                              itemBuilder: (_, index) {
                                if ((index + 3) ==
                                    controller.pokemonDetails.length) {
                                  controller.getAllPokemon(loadMore: true);
                                }

                                return ItemTile(
                                    item: controller.pokemonDetails[index],
                                    cartAnimationMethod:
                                        itemSelectedPokemonAnimation);
                              }),
                        )
                      : GridView.count(
                          padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                          childAspectRatio: 9 / 11.5,
                          children: List.generate(
                            6,
                            (index) => CustomShimmer(
                              height: double.infinity,
                              width: double.infinity,
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
