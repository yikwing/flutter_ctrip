import 'package:flutter/material.dart';
import 'package:flutter_xiecheng/model/network/common_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class SubNav extends StatelessWidget {
  final List<CommonModel> subNavList;

  SubNav({Key key, this.subNavList}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _items(),
    );
  }

  _items() {
    var items = subNavList
        .map((f) => Expanded(
            flex: 1,
            child: Column(
              children: <Widget>[
                CachedNetworkImage(
                  imageUrl: f.icon,
                  width: 18,
                  height: 18,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 3),
                  child: Text(
                    f.title,
                    style: TextStyle(fontSize: 12),
                  ),
                )
              ],
            )))
        .toList();

    int separate = (subNavList.length / 2 + 0.5).toInt();

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: items.sublist(0, separate),
            ),
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: items.sublist(separate, subNavList.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
