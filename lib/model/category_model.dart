import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/utlis/assets_manager.dart';

class CategoryModel {
  String id;
  String categoryName;
  String imageUrl;
  CategoryModel({
    required this.id,
    required this.categoryName,
    required this.imageUrl,
  });
  static List<CategoryModel> getCategoryList(
    ThemeMode themeMode,
    BuildContext context,
  ) {
    return [
      CategoryModel(
        id: 'general',
        categoryName: AppLocalizations.of(context)!.general,
        imageUrl: themeMode == ThemeMode.dark
            ? AssetsManager.generalDark
            : AssetsManager.generalLight,
      ),
      CategoryModel(
        id: 'business',
        categoryName: AppLocalizations.of(context)!.business,
        imageUrl: themeMode == ThemeMode.dark
            ? AssetsManager.businessDark
            : AssetsManager.businessLight,
      ),
      CategoryModel(
        id: 'sports',
        categoryName: AppLocalizations.of(context)!.sports,
        imageUrl: themeMode == ThemeMode.dark
            ? AssetsManager.sportsDark
            : AssetsManager.sportsLight,
      ),
      CategoryModel(
        id: 'technology',
        categoryName: AppLocalizations.of(context)!.technology,
        imageUrl: themeMode == ThemeMode.dark
            ? AssetsManager.technologyDark
            : AssetsManager.technologyLight,
      ),
      CategoryModel(
        id: 'entertainment',
        categoryName: AppLocalizations.of(context)!.entertainment,
        imageUrl: themeMode == ThemeMode.dark
            ? AssetsManager.entertainmentDark
            : AssetsManager.entertainmentLight,
      ),
      CategoryModel(
        id: 'health',
        categoryName: AppLocalizations.of(context)!.health,
        imageUrl: themeMode == ThemeMode.dark
            ? AssetsManager.healthDark
            : AssetsManager.healthLight,
      ),

      CategoryModel(
        id: 'science',
        categoryName: AppLocalizations.of(context)!.science,
        imageUrl: themeMode == ThemeMode.dark
            ? AssetsManager.scienceDark
            : AssetsManager.scienceLight,
      ),
    ];
  }
}
