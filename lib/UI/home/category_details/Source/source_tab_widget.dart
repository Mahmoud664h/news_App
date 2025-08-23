import 'package:flutter/material.dart';
import 'package:news_app/UI/home/category_details/Source/source_name.dart';
import 'package:news_app/UI/home/category_details/news/news_details.dart';
import 'package:news_app/model/source.dart';
import 'package:news_app/utlis/app_colors.dart';

class SourceTabWidget extends StatefulWidget {
  final List<Source> sourcesList;

  const SourceTabWidget({super.key, required this.sourcesList});

  @override
  State<SourceTabWidget> createState() => _SourceTabWidgetState();
}

class _SourceTabWidgetState extends State<SourceTabWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.sourcesList.length,
      child: Column(
        children: [
          TabBar(
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
            dividerColor: AppColors.transparentColor,
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            tabs: widget.sourcesList.map((source) {
              return SourceName(
                source: source,
                isSelected: selectedIndex == widget.sourcesList.indexOf(source),
              );
            }).toList(),
          ),

          Expanded(
            child: NewsDetails(source: widget.sourcesList[selectedIndex]),
          ),
        ],
      ),
    );
  }
}
