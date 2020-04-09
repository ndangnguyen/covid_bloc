import 'package:flutter/cupertino.dart';
import 'package:palette_generator/palette_generator.dart';

class IconWithBlurBackground extends StatefulWidget {
  final AssetImage _assetImage;
  final double _iconHeight;
  final double _padding;
  final double _backgroundOpacity;

  IconWithBlurBackground({assetImage, iconHeight: 60, padding: 20, backgroundOpacity: 0.2})
      : _assetImage = assetImage,
        _iconHeight = iconHeight + 0.0,
        _padding = padding + 0.0,
        _backgroundOpacity = backgroundOpacity;

  @override
  _IconWithBlurBackgroundState createState() => _IconWithBlurBackgroundState();
}

class _IconWithBlurBackgroundState extends State<IconWithBlurBackground> {
  Future<Color> _getMainColor;

  @override
  void initState() {
    _getMainColor = getMainColorImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _getMainColor,
      builder: (context, snapShotColor) {
        if (snapShotColor.hasData) {
          return Container(
            padding: EdgeInsets.all(widget._padding),
            decoration: BoxDecoration(color: snapShotColor.data, shape: BoxShape.circle),
            child: Image(
              height: widget._iconHeight,
              image: widget._assetImage,
              fit: BoxFit.fitHeight,
            ),
          );
        }
        return Container();
      },
    );
  }

  Future<Color> getMainColorImage() async {
    final PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(widget._assetImage);
    final color = paletteGenerator.vibrantColor.color.withOpacity(widget._backgroundOpacity);
    return color;
  }
}
