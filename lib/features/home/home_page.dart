import 'package:covid/features/summary/summary_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../r.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  PageController _pageController;
  static final _tabIconSize = 20.0;
  int page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: createTabBarView(context),
        ),
        buildTab(page)
      ],
    ));
  }

  createTabBarView(BuildContext context) {
    return PageView(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        SummaryPage(),
        Container(),
        Container(),
//        InformationPage(),
//        HelpPage(),
      ],
      onPageChanged: (page) {
        print("on page change: $page");
        this.page = page;
        // _homeBloc.add(OnTabChangeEvent(page));
        setState(() {});
      },
    );
  }

  buildTab(selectedIndex) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
              flex: 1,
              child: InkWell(
                borderRadius: BorderRadius.circular(10),
                child: Tab(
                    text: "Tổng quan",
                    icon: selectedIndex == 0
                        ? Image(image: AssetImage(R.assetsIconsKasusOn), height: _tabIconSize, width: _tabIconSize)
                        : Image(image: AssetImage(R.assetsIconsKasus), height: _tabIconSize, width: _tabIconSize)),
                onTap: () => _pageController.jumpToPage(0),
              )),
          Expanded(
            flex: 1,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Tab(
                  text: "Thông tin",
                  icon: selectedIndex == 1
                      ? Image(image: AssetImage(R.assetsIconsInformasiOn), height: _tabIconSize, width: _tabIconSize)
                      : Image(image: AssetImage(R.assetsIconsInformasi), height: _tabIconSize, width: _tabIconSize)),
              onTap: () => _pageController.jumpToPage(1),
            ),
          ),
          Expanded(
            flex: 1,
            child: InkWell(
              borderRadius: BorderRadius.circular(10),
              child: Tab(
                  text: "Giúp đỡ",
                  icon: selectedIndex == 2
                      ? Image(image: AssetImage(R.assetsIconsBantuanOn), height: _tabIconSize, width: _tabIconSize)
                      : Image(image: AssetImage(R.assetsIconsBantuan), height: _tabIconSize, width: _tabIconSize)),
              onTap: () => _pageController.jumpToPage(2),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
