import 'package:flutter/material.dart';
import 'package:news_app/utlis/app_colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ArticleWebview extends StatefulWidget {
  final String url;
  final String title;
  const ArticleWebview({super.key, required this.url, required this.title});

  @override
  State<ArticleWebview> createState() => _ArticleWebviewState();
}

class _ArticleWebviewState extends State<ArticleWebview> {
  late final WebViewController controller;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(() => isLoading = true);
          },
          onPageFinished: (url) {
            setState(() => isLoading = false);
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      body: Stack(
        children: [
          WebViewWidget(controller: controller),
          if (isLoading)
            Center(
              child: CircularProgressIndicator(color: AppColors.greyColor),
            ),
        ],
      ),
    );
  }
}
