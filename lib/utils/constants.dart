import 'package:flutter/material.dart';

/// App Basic Colors
const primaryDarkBrown = Color(0xff7f5539);
const secondaryDarkBrown = Color(0xffb08968);
const primaryLightBrown = Color(0xffddb892);
const primaryCreamWhite = Color(0xffede0d4);
const secondaryCreamWhite = Color(0xffe6ccb2);

const primaryWhite = Colors.white;
const primaryBlack = Colors.black;

/// App basic textformfield decorations
OutlineInputBorder normalBorderDec = OutlineInputBorder(
    borderSide: const BorderSide(
        color: secondaryDarkBrown,
      width: 1.2
    ),
  borderRadius: textFormFieldRadius
);

OutlineInputBorder errorBorderDec = OutlineInputBorder(
  borderSide: const BorderSide(
      color: Colors.red,
      width: 1.2
  ),
  borderRadius: textFormFieldRadius
);

/// App border radius constants
BorderRadius textFormFieldRadius = BorderRadius.circular(15);
BorderRadius buttonsRadius = BorderRadius.circular(12);

/// App loading states
enum LoadingState {initial, loading, success, complete, failed}

/// App Base URL(s)
const devBaseURL = 'https://localhost:3000/';