import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../r.dart';

class InformationPage extends StatefulWidget {
  @override
  State createState() {
    return _InformationPageState();
  }
}

class _InformationPageState extends State<InformationPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
  AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _animationController.forward();
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 300,
              image: AssetImage(R.assetsImagesPicinformasi),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35)),
                ),
                margin: EdgeInsets.only(top: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    SizedBox(height: 500)
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
