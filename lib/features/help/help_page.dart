//import 'package:covid/bloc/bloc_index.dart';
//import 'package:covid/di/get_it_manager.dart';
//import 'package:covid/utils/widgets/search_widget.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//
//import '../../r.dart';
//
//class HelpPage extends StatefulWidget {
//  @override
//  _HelpPageState createState() => _HelpPageState();
//}
//
//class _HelpPageState extends State<HelpPage> with AutomaticKeepAliveClientMixin {
//  final dataList = ['nguyen', 'tuyet', 'thanh', 'chung'];
//  final GlobalKey<MySingleChoiceSearchState> _searchWidgetKey = GlobalKey();
//  HelpBloc _helpBloc = GetItManager().get<HelpBloc>();
//
//  @override
//  void initState() {
//    super.initState();
//    //_helpBloc.getCountries();
//  }
//
//  @override
//  bool get wantKeepAlive {
//    return true;
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//    return buildHelpPage(context);
//  }
//
//  buildHelpPage(context) {
//    return Container(
//      child: SingleChildScrollView(
//        child: Stack(
//          alignment: Alignment.topCenter,
//          children: <Widget>[
//            Image(
//              fit: BoxFit.fitWidth,
//              width: double.infinity,
//              height: 300,
//              image: AssetImage(R.assetsImagesPicbantuan),
//            ),
//            Container(
//                width: double.infinity,
//                decoration:
//                    BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
//                margin: EdgeInsets.only(top: 200),
//                child: Column(
//                  crossAxisAlignment: CrossAxisAlignment.start,
//                  children: <Widget>[
//                    SizedBox(height: 15),
//                    buildSearchWidget(),
//                    SizedBox(height: 10),
//                    Padding(
//                        padding: const EdgeInsets.only(top: 10, left: 20),
//                        child: Text("Update Corona Status", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
//                    Card(
//                      elevation: 5,
//                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
//                      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
//                      color: Colors.white,
//                      child: Container(height: 200),
//                    )
//                  ],
//                ))
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget buildSearchWidget() => GestureDetector(
//        behavior: HitTestBehavior.translucent,
//        onTap: () {
//          _searchWidgetKey.currentState.dismissMenu();
//        },
//        child: Container(
//          child: SearchWidget<String>(
//            initText: "Viet Nam",
//            key: _searchWidgetKey,
//            dataList: dataList,
//            selectedItemBuilder: (item, deleteItemCallback) => null,
//            onItemSelected: (item) => _searchWidgetKey.currentState.setText(item),
//            queryBuilder: (query, list) => list.where((String item) => item.toLowerCase().contains(query.toLowerCase())).toList(),
//            popupListItemBuilder: (item) => Container(padding: EdgeInsets.all(20), child: Center(child: Text(item))),
//          ),
//        ),
//      );
//}
