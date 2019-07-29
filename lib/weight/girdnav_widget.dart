import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/gridnav_model.dart';
import 'package:flutter_trip/utils/widget_utils.dart';
import 'package:flutter_trip/utils/common_utils.dart';

class GridNavWeight extends StatelessWidget {
  final GridNavModel gridNavModel;

  const GridNavWeight({key, @required this.gridNavModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      child: Column(children: _genrateItems(context)),
      borderRadius: BorderRadius.all(Radius.circular(10)),
      clipBehavior: Clip.antiAlias,
    );
  }

  //生成
  _genrateItems(BuildContext context) {
    List<Widget> items = [];

    if (gridNavModel == null) {
      return items;
    }

    //添加酒店items
    if (gridNavModel.hotel != null) {
      items.add(_gridNavItem(context, gridNavModel.hotel, true));
    }
    //添加机票items
    if (gridNavModel.flight != null) {
      items.add(_gridNavItem(context, gridNavModel.flight, false));
    }
    //添加旅游items
    if (gridNavModel.travel != null) {
      items.add(_gridNavItem(context, gridNavModel.travel, false));
    }

    return items;
  }

  _gridNavItem(BuildContext context, GridNavItem navItem, bool isFirst) {
    return Container(
      height: 88,
      margin: isFirst ? null : EdgeInsets.only(top: 3),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          parseColorStr(navItem.startColor),
          parseColorStr(navItem.endColor)
        ]),
      ),
      child: Row(
        children: <Widget>[
          //最前面的一个大的item
          Expanded(
            child: _mainItem(context, navItem.mainItem),
            flex: 1,
          ),
          //中间的两个分割的item
          Expanded(
            child: _doubleItem(context, navItem.item1, navItem.item2),
            flex: 1,
          ),
          //最后面的两个分割的item
          Expanded(
            child: _doubleItem(context, navItem.item3, navItem.item4),
            flex: 1,
          )
        ],
      ),
    );
  }

  //生成大的item
  _mainItem(BuildContext context, CommonModel itemModel) {
    return warpJumpWebView(
        context,
        Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image.network(
              itemModel.icon,
              width: 121,
              height: 88,
              alignment: AlignmentDirectional.bottomEnd,
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Text(
                itemModel.title,
                style: TextStyle(fontSize: 14, color: Colors.white),
              ),
            )
          ],
        ),
        itemModel);
  }

  _doubleItem(
      BuildContext context, CommonModel topModel, CommonModel bottomModel) {
    return Column(
      children: <Widget>[
        Expanded(child: _item(context, topModel, true)),
        Expanded(child: _item(context, bottomModel, false)),
      ],
    );
  }

  ///
  /// 绘制小的item
  /// isFirst 是否是第一个，是第一个设置一下底部的间距
  ///
  _item(BuildContext context, CommonModel itemModel, bool isFirst) {
    var borderSide = BorderSide(width: 0.8, color: Colors.white);

    return FractionallySizedBox(
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            left: borderSide,
            bottom: isFirst ? borderSide : BorderSide.none,
          ),
        ),
        child: warpJumpWebView(
            context,
            Center(
              child: Text(
                itemModel.title,
                style: TextStyle(color: Colors.white, fontSize: 14),
              ),
            ),
            itemModel),
      ),
    );
  }
}
