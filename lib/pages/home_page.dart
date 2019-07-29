import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/dao/homd_dao.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/weight/banner_widget.dart';
import 'package:flutter_trip/weight/girdnav_widget.dart';
import 'package:flutter_trip/weight/loadding_widget.dart';
import 'package:flutter_trip/weight/local_nav_widget.dart';
import 'package:flutter_trip/weight/sales_box_widget.dart';
import 'package:flutter_trip/weight/subnav_widget.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  var SCROLL_ALPHA_OFFSET = 100;
  var _appbarAlpha = 0.0; //Appbar 透明度

  //球区入口数据
  var localNavListData;
  var gridNavData;
  var subNavData;
  var salesBoxData;
  var bannerListData;

  var _isLoading = true; //是否正在加载

  Future<Null> loadData() async {
    HomeDao.fatch().then((value) {
      setState(() {
        localNavListData = value.localNavList;
        gridNavData = value.gridNav;
        subNavData = value.subNavList;
        salesBoxData = value.salesBox;
        bannerListData = value.bannerList;
        _isLoading = false;
      });
    }).catchError((e) {
      setState(() {
        _isLoading = false;
      });
    });

    return null;
  }

  //滑动回调函数
  void _onScroll(double pixels) {
    var alpha = pixels / 100;
    if (alpha < 0) {
      alpha = 0;
    } else if (alpha > 1) {
      alpha = 1;
    }

    setState(() {
      _appbarAlpha = alpha;
    });
  }

  @override
  void initState() {
    super.initState();
    //首次延迟2秒钟，显示加载效果
    Future.delayed(Duration(milliseconds: 2000), () {
      loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfff2f2f2),
        body: Center(
            child: LoadingWidget(
                isLoading: _isLoading,
                contentWidget: Stack(
                  children: <Widget>[
                    //内容布局
                    MediaQuery.removePadding(
                      removeTop: true,
                      context: context,
                      //监听滑动通知
                      child: NotificationListener(
                        onNotification: (scrollNotification) {
                          //子view滑动回调
                          if (scrollNotification is ScrollUpdateNotification &&
                              scrollNotification.depth == 0) {
                            _onScroll(scrollNotification.metrics.pixels);
                          }
                        },
                        child: RefreshIndicator(
                          child: _buildBody,
                          onRefresh: loadData,
                        ),
                      ),
                    ),
                    //自定义appbar
                    _buildAppBar,
                  ],
                ))));
  }

  Widget get _buildAppBar => Opacity(
        opacity: _appbarAlpha,
        child: Container(
          height: 100,
          decoration: BoxDecoration(color: Colors.white),
          child: Center(
            child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "首页",
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ),
      );

  Widget get _buildBody => ListView(
        children: <Widget>[
          BannerWidget(
            bannersData: bannerListData,
          ),
          //球区入口组件
          Padding(
            padding: EdgeInsets.fromLTRB(7, 4, 7, 4),
            child: LocalNavWidget(
              localNavList: localNavListData,
            ),
          ),
          //网格卡片布局
          Padding(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: GridNavWeight(
              gridNavModel: gridNavData,
            ),
          ),
          //活动入口
          Padding(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: SubNavWidget(
              subNavList: subNavData,
            ),
          ),
          //底部卡片
          Padding(
            padding: EdgeInsets.fromLTRB(7, 0, 7, 4),
            child: SalesBoxWidget(
              salesBoxData: salesBoxData,
            ),
          ),
        ],
      );
}
