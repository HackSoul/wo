import 'package:flutter/material.dart';
import 'package:linli/pages/tourist/widgets/tourist_user_info_widget.dart';

class TouristUserPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TouristUserPageState();
}

class _TouristUserPageState extends State<TouristUserPage> with AutomaticKeepAliveClientMixin<TouristUserPage> {

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        backgroundColor: theme.backgroundColor,
        body: Stack(
          alignment: Alignment.bottomRight,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                  return <Widget>[
                    SliverAppBar(
                      pinned: true,
                      floating: true,
                      snap: true,
                      expandedHeight: 100.0,
                      backgroundColor: theme.backgroundColor,
                      flexibleSpace: FlexibleSpaceBar(
                        title: Text("邻里社区·邻居", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0,  fontFamily: "kaiti", color: theme.primaryColor)),
                      )
                    )
                  ];
                },
                body: ListView(
                  padding: EdgeInsets.only(bottom: kToolbarHeight + 20.0),
                  children: <Widget>[
                    SizedBox(height: 8.0),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Column(
                            children: <Widget>[
                              TouristUserInfoWidget(),
                              TouristUserInfoWidget(),
                              TouristUserInfoWidget(),
                              TouristUserInfoWidget(),
                              TouristUserInfoWidget(),
                              TouristUserInfoWidget()
                            ],
                          ),
                        ),
                        SizedBox(width: 64.0),
                      ],
                    )
                  ],
                ),
              )
            ),
            Positioned(
              top: 124.0,
              child: Container(
                width: 64.0,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  padding: EdgeInsets.only(bottom: (kToolbarHeight + 20.0) * 3, top: 6.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("栋"),
                      SizedBox(height: 8.0,),
                      for (int i = 1; i < 22; i++)
                        FlatButton(
                          color: theme.cardColor,
                          padding: EdgeInsets.zero,
                          shape: CircleBorder(),
                          onPressed: () {},
                          child: Text(i.toString(), style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: theme.primaryColor)),
                        ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}