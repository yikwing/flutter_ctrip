import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/widget/webview.dart';

class NavToWeb extends StatelessWidget {
  final Widget child;
  final String url;
  final String statusBarColor;
  final String title;
  final bool hideAppBar;
  final bool backForbid;

  NavToWeb(
      {Key key,
      this.child,
      @required this.url,
      this.statusBarColor,
      this.title,
      this.hideAppBar,
      this.backForbid = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (build) => Webview(
                  url: url,
                ),
          ),
        );
      },
      child: child,
    );
  }
}
