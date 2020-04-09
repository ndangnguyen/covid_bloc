import 'package:covid/bloc/bloc_index.dart';
import 'package:covid/di/get_it_manager.dart';
import 'package:covid/utils/widgets/icon_with_blur_background.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../r.dart';

class HelpPage extends StatefulWidget {
  @override
  _HelpPageState createState() => _HelpPageState();
}

class _HelpPageState extends State<HelpPage> with AutomaticKeepAliveClientMixin {
  HelpBloc _helpBloc = GetItManager().get<HelpBloc>();

  @override
  void initState() {
    super.initState();
  }

  @override
  bool get wantKeepAlive {
    return true;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return buildHelpPage(context);
  }

  buildHelpPage(context) {
    return Container(
      child: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            Image(
              fit: BoxFit.fitWidth,
              width: double.infinity,
              height: 300,
              image: AssetImage(R.assetsImagesPicbantuan),
            ),
            Container(
                width: double.infinity,
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(35), topRight: Radius.circular(35))),
                margin: EdgeInsets.only(top: 200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 15),
                    Padding(
                        padding: const EdgeInsets.only(top: 10, left: 20, bottom: 20),
                        child: Text("Trung tâm trợ giúp", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))),
                    buildCardItem(assetName: R.assetsIconsIchotline, text: 'Hotline'),
                    buildCardItem(assetName: R.assetsIconsIcmengenal, text: 'Triệu chứng'),
                    buildCardItem(assetName: R.assetsIconsIcmencegah, text: 'Biện pháp phòng chống'),
                    buildCardItem(assetName: R.assetsIconsIcmengobati, text: 'Cách điều trị'),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  Card buildCardItem({assetName, text}) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: IconWithBlurBackground(
                  assetImage: AssetImage(assetName),
                  iconHeight: 30,
                  padding: 10,
                )),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Text(text, style: TextStyle(fontSize: 15),),
          ),
          Text(
            '>',
            style: TextStyle(fontSize: 20, color: Colors.grey),
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
