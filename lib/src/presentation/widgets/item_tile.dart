import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:poke_guarani/src/config/router/app_pages_router.dart';
import 'package:poke_guarani/src/data/hive/favorites_hive.dart';

import '../../data/repository/box.dart';
import '../../domain/model/pokemon_details_model.dart';
import '../../utils/services/utils_service.dart';
import '../controllers/home_controller.dart';

class ItemTile extends StatefulWidget {
  final PokemonDetails item;
  final void Function(GlobalKey) cartAnimationMethod;

  const ItemTile(
      {super.key, required this.item, required this.cartAnimationMethod});

  @override
  State<ItemTile> createState() => _ItemTileState();
}

class _ItemTileState extends State<ItemTile> {
  final GlobalKey imageGk = GlobalKey();

  final UtilsService utilsService = UtilsService();
  final homeController = Get.find<HomeController>();

  bool intToDouble(int value) {
    return value != 0;
  }

  bool isItemSaved(int itemId) {
    final box = Boxes.getData();
    final savedItems = box.values.cast<FavoritesHive>().toList();

    return savedItems.any((item) => item.id == itemId);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () {
            Get.toNamed(PagesRoutes.infoRoute, arguments: widget.item);
          },
          child: Card(
            elevation: 1,
            shadowColor: Colors.grey.shade300,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: Hero(
                      tag: widget.item.name ?? 'Nome indesponivel',
                      child: Image.network(
                        'https://projectpokemon.org/images/normal-sprite/${widget.item.name}.gif',
                        errorBuilder: (BuildContext context, Object exception,
                            StackTrace? stackTrace) {
                          return Image.network(
                              widget.item.sprites!.frontDefault);
                        },
                        key: imageGk,
                      ),
                    ),
                  ),
                  Text(
                    utilsService
                        .capitalize(widget.item.name ?? 'Nome indesponivel'),
                    style:  TextStyle(
                        fontSize: 18.sp, fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: utilsService
                              .getTypeColor(widget.item.types![0].type.name)
                              .withAlpha(220),
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 4, vertical: 2),
                        child: Text(
                          widget.item.types![0].type.name,
                          style:  TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                      const SizedBox(width: 2),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey.shade200,
                        ),
                        padding: const EdgeInsets.all(8),
                        child: Text(
                          '${(widget.item.weight! / 10)} Kg',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12.sp,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(
          top: 4,
          right: 4,
          child: ClipRRect(
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(15),
              topRight: Radius.circular(20),
            ),
            child: Material(
              child: InkWell(
                onTap: () {
                  if (!isItemSaved(widget.item.id!)) {
                    final data = FavoritesHive(
                        id: widget.item.id!,
                        name: widget.item.name!,
                        img:
                            'https://projectpokemon.org/images/normal-sprite/${widget.item.name}.gif',
                        type: widget.item.types![0].type.name,
                        weight: widget.item.weight! / 10);

                    final box = Boxes.getData();
                    box.add(data);
                    data.save;
                    homeController.refreshQty();
                    widget.cartAnimationMethod(imageGk);
                  } else {
                    utilsService.showToast(
                        message: 'Pokemon ja está favoritado');
                  }
                },
                child: Ink(
                  height: 30,
                  width: 35,
                  decoration: const BoxDecoration(color: Colors.red),
                  child: const Icon(
                    Icons.favorite_border,
                    color: Colors.white,
                    size: 20,
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
