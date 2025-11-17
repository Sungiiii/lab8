import 'package:flutter/material.dart';
import 'package:lab8/constants/colors.dart';
class AppTextStyles{

  static final TextStyle px16yellow = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.bold,
    color: AppColors.secondary,
    fontSize: 16,
  );

  static final TextStyle supersmall = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
    color: AppColors.gray,
    fontSize: 14,
  );

  static final TextStyle px12blue = TextStyle(
    fontFamily: "Montserrat",
    fontWeight: FontWeight.w400,
    color: AppColors.Azure,
    fontSize: 12,
  );

  static final TextStyle normal = TextStyle(
    fontFamily: "Times New Roman",
    fontWeight: FontWeight.w400,
    color: AppColors.Indigo,
    fontSize: 14,
  );
}
