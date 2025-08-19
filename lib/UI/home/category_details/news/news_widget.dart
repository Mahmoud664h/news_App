import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/home/category_details/cubit/news_state.dart';
import 'package:news_app/UI/home/category_details/cubit/news_view_modal.dart';
import 'package:news_app/UI/home/category_details/news/news_items.dart';

import 'package:news_app/model/source.dart';
import 'package:news_app/utlis/app_colors.dart';

class NewsWidget extends StatelessWidget {
  final Source source;
  const NewsWidget({super.key, required this.source});

  @override
  Widget build(BuildContext context) {
    NewsViewModal viewModal = NewsViewModal();
    var height = MediaQuery.of(context).size.height;
    viewModal.getSourcesBuId(source.id ?? '');
    return BlocBuilder<NewsViewModal, NewsState>(
      bloc: viewModal,
      builder: (context, state) {
        if (state is NewsErrorState) {
          return Column(
            children: [
              Text(
                state.errorMessage,
                style: Theme.of(context).textTheme.labelMedium,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.greyColor,
                ),
                onPressed: () {
                  viewModal.getSourcesBuId(source.id ?? '');
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        } else if (state is NewsSuccessState) {
          return ListView.separated(
            itemBuilder: (context, index) {
              return NewsItems(news: state.newsList[index]);
            },
            itemCount: state.newsList.length,
            separatorBuilder: (BuildContext context, int index) {
              return SizedBox(height: height * 0.02);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        }
      },
    );
  }
}
