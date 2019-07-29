import 'package:flutter/material.dart';
import 'package:flutter_trip/model/common_model.dart';
import 'package:flutter_trip/weight/web_view.dart';

//首页球区入口
class LocalNavWidget extends StatelessWidget {
  final List<CommonModel> localNavList;

  const LocalNavWidget({Key key, this.localNavList}) : super(key: key);

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
    return Row(
      children:
          localNavList?.map((item) => _buildItem(context, item))?.toList() ??
              [],
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
    );
  }

  Widget _buildItem(BuildContext context, CommonModel itemModel) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebView(
                      url: itemModel.url,
                      statusBarColor: itemModel.statusBarColor,
                      title: itemModel.title,
                      hidAppBar: itemModel.hideAppBar,
                    )));
      },
      child: Column(
        children: <Widget>[
          Image.network(
            itemModel.icon,
            height: 32,
            width: 32,
          ),
          Text(
            itemModel.title,
            style: TextStyle(fontSize: 12),
          )
        ],
        //设置内容居中
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
