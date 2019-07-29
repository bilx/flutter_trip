import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_trip/model/banner_model.dart';

class BannerWidget extends StatelessWidget {
  final List<BannerModel> bannersData;

  BannerWidget({key, this.bannersData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Swiper(
        itemCount: bannersData?.length ?? 0,
        autoplay: true,
        itemBuilder: (BuildContext context, int index) {
          return Image.network(
            bannersData[index].icon,
            fit: BoxFit.cover,
          );
        },
        pagination: SwiperPagination(),
      ),
    );
  }
}
