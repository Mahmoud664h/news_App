import 'package:flutter/material.dart';
import 'package:news_app/UI/home/category_details/Source/source_tab_widget.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/model/source_response.dart';
import 'package:news_app/providers/app_language_provider.dart';
import 'package:news_app/utlis/app_colors.dart';

import 'package:provider/provider.dart';

class CategoryDetails extends StatefulWidget {
  final CategoryModel category;
  const CategoryDetails({super.key, required this.category});

  @override
  State<CategoryDetails> createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  @override
  Widget build(BuildContext context) {
    var applanguage = Provider.of<AppLanguageProvider>(context);
    return FutureBuilder<SourceResponse?>(
      future: ApiManger.getSources(widget.category.id, applanguage.appLanguage),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        } else if (snapshot.hasError) {
          return Column(
            children: [
              Text(
                AppLocalizations.of(context)!.something_went_wrong,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
                onPressed: () {
                  setState(() {
                    ApiManger.getSources(
                      widget.category.id,
                      applanguage.appLanguage,
                    );
                  });
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        if (snapshot.data?.status != 'ok') {
          return Column(
            children: [
              Text(
                snapshot.data!.message!,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
                onPressed: () {
                  setState(() {
                    ApiManger.getSources(
                      widget.category.id,
                      applanguage.appLanguage,
                    );
                  });
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        var sourcesList = snapshot.data?.sources ?? [];
        return sourcesList.isEmpty
            ? Center(
                child: Text(
                  AppLocalizations.of(context)!.no_news,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              )
            : SourceTabWidget(sourcesList: sourcesList);
      },
    );
  }
}
