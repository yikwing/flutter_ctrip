import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_xiecheng/model/network/common_model.dart';

class LocalNav extends StatelessWidget {
  final List<CommonModel> localNavList;

  LocalNav({Key key, this.localNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      padding: EdgeInsets.all(7),
      height: 64,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: _items(),
      ),
    );
  }

  _items() {
    return localNavList.map((f) {
      return Column(
        children: [
          CachedNetworkImage(
            imageUrl: f.icon,
            width: 32,
            height: 32,
          ),
          Text(
            f.title,
            style: TextStyle(fontSize: 12),
          )
        ],
      );
    }).toList();
  }
}
