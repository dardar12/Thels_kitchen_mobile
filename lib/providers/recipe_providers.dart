import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';
import '../models/recipe.dart';

final languageProvider = StateProvider<AppLanguage>((ref) => AppLanguage.en);
final themeModeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);
final recipesProvider = Provider<List<Recipe>>((ref) => mockRecipes);
final selectedRecipeProvider = StateProvider<Recipe?>((ref) => null);
final audioLanguageProvider = StateProvider<AppLanguage>((ref) => AppLanguage.en);