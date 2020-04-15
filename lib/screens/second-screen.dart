import 'package:flutter/material.dart';
import 'package:furniture_app/models/screen-arguments.dart';
import '../models/items-second.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecondScreen extends StatelessWidget {
  static const routName = '/Second-screen';
  
  final List<ItemsSecond> items = [
    ItemsSecond(
      image: './assets/images/05.png',
      color: '0XFFF0E9DE',
    ),
    ItemsSecond(
      image: './assets/images/04.png',
      color: '0XFFD2DADA',
    ),
    ItemsSecond(
      image: './assets/images/06.png',
      color: '0XFFE7D8E2',
    ),
    ItemsSecond(
      image: './assets/images/07.png',
      color: '0XFFF2DDD4',
    ),
    ItemsSecond(
      image: './assets/images/08.png',
      color: '0XFFAFB3BC',
    ),
    ItemsSecond(
      image: './assets/images/09.png',
      color: '0XFFA7A8A4',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    ScreenUtil.init(context,
        width: screenSize.width, height: screenSize.height);

    final ScreenArguments arguments = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: 280.h,
            pinned: true,
            backgroundColor:
                Color(int.parse(arguments.colorR)),
             floating: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back,
                size: ScreenUtil().setSp(25),
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
              color: Color(int.parse(arguments.colorRa)),
            ),
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.apps,
                  size: ScreenUtil().setSp(25),
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
                color: Color(int.parse(arguments.colorRa)),
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                padding: const EdgeInsets.only(top: 40,left: 35, right: 35),
                child: Hero(
                  tag: arguments.id,
                  child: Image.asset(arguments.imageR, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 2,
            ),
            delegate: SliverChildListDelegate(
              items
                  .map(
                    (i) => Container(
                      decoration: BoxDecoration(
                        color: Color(int.parse(i.color)),
                      ),
                      padding: EdgeInsets.all(30),
                      child: Image.asset(i.image, fit: BoxFit.cover),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
