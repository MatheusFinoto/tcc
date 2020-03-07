import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultHorizontalList extends StatefulWidget {
  @override
  _DefaultHorizontalListState createState() => _DefaultHorizontalListState();
}

class _DefaultHorizontalListState extends State<DefaultHorizontalList> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 450,
        child: ListView(
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.grey[100],
              highlightColor: Colors.grey[300],
              enabled: true,
              child: Row(
                children: <int>[0, 1]
                    .map((_) => Container(
                  //color: Colors.red,
                  margin: EdgeInsets.all(4),
                  height: 450,
                  width: MediaQuery.of(context).size.width - 80,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff2ede4),
                        ),
                        height: 325,
                      ),
                      Container(
                        color: Color(0xfff2ede4),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 18,
                      ),
                      Container(
                        color: Color(0xfff2ede4),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 18,
                      ),
                      Container(
                        color: Color(0xfff2ede4),
                        margin: EdgeInsets.symmetric(vertical: 5),
                        height: 19,
                      ),
                    ],
                  ),
                ))
                    .toList(),
              ),

            ),
          ],
        )
    );
  }
}
