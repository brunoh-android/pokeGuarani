import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:poke_guarani/src/utils/services/utils_service.dart';

import '../../domain/model/pokemon_details_model.dart';

class CustomLineChart extends StatelessWidget {
  final String title;
  final int value;
  final PokemonDetails item;

  CustomLineChart(
      {super.key,
      required this.title,
      required this.value,
      required this.item});

  final UtilsService utilsService = UtilsService();

  @override
  Widget build(BuildContext context) {
    double widthFactor = value <= 100.0 ? value / 100.0 : value / 200.0;
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 16.h),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: Colors.grey),
          ),
          SizedBox(width: 15.w),
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Container(
                  height: 4.h,
                  color: Colors.grey[300],
                ),
                FractionallySizedBox(
                  widthFactor: widthFactor,
                  child: Container(
                    height: 4.h,
                    color: utilsService
                        .getTypeColor(item.types![0].type.name)
                        .withAlpha(220),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 15.w),
          Text(
            '$value',
            style: TextStyle(
              fontSize: 22.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
