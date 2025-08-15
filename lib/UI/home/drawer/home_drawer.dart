import 'package:flutter/material.dart';
import 'package:news_app/UI/widget/drop_list_item.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/providers/app_theme_provider.dart';
import 'package:news_app/utlis/app_colors.dart';
import 'package:news_app/utlis/app_styles.dart';
import 'package:provider/provider.dart';

class HomeDrawer extends StatefulWidget {
  final VoidCallback goHomeClick;
  const HomeDrawer({super.key, required this.goHomeClick});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  late AppLanguageProvider languageProvider;

  late AppThemeProvider themeProvider;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    themeProvider = Provider.of<AppThemeProvider>(context);
    languageProvider = Provider.of<AppLanguageProvider>(context);

    return Container(
      color: AppColors.blackColor,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              width: double.infinity,
              padding: EdgeInsets.symmetric(vertical: height * 0.1),
              color: AppColors.whiteColor,
              child: Center(
                child: Text('News App', style: AppStyles.bold24Black),
              ),
            ),
            SizedBox(height: height * 0.04),
            TextButton(
              onPressed: widget.goHomeClick,
              child: Row(
                children: [
                  Icon(
                    Icons.home_outlined,
                    color: AppColors.whiteColor,
                    size: width * 0.06,
                  ),
                  SizedBox(width: width * 0.01),
                  Text(
                    AppLocalizations.of(context)!.go_to_home,
                    style: AppStyles.bold20White,
                  ),
                ],
              ),
            ),
            SizedBox(height: height * 0.02),
            Divider(endIndent: width * 0.03, indent: width * 0.03),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                SizedBox(width: width * 0.03),
                Icon(
                  Icons.imagesearch_roller_outlined,
                  color: AppColors.whiteColor,
                  size: width * 0.06,
                ),
                SizedBox(width: width * 0.01),
                Text(
                  AppLocalizations.of(context)!.theme,
                  style: AppStyles.bold20White,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.02,
              ),
              child: DropListItem(
                items: [
                  AppLocalizations.of(context)!.light,
                  AppLocalizations.of(context)!.dark,
                ],
                selectedValue: currentthemeText,
                onChanged: changeSelectedTheme,
              ),
            ),
            SizedBox(height: height * 0.02),
            Divider(endIndent: width * 0.03, indent: width * 0.03),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                SizedBox(width: width * 0.03),
                Icon(
                  Icons.imagesearch_roller_outlined,
                  color: AppColors.whiteColor,
                  size: width * 0.06,
                ),
                SizedBox(width: width * 0.01),
                Text(
                  AppLocalizations.of(context)!.language,
                  style: AppStyles.bold20White,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: width * 0.03,
                vertical: height * 0.02,
              ),
              child: DropListItem(
                items: [
                  AppLocalizations.of(context)!.english,
                  AppLocalizations.of(context)!.arabic,
                ],
                selectedValue: currentLanguageText,
                onChanged: changeSelectedLanguage,
              ),
            ),
          ],
        ),
      ),
    );
  }

  String get currentthemeText {
    return themeProvider.themeMode == ThemeMode.light
        ? AppLocalizations.of(context)!.light
        : AppLocalizations.of(context)!.dark;
  }

  void changeSelectedTheme(newTheme) {
    newTheme == AppLocalizations.of(context)!.light
        ? themeProvider.changeThemeMode(ThemeMode.light)
        : themeProvider.changeThemeMode(ThemeMode.dark);
  }

  void changeSelectedLanguage(newlanguage) {
    newlanguage == AppLocalizations.of(context)!.english
        ? languageProvider.changeLanguage('en')
        : languageProvider.changeLanguage('ar');
  }

  String get currentLanguageText {
    return languageProvider.appLanguage == 'en'
        ? AppLocalizations.of(context)!.english
        : AppLocalizations.of(context)!.arabic;
  }
}
