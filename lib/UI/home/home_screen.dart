import 'package:flutter/material.dart';
import 'package:news_app/UI/home/category_details/Source/source_details.dart';
import 'package:news_app/UI/home/category_fragment/category_fragment.dart';
import 'package:news_app/UI/home/drawer/home_drawer.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          selectedCategory == null
              ? AppLocalizations.of(context)!.home
              : selectedCategory!.categoryName,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      drawer: Drawer(child: HomeDrawer(goHomeClick: goHomeClick)),
      body: selectedCategory == null
          ? CategoryFragment(onCategoryItemClick: onCategoryItemClick)
          : CategoryDetails(category: selectedCategory!),
    );
  }

  CategoryModel? selectedCategory;

  void onCategoryItemClick(CategoryModel newSelectedCategory) {
    selectedCategory = newSelectedCategory;
    setState(() {});
  }

  void goHomeClick() {
    selectedCategory = null;
    Navigator.pop(context);
    setState(() {});
  }
}
