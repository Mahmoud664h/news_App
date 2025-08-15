import 'package:flutter/material.dart';
import 'package:news_app/UI/widget/category_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:provider/provider.dart';

typedef OnCategoryItemClick = void Function(CategoryModel category);

class CategoryFragment extends StatelessWidget {
  final OnCategoryItemClick onCategoryItemClick;
  const CategoryFragment({super.key, required this.onCategoryItemClick});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    var languageProvider = Provider.of<AppLanguageProvider>(context);
    List<CategoryModel> categoryList = CategoryModel.getCategoryList(
      themeProvider.themeMode,
      context,
    );
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * 0.02),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            AppLocalizations.of(context)!.good_morning,
            style: Theme.of(context).textTheme.headlineMedium,
          ),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    onCategoryItemClick(categoryList[index]);
                  },
                  child: CategoryItem(
                    categoryModel: categoryList[index],
                    index: index,
                    appLanguage: languageProvider.appLanguage,
                  ),
                );
              },

              separatorBuilder: (BuildContext context, int index) {
                return SizedBox(height: height * 0.01);
              },
              itemCount: categoryList.length,
            ),
          ),
        ],
      ),
    );
  }
}
