import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/network/common_model.dart';
import 'package:flutter_xiecheng/model/network/grid_nav_model.dart';
import 'package:flutter_xiecheng/model/network/home_model.dart';
import 'package:flutter_xiecheng/model/network/sales_box_model.dart';
import 'package:flutter_xiecheng/utils/okhttp.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_xiecheng/widget/grid_nav.dart';
import 'package:flutter_xiecheng/widget/local_nav.dart';
import 'package:flutter_xiecheng/widget/sales_box.dart';
import 'package:flutter_xiecheng/widget/sub_nav.dart';

const APPBAR_SCROLL_OFFSET = 100;

class HomePage extends StatefulWidget {
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double appBarAlpha = 0;

  List<CommonModel> _bannerList = List();
  List<CommonModel> _localNavList = List();
  List<CommonModel> _subNavList = List();
  GridNavModel _gridNav;
  SalesBoxModel _salesBox;

  @override
  void initState() {
    super.initState();
    OkhttpUtil.get("http://www.devio.org/io/flutter_app/json/home_page.json",
        (data) {
      HomeModel homeModel = HomeModel.fromJson(data);
      setState(() {
        _bannerList = homeModel.bannerList;
        _localNavList = homeModel.localNavList;
        _subNavList = homeModel.subNavList;
        _gridNav = homeModel.gridNav;
        _salesBox = homeModel.salesBox;
      });
    });
  }

  _onScroll(offset) {
    double alpha = offset / APPBAR_SCROLL_OFFSET;
    if (alpha > 1) {
      alpha = 1;
    } else if (alpha < 0) {
      alpha = 0;
    }
    setState(() {
      appBarAlpha = alpha;
    });
    print(appBarAlpha);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.withOpacity(0.1),
      body: Stack(
        children: <Widget>[
          MediaQuery.removePadding(
            child: NotificationListener(
              onNotification: (scrollNotification) {
                if (scrollNotification is ScrollUpdateNotification &&
                    scrollNotification.depth == 0) {
                  _onScroll(scrollNotification.metrics.pixels);
                }
              },
              child: ListView(
                children: <Widget>[
                  Container(
                    height: 160,
                    child: Swiper(
                      autoplay: true,
                      itemCount: _bannerList.length,
                      itemBuilder: (context, index) {
                        return CachedNetworkImage(
                          imageUrl: _bannerList[index].icon,
                          fit: BoxFit.fill,
                        );
                      },
                      pagination: SwiperPagination(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
                    child: LocalNav(
                      localNavList: _localNavList,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                    child: GridNav(
                      gridNavModel: _gridNav,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                    child: SubNav(
                      subNavList: _subNavList,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
                    child: SalesBox(
                      salesBox: _salesBox,
                    ),
                  )
                ],
              ),
            ),
            context: context,
            removeTop: true,
          ),
          Opacity(
            child: Container(
              height: 80,
              color: Colors.red,
            ),
            opacity: appBarAlpha,
          ),
        ],
      ),
    );
  }
}
