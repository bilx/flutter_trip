import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/model/salesbox_model.dart';
import 'package:flutter_trip/utils/widget_utils.dart';
import 'package:flutter_trip/weight/web_view.dart';

//底部卡片
class SalesBoxWidget extends StatelessWidget {
  final SalesBoxModel salesBoxData;

  const SalesBoxWidget({Key key, this.salesBoxData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: _buildItems(context),
    );
  }

  _buildItems(context) {
    if (salesBoxData == null) {
      return Text("Error");
    }

    return Column(
      children: <Widget>[
        //顶部标题
        _buildTitle(context),
        //最上面两个大的卡片
        _buildDoubleCard(
          context,
          salesBoxData.bigCard1,
          salesBoxData.bigCard2,
          true,
          false,
        ),
        //中间两个卡片
        _buildDoubleCard(
          context,
          salesBoxData.smallCard1,
          salesBoxData.smallCard2,
          false,
          false,
        ),
        //最下面两个卡片
        _buildDoubleCard(
          context,
          salesBoxData.smallCard3,
          salesBoxData.smallCard4,
          false,
          true,
        ),
      ],
    );
  }

  //生成两个左右的item
  Widget _buildDoubleCard(BuildContext context, CommonModel leftCard,
      CommonModel rightCard, bool isBig, bool isLast) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        _buildItem(context, leftCard, true, isLast),
        _buildItem(context, rightCard, false, isLast),
      ],
    );
  }

  Widget _buildItem(
      BuildContext context, CommonModel itemModel, bool isLeft, bool isLast) {
    return Expanded(
        flex: 1,
        child: warpJumpWebView(
            context,
            Container(
              child: Image.network(
                itemModel.icon,
                fit: BoxFit.fill,
              ),
            ),
            itemModel));
  }

  //生成标题
  Widget _buildTitle(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Color(0xfff2f2f2), width: 1),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          //左边的图标
          Image.network(
            salesBoxData.icon,
            height: 15,
          ),
          //右边按钮

          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 8, 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              gradient: LinearGradient(
                colors: [Color(0xffff4e63), Color(0xffff6cc9)],
              ),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => WebView(
                              url: salesBoxData.moreUrl,
                              title: "更多活动",
                              hidAppBar: false,
                              statusBarColor: "ff2233",
                            )));
              },
              child: Text(
                "获取更多福利 >",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
