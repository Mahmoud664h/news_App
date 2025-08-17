import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/UI/home/category_details/Source/source_tab_widget.dart';
import 'package:news_app/UI/home/category_details/cubit/source_state.dart';
import 'package:news_app/UI/home/category_details/cubit/source_view_model.dart';

import 'package:news_app/l10n/app_localizations.dart';
import 'package:news_app/model/category_model.dart';

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
  SourceViewModel viewModel = SourceViewModel();
  late AppLanguageProvider applanguage;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final applanguage = Provider.of<AppLanguageProvider>(context);
    viewModel.getSources(widget.category.id, applanguage.appLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SourceViewModel, SourcesState>(
      bloc: viewModel,
      builder: (context, state) {
        if (state is SourceErrorState) {
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
                  viewModel.getSources(
                    widget.category.id,
                    applanguage.appLanguage,
                  );
                },
                child: Text(
                  'Try Again',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
              ),
            ],
          );
        } else if (state is SourceSuccessState) {
          return state.sourcesList.isEmpty
              ? Center(
                  child: Text(
                    AppLocalizations.of(context)!.no_news,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                )
              : SourceTabWidget(sourcesList: state.sourcesList);
        } else {
          return Center(
            child: CircularProgressIndicator(color: AppColors.greyColor),
          );
        }
      },
    );
  }
}
