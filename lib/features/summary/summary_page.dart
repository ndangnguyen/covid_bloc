import 'package:covid/bloc/bloc_index.dart';
import 'package:covid/data/model/model_index.dart';
import 'package:covid/di/get_it_manager.dart';
import 'package:covid/utils/constants.dart';
import 'package:covid/utils/widgets/indicator.dart';
import 'package:covid/utils/widgets/search_widget.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../r.dart';

class SummaryPage extends StatefulWidget {
  @override
  _SummaryPageState createState() => _SummaryPageState();
}

class _SummaryPageState extends State<SummaryPage> with AutomaticKeepAliveClientMixin {
  final GlobalKey<MySingleChoiceSearchState> _searchWidgetKey = GlobalKey();
  SummaryBloc _summaryBloc = GetItManager().get<SummaryBloc>();

  @override
  void initState() {
    super.initState();
    _summaryBloc.getCountries();
    _summaryBloc.getCountryStatistics('Vietnam');
    _summaryBloc.getWorldStatistics();
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildSummaryPage(context);
  }

  buildSummaryPage(context) {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 300,
              image: AssetImage(R.assetsImagesPickasus),
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
                    StreamBuilder(
                        stream: _summaryBloc.countriesStream,
                        builder: (context, snapshot) {
                          return buildSearchWidget(countries: snapshot.data);
                        }),
                    SizedBox(height: 10),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20),
                        child: Text("Thông tin mới nhất", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      margin: EdgeInsets.only(left: 10, right: 10, top: 20),
                      color: Colors.white,
                      child: Container(
                        height: 160,
                        child: StreamBuilder(
                            stream: _summaryBloc.countriesStatisticsStream,
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                CountryStatistics countryStatistics = snapshot.data;
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        createInfoValueWidget(
                                          color: Color(ColorUtils.c_FF9E6B),
                                          icon: Icon(Icons.brightness_low),
                                          value: countryStatistics.cases.total.toString(),
                                          label: 'Tổng số ca',
                                        ),
                                        createInfoValueWidget(
                                          color: Color(ColorUtils.c_67C57B),
                                          icon: Icon(Icons.favorite_border),
                                          value: countryStatistics.cases.recovered.toString(),
                                          label: 'Đã phục hồi',
                                        ),
                                        createInfoValueWidget(
                                          color: Color(ColorUtils.c_E36172),
                                          icon: Icon(Icons.close),
                                          value: countryStatistics.deaths.total.toString(),
                                          label: 'Đã tử vong',
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        createInfoValueWidget(
                                          color: Color(ColorUtils.c_FF9E6B),
                                          value: countryStatistics.cases.newCase ?? '0',
                                          label: 'Số ca mới',
                                        ),
                                        createInfoValueWidget(
                                          color: Color(ColorUtils.c_E36172),
                                          value: countryStatistics.deaths.newDeaths ?? '0',
                                          label: 'Số người mới tử vong',
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              }
                              return Center(child: Text('Đang tải...'));
                            }),
                      ),
                    ),
                    Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                      margin: EdgeInsets.only(left: 10, right: 10, top: 10),
                      color: Colors.white,
                      child: StreamBuilder(
                          stream: _summaryBloc.countriesStatisticsStream,
                          builder: (context, snapshot) {
                            if (snapshot.hasData)
                              return Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  PieChart(
                                    PieChartData(
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      sectionsSpace: 0,
                                      centerSpaceRadius: 50,
                                      sections: _generatePieChartSection(snapshot.data),
                                    ),
                                  ),
                                  _createIndicator(snapshot.data),
                                ],
                              );
                            return Center();
                          }
                      ),
                    ),
                    SizedBox(height: 500)
                  ],
                ))
          ],
        ),
      ),
    );
  }

  _createIndicator(CountryStatistics countryStatistics) {
    var totalCase = countryStatistics.cases.total;
    var activeCase = countryStatistics.cases.active;
    var recoveredCase = countryStatistics.cases.recovered;
    var deaths = countryStatistics.deaths.total;
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Indicator(
          color: Colors.blue[900],
          text: 'Ca nhiễm',
          isSquare: false,
          percentage: activeCase / totalCase * 100,
        ),
        SizedBox(
          height: 10,
        ),
        Indicator(
          color: Colors.blue[400],
          text: 'Đã phục hồi',
          isSquare: false,
          percentage: recoveredCase / totalCase * 100,
        ),
        SizedBox(
          height: 10,
        ),
        Indicator(
          color: Colors.red[400],
          text: 'Tử vong',
          isSquare: false,
          percentage: deaths / totalCase * 100,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }

  Widget buildSearchWidget({List<String> countries}) =>
      GestureDetector(
        behavior: HitTestBehavior.translucent,
        onTap: () {
          _searchWidgetKey.currentState.dismissMenu();
        },
        child: Container(
          child: SearchWidget<String>(
            initText: "Vietnam",
            key: _searchWidgetKey,
            dataList: countries ?? ['nodata'],
            selectedItemBuilder: (item, deleteItemCallback) => null,
            onItemSelected: (item) {
              _searchWidgetKey.currentState.setText(item);
              print('Nguyen: item ' + item);
              _summaryBloc.getCountryStatistics(item);
            },
            queryBuilder: (query, list) => list.where((String item) => item.toLowerCase().contains(query.toLowerCase())).toList(),
            popupListItemBuilder: (item) => Container(padding: EdgeInsets.all(20), child: Center(child: Text(item))),
          ),
        ),
      );

  createInfoValueWidget({color, icon, value, label}) =>
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          IconTheme(
            data: IconThemeData(color: color),
            child: icon ?? Container(),
          ),
          Text(
            value,
            style: TextStyle(color: color, fontSize: 25, fontWeight: FontWeight.bold),
          ),
          Text(label),
        ],
      );

  List<PieChartSectionData> _generatePieChartSection(CountryStatistics countryStatistics) {
    final double fontSize = 16;
    final double radius = 50;
    return List.generate(3, (index) {
      switch (index) {
        case 0:
          return PieChartSectionData(
            color: Colors.red[400],
            value: countryStatistics.deaths.total + 0.0,
            title: '',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: Colors.blue[900],
            value: countryStatistics.cases.active + 0.0,
            title: '',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: Colors.blue[400],
            value: countryStatistics.cases.recovered + 0.0,
            title: '',
            radius: radius,
            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: const Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
