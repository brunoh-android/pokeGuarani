import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../domain/model/pokemon_details_model.dart';
import '../../utils/services/utils_service.dart';
import '../widgets/line_info.dart';

class InfoPage extends StatefulWidget {
  InfoPage({Key? key}) : super(key: key);
  final PokemonDetails item = Get.arguments;

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  final UtilsService utilsService = UtilsService();

  String formatId(int id) {
    if (id < 10) {
      return '00$id';
    } else if (id < 100) {
      return '0$id';
    } else {
      return id.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: utilsService
          .getTypeColor(widget.item.types![0].type.name)
          .withAlpha(220),
      body: Stack(
        children: [
          Column(children: [
            SizedBox(
              height: 250.h,
              child: Stack(
                children: [
                  AnimatedOpacity(
                    opacity: 0.2,
                    duration: const Duration(milliseconds: 500),
                    child: Image.asset(
                      'assets/pokeball.png',
                      fit: BoxFit.cover,
                      height: double.infinity,
                      width: double.infinity,
                    ),
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Hero(
                      tag: widget.item.sprites!.frontDefault,
                      child: Transform.scale(
                        scale: 1.1,
                        child: Image.network(
                            'https://assets.pokemon.com/assets/cms2/img/pokedex/full/${formatId(widget.item.id!)}.png'),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(32),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(50),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade600,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            utilsService.capitalize(widget.item.name!),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style:  TextStyle(
                                fontSize: 27.sp, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          '#${widget.item.id}',
                          style:  TextStyle(
                              fontSize: 23.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.red),
                        ),
                      ],
                    ),
                     SizedBox(height: 20.h),
                    CustomLineChart(
                      title: 'HP',
                      value: widget.item.stats![0].baseStat,
                      item: widget.item,
                    ),
                    CustomLineChart(
                      title: 'ATK',
                      value: widget.item.stats![1].baseStat,
                      item: widget.item,
                    ),
                    CustomLineChart(
                      title: 'DEF',
                      value: widget.item.stats![2].baseStat,
                      item: widget.item,
                    ),
                    CustomLineChart(
                      title: 'S.ATK',
                      value: widget.item.stats![3].baseStat,
                      item: widget.item,
                    ),
                    CustomLineChart(
                      title: 'S.DEF',
                      value: widget.item.stats![4].baseStat,
                      item: widget.item,
                    ),
                    CustomLineChart(
                      title: 'SPEED',
                      value: widget.item.stats![5].baseStat,
                      item: widget.item,
                    ),
                  ],
                ),
              ),
            ),
          ]),
          Positioned(
            left: 10.sp,
            top: 10.sp,
            child: SafeArea(
              child: IconButton(
                onPressed: () => Navigator.of(context).pop(),
                icon: const Icon(Icons.arrow_back),
              ),
            ),
          )
        ],
      ),
    );
  }
}
