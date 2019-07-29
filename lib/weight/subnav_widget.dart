import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/utils/widget_utils.dart';
import 'package:flutter_trip/weight/web_view.dart';

//首页球区入口
class SubNavWidget extends StatelessWidget {
  final List<CommonModel> subNavList;

  const SubNavWidget({Key key, this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: EdgeInsets.all(7),
        child: _buildItems(context),
      ),
    );
  }

  //生成四个按钮
  _buildItems(context) {
    var separate = (subNavList?.length ?? 0 + 0.5) / 2;

    return Column(
      children: <Widget>[
        Row(
          children: subNavList
                  ?.sublist(0, separate.toInt())
                  ?.map((item) => _buildItem(context, item))
                  ?.toList() ??
              [],
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
        ),
        Padding(
          padding: EdgeInsets.only(top: 10),
          child: Row(
            children: subNavList
                    ?.sublist(separate.toInt(), subNavList.length)
                    ?.map((item) => _buildItem(context, item))
                    ?.toList() ??
                [],
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          ),
        )
      ],
    );
  }

  Widget _buildItem(BuildContext context, CommonModel itemModel) {
    return Expanded(
        flex: 1,
        child: warpJumpWebView(
            context,
            Column(
              children: <Widget>[
                Image.network(
                  itemModel.icon,
                  height: 18,
                  width: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    itemModel.title,
                    style: TextStyle(fontSize: 12),
                  ),
                ),
              ],
              //设置内容居中
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
            itemModel));
  }
}
