import 'package:flutter/material.dart';
import 'package:news_app/UI/home/category_details/news/news_items.dart';
import 'package:news_app/api/api_manger.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/new_response.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/utlis/app_colors.dart';

class NewsWidget extends StatelessWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return FutureBuilder<NewResponse?>(
      future: ApiManger.getNewsBySourceId(source.id ?? ''),
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
                  ApiManger.getNewsBySourceId(source.id ?? '');
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
                  ApiManger.getNewsBySourceId(source.id ?? '');
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        }
        var newsList = snapshot.data?.articles ?? [];
        return ListView.separated(
          itemBuilder: (context, index) {
            return NewsItems(news: newsList[index]);
          },
          itemCount: newsList.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: height * 0.02);
          },
        );
      },
    );
  }
}
