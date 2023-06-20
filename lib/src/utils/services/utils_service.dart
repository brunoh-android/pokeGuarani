import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class UtilsService {
  void showToast({required String message, bool isError = false}) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: isError ? Colors.red : Colors.white,
        textColor: isError ? Colors.white : Colors.black,
        fontSize: 14);
  }

  String capitalize(String input) {
    if (input.isEmpty) {
      return input;
    }
    return input[0].toUpperCase() + input.substring(1);
  }

  Color getTypeColor(String type) {
    switch (type) {
      case "fighting":
        return const Color(0xFFFA755A);
      case "flying":
        return const Color(0xFF79A4FF);
      case "poison":
        return const Color(0xFFA955DF);
      case "ground":
        return const Color(0xFFEECC55);
      case "rock":
        return const Color(0xFFC5B67E);
      case "bug":
        return const Color(0xFFC2D21F);
      case "ghost":
        return const Color(0xFF7975D7);
      case "steel":
        return const Color(0xFFC4C2DB);
      case "fire":
        return const Color(0xFFFA5543);
      case "water":
        return const Color(0xFF56AEFF);
      case "grass":
        return const Color(0xFF8CD750);
      case "electric":
        return const Color(0xFFFDE53C);
      case "psychic":
        return const Color(0xFFFF55A5);
      case "ice":
        return const Color(0xFF9BD8D8);
      case "dragon":
        return const Color(0xFF8A75FF);
      case "fairy":
        return const Color(0xFFFAADFF);
      case "dark":
        return const Color(0xFF8E6955);
      default:
        return const Color(0x00a9a9a9);
    }
  }
}
