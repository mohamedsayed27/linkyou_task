import 'package:flutter/material.dart';

class CustomThemes {

  static TextStyle whiteColorTextTheme(context) =>
      Theme.of(context).textTheme.headlineMedium!;

  static TextStyle darkGreyColorTextTheme(context) =>
      Theme.of(context).textTheme.headlineLarge!;

  static TextStyle grey71ColorTextTheme(context) =>
      Theme.of(context).textTheme.labelLarge!;

  static TextStyle primaryColorTextTheme(context) =>
      Theme.of(context).textTheme.titleSmall!;

}