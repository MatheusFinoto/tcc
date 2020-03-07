import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultListPopular extends StatefulWidget {
  @override
  _DefaultListPopularState createState() => _DefaultListPopularState();
}

class _DefaultListPopularState extends State<DefaultListPopular> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          padding: EdgeInsets.all(16),
          scrollDirection: Axis.vertical,
          children: <Widget>[
            Shimmer.fromColors(
              baseColor: Colors.grey[100],
              highlightColor: Colors.grey[300],
              enabled: true,
              child: Column(
                children: <int>[0, 1, 2 ,3]
                    .map((_) => Container(
                  //color: Colors.red,
                  margin: EdgeInsets.all(4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xfff2ede4),
                        ),
                        height: 125,
                        width: 125,
                      ),

                      Expanded(
                        child: Container(
                          height: 125,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
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
                        ),
                      )
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
