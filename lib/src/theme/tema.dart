import 'package:flutter/material.dart';

final theme = ThemeData.dark();
 
final myTheme = theme.copyWith(
  colorScheme: theme.colorScheme.copyWith(
    secondary: Colors.red,
  ),
);

