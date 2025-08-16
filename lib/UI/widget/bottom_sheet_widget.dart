import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/UI/home/article_webview.dart';
import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/new_response.dart';
import 'package:news_app/utlis/app_colors.dart';

class BottomSheetWidget extends StatelessWidget {
  final News news;
  const BottomSheetWidget({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Container(
      color: Theme.of(context).tabBarTheme.indicatorColor,
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.02,
        vertical: height * 0.02,
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(width * 0.04),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              placeholder: (context, url) => Center(
                child: CircularProgressIndicator(
                  padding: EdgeInsets.symmetric(
                    horizontal: width * 0.01,
                    vertical: height * 0.01,
                  ),
                  backgroundColor: AppColors.greyColor,
                ),
              ),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          SizedBox(height: height * 0.01),
          Text(
            news.content ?? '',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                elevation: 0,
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(width * 0.03),
                ),
              ),
              onPressed: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleWebview(
                      url: news.url ?? '',
                      title: news.title ?? '',
                    ),
                  ),
                );
              },
              child: Text(
                AppLocalizations.of(context)!.view_articel,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ),
          ),
          SizedBox(height: height * 0.01),
        ],
      ),
    );
  }
}
