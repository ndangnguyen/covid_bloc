//import 'package:covid/bloc/summary_bloc.dart';
//import 'package:covid/data/model/model_index.dart';
//import 'package:covid/di/get_it_manager.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/material.dart';
//import 'package:flutter/rendering.dart';
//
//import '../../r.dart';
//
//class SummaryPage extends StatefulWidget {
//  @override
//  _SummaryPageState createState() => _SummaryPageState();
//}
//
//class _SummaryPageState extends State<SummaryPage> with AutomaticKeepAliveClientMixin {
//  SummaryBloc summaryBloc;
//  Size screenSize;
//
//  @override
//  void initState() {
//    super.initState();
//    summaryBloc = GetItManager().get<SummaryBloc>();
//    summaryBloc.getCountries();
//  }
//
//  @override
//  void didChangeDependencies() {
//    super.didChangeDependencies();
//    screenSize = MediaQuery.of(context).size;
//  }
//
//  @override
//  bool get wantKeepAlive => true;
//
//  @override
//  Widget build(BuildContext context) {
//    super.build(context);
//    return buildSummaryScreen(context);
//  }
//
//  buildSummaryScreen(context) {
//    return Container(
//      child: Stack(
//        alignment: Alignment.topCenter,
//        children: <Widget>[
//          Image(
//            fit: BoxFit.fitWidth,
//            width: double.infinity,
//            height: 300,
//            image: AssetImage(R.assetsImagesPickasus),
//          ),
//          Container(
//              width: double.infinity,
//              decoration:
//                  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
//              margin: EdgeInsets.only(top: 200),
//              child: StreamBuilder(
//                  stream: summaryBloc.countriesStream,
//                  builder: (context, snapshot) {
//                    if (snapshot.hasData) return createSummaryListView(snapshot.data);
//                    return Container(height: screenSize.height - 200, child: Center(child: Text("No data")));
//                  }))
//        ],
//      ),
//    );
//  }
//
//  createSummaryListView(List<Country> countries) {
//    return Padding(
//      padding: EdgeInsets.all(10),
//      child: ListView.separated(
//        itemCount: countries.length,
//        itemBuilder: (context, index) {
//          var country = countries[index];
//          return ListTile(
//            leading: Text(index.toString()),
//            title: Text(country.country),
//            trailing: Text(country.totalConfirmed.toString()),
//          );
//        },
//        separatorBuilder: (context, index) => Divider(),
//        shrinkWrap: true,
//        physics: const AlwaysScrollableScrollPhysics(),
//      ),
//    );
//  }
//}
