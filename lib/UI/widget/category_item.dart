import 'package:flutter/material.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/utlis/app_colors.dart';

class CategoryItem extends StatelessWidget {
  final CategoryModel categoryModel;
  final int index;
  final String appLanguage;
  const CategoryItem({
    super.key,
    required this.categoryModel,
    required this.index,
    required this.appLanguage,
  });

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      alignment: index % 2 == 0 ? Alignment.bottomRight : Alignment.bottomLeft,
      height: height * 0.25,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(categoryModel.imageUrl),

          fit: BoxFit.fill,
        ),
        borderRadius: BorderRadius.circular(width * 0.06),
      ),
      child: Container(
        width: width * 0.42,
        padding: index % 2 == 0
            ? EdgeInsetsDirectional.only(start: width * 0.02)
            : EdgeInsetsDirectional.only(end: width * 0.02),
        margin: EdgeInsetsDirectional.symmetric(
          horizontal: width * 0.03,
          vertical: height * 0.045,
        ),

        decoration: BoxDecoration(
          color: AppColors.greyColor,
          borderRadius: BorderRadius.circular(width * 0.2),
        ),
        child: Row(
          textDirection: (appLanguage == 'en') == (index % 2 == 0)
              ? TextDirection.ltr
              : TextDirection.rtl,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.view_all,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            CircleAvatar(
              backgroundColor: Theme.of(context).primaryColor,
              child: Icon(
                index % 2 == 0 ? Icons.arrow_forward_ios : Icons.arrow_back_ios,
                color: Theme.of(context).tabBarTheme.indicatorColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
