//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//class InformationPage extends StatefulWidget {
//  @override
//  State createState() {
//    return _InformationPageState();
//  }
//}
//
//class _InformationPageState extends State<InformationPage> with TickerProviderStateMixin, AutomaticKeepAliveClientMixin {
//  AnimationController _animationController;
//
//  @override
//  void initState() {
//    super.initState();
//    _animationController = AnimationController(vsync: this, duration: Duration(seconds: 1));
//    _animationController.forward();
//  }
//
//  @override
//  bool get wantKeepAlive {
//    return true;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    //super.build(context);
//    return Column(
//      children: <Widget>[
//        SizedBox(height: 100),
//        Container(
//          width: 100,
//          height: 100,
//          color: Colors.red,
//          child: InkWell(
//            onTap: () {
//              _animationController.isCompleted ? _animationController.reverse() : _animationController.forward();
//            },
//          ),
//        ),
//        SizedBox(height: 100),
//        AnimatedBuilder(
//            animation: _animationController,
//            child: Center(child: Container(width: 100, height: 300, color: Colors.green)),
//            builder: (context, child) => Transform.rotate(angle: _animationController.value * 3.1515, child: child)),
//      ],
//    );
//  }
//}
