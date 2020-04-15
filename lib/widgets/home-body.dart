import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/screen-arguments.dart';
import '../screens/second-screen.dart';
import '../models/items.dart';

class HomeBody extends StatelessWidget {
  final List<Items> items = [
    Items(
      id: '0000001',
      text: 'COUCH',
      image: './assets/images/01.png',
      color: '0XFFDEECEE',
      colorB: '0xFF96BEC8'
    ),
    Items(
      id: '0000002',
      text: 'CHAIR',
      image: './assets/images/02.png',
      color: '0XFFFFEAE9',
      colorB: '0xFFFFAFAB'
    ),
    Items(
      id: '0000003',
      text: 'SOFA',
      image: './assets/images/03.png',
      color: '0XFFBEBDC0',
      colorB: '0xFF7B7A7F'
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.all(0),
        itemCount: items.length,
        itemBuilder: (ctx, i) => Container(
          margin: EdgeInsets.only(bottom: 20),
          height: 180.h,
          color: Color(int.parse(items[i].color)),
          child: Row(
            children: <Widget>[
              Container(
                height: ScreenUtil().uiHeightPx,
                width: ScreenUtil().uiWidthPx * 0.23,
                color: Colors.white,
                alignment: Alignment.center,
                child: Wrap(
                  children: <Widget>[
                    SizedBox(
                      width: 2,
                      child: Text(
                        items[i].text,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(
                            int.parse(items[i].colorB),
                          ),
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    Hero(
                      tag: items[i].id,
                      child: Image.asset(
                        items[i].image,
                        fit: BoxFit.cover,
                        width: 150.w,
                        height: 150.h,
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Color(int.parse(items[i].colorB)),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15)
                          )
                        ),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pushNamed(
                              SecondScreen.routName,
                              arguments: ScreenArguments(
                                items[i].id,
                                items[i].image,
                                items[i].color,
                                items[i].colorB,
                              ),
                            );
                          },
                          icon: Icon(Icons.arrow_forward, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
