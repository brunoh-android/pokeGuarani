import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:poke_guarani/src/data/hive/favorites_hive.dart';
import 'package:poke_guarani/src/data/repository/box.dart';
import 'package:poke_guarani/src/utils/services/utils_service.dart';

import '../controllers/home_controller.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final homeController = Get.find<HomeController>();
  final UtilsService utilsService = UtilsService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leadingWidth: 90,
        elevation: 0,
        backgroundColor: Colors.red,
        title: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Pokemon 1010",
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
        toolbarHeight: 100,
      ),
      body: Column(
        children: [
          SizedBox(height: 10.h),
          ValueListenableBuilder<Box<FavoritesHive>>(
            valueListenable: Boxes.getData().listenable(),
            builder: (context, box, _) {
              var item = box.values.toList().cast<FavoritesHive>();
              return Expanded(
                child: GridView.builder(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 9 / 11.5),
                  itemCount: item.length,
                  itemBuilder: (_, index) {
                    return Stack(
                      children: [
                        Card(
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
                                    tag: item[index].name,
                                    child: Image.network(
                                      'https://projectpokemon.org/images/normal-sprite/${item[index].name}.gif',
                                    ),
                                  ),
                                ),
                                Text(
                                  utilsService.capitalize(item[index].name),
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: utilsService
                                            .getTypeColor(item[index].type)
                                            .withAlpha(220),
                                      ),
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 4.h, vertical: 2.w),
                                      child: Text(
                                        item[index].type,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 2.w),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey.shade200,
                                      ),
                                      padding: const EdgeInsets.all(8),
                                      child: Text(
                                        '${(item[index].weight)} Kg',
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
                        Positioned(
                          top: 4.sp,
                          right: 4.sp,
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(15),
                              topRight: Radius.circular(20),
                            ),
                            child: Material(
                              child: InkWell(
                                onTap: () {
                                  showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        content: Text(
                                          'Remover ${utilsService.capitalize(item[index].name)} dos favoritos?',
                                          style: TextStyle(fontSize: 20.sp),
                                        ),
                                        actions: [
                                          TextButton(
                                            child: const Text('Cancelar'),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                          ),
                                          TextButton(
                                            child: const Text('Excluir'),
                                            onPressed: () {
                                              homeController
                                                  .delete(item[index]);
                                              Navigator.of(context).pop();
                                              homeController.refreshQty();
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Ink(
                                  height: 30.h,
                                  width: 35.w,
                                  decoration:
                                      const BoxDecoration(color: Colors.red),
                                  child: Icon(
                                    Icons.delete,
                                    color: Colors.black,
                                    size: 20.sp,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
