import 'package:covid/bloc/bloc_index.dart';
import 'package:covid/di/get_it_manager.dart';
import 'package:covid/features/help/help_page.dart';
import 'package:covid/features/information/infomation_page.dart';
import 'package:covid/features/summary/summary_page.dart';
import 'package:covid/utils/constants.dart';
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
  HomeBloc _homeBloc;

  @override
  void initState() {
    super.initState();
    _homeBloc = GetItManager().get<HomeBloc>();
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
        StreamBuilder(
          stream: _homeBloc.tabStream,
          builder: (context, snapshot) {
            print('Nguyen: onTabChange: ${snapshot.data}');
            return buildTabBar(snapshot.data);
          },
        )
      ],
    ));
  }

  createTabBarView(BuildContext context) {
    return PageView(
      physics: AlwaysScrollableScrollPhysics(),
      controller: _pageController,
      children: <Widget>[
        SummaryPage(),
        InformationPage(),
        HelpPage(),
      ],
      onPageChanged: (page) {
        print("Nguyen onPageChanged: $page");
        _homeBloc.setTab(page);
      },
    );
  }

  buildTabBar(selectedIndex) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          buildTab(tabIndex: 0, isSelected: 0 == selectedIndex, text: 'Tổng quan', icon: R.assetsIconsKasus, iconSelected: R.assetsIconsKasusOn),
          buildTab(tabIndex: 1, isSelected: 1 == selectedIndex, text: 'Thông tin', icon: R.assetsIconsInformasi, iconSelected: R.assetsIconsInformasiOn),
          buildTab(tabIndex: 2, isSelected: 2 == selectedIndex, text: 'Trợ giúp', icon: R.assetsIconsBantuan, iconSelected: R.assetsIconsBantuanOn),
        ],
      ),
    );
  }

  buildTab({tabIndex, isSelected, text, icon, iconSelected}) {
    return Expanded(
      child: InkWell(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            isSelected
                ? Image(image: AssetImage(iconSelected), height: _tabIconSize, width: _tabIconSize)
                : Image(image: AssetImage(icon), height: _tabIconSize, width: _tabIconSize),
            SizedBox(
              height: 10,
            ),
            Text(
              text,
              style: TextStyle(color: isSelected ? Color(ColorUtils.c_67C57B) : Colors.black),
            ),
            SizedBox(
              height: 10,
            ),
          ],
        ),
        onTap: () => _pageController.jumpToPage(tabIndex),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
