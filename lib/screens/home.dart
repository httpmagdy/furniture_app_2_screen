import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widgets/home-body.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    ScreenUtil.init(context,width: screenSize.width, height: screenSize.height);
    return Scaffold(
      body: SafeArea(
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            _backgroundScreen(),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                children: <Widget>[
                  _headerScreen(),
                  HomeBody(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _backgroundScreen() {
    return Row(
      children: <Widget>[
        Container(
          color: Color(0xFFE9EDF1),
          height: ScreenUtil().uiHeightPx,
          width: ScreenUtil().uiWidthPx * 0.27,
        ),
        Container(
          color: Colors.white,
          height: ScreenUtil().uiHeightPx,
          width: ScreenUtil().uiWidthPx * 0.73,
        ),
      ],
    );
  }

  Widget _headerScreen() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                Icons.apps,
                color: Color(0xFF7E96AF),
                size: ScreenUtil().setSp(23),
              ),
              SizedBox(width: 10.w),
              Text(
                'FURNITURE',
                style: TextStyle(
                    color: Color(0xFF7E96AF), fontSize: ScreenUtil().setSp(20)),
              ),
            ],
          ),
          CircleAvatar(
            backgroundImage: AssetImage('./assets/images/head.jpg'),
            radius: 18,
          ),
        ],
      ),
    );
  }
}
