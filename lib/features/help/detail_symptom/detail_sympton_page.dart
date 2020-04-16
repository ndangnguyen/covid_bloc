import 'package:covid/r.dart';
import 'package:covid/utils/widgets/icon_with_blur_background.dart';
import 'package:flutter/material.dart';

class DetailSymptomPage extends StatelessWidget {
  final String heroTag;

  const DetailSymptomPage({Key key, this.heroTag}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: _buildHotlinePage(),
    );
  }

  _buildHotlinePage() {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red, // status bar color
        brightness: Brightness.light, // status bar brightness
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Hero(
                    tag: heroTag,
                    child: Image(image: AssetImage(R.assetsIconsIchotline),)
                  ),
                  SizedBox(width: 20),
                  Expanded(
                    child: Text(
                      heroTag,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
