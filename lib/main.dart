import 'package:flutter/material.dart';

void main() => runApp(MyApp());

const kMainColor = Color(0xFF573851);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(title: 'Flutter Custom Tab Indicator Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.white,
          bottom: TabBar(
//            indicator: ShapeDecoration(
////              shape: StadiumBorder(side: BorderSide(width: 5.0, color: kMainColor))
//              // shape: RoundedRectangleBorder(
////                side: BorderSide(width: 5.0, color: kMainColor),
////                borderRadius: BorderRadius.circular(20),
////              )
//            ),
//            indicator: UnderlineTabIndicator(borderSide: BorderSide(color: Colors.greenAccent, width: 5.0)),
            indicator: CircleTabIndicator(color: kMainColor, radius: 3),
//            indicator: BoxDecoration(
//              color: kMainColor,
//              borderRadius: BorderRadius.circular(20),
//            ),
            tabs: <Widget>[
              Tab(
                child: Text('fruits', style: TextStyle(color: kMainColor)),
              ),
              Tab(
                child: Text('vegetables', style: TextStyle(color: kMainColor)),
              ),
              Tab(
                child: Text('berries', style: TextStyle(color: kMainColor)),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: <Widget>[
            Center(child: Text('Tab 1')),
            Center(child: Text('Tab 2')),
            Center(child: Text('Tab 3')),
          ],
        ),
      ),
    );
  }
}

class CircleTabIndicator extends Decoration {
  final BoxPainter _painter;

  CircleTabIndicator({@required Color color, @required double radius})
      : _painter = _CirclePainter(color, radius);

  @override
  BoxPainter createBoxPainter([onChanged]) => _painter;
}

class _CirclePainter extends BoxPainter {
  final Paint _paint;
  final double radius;

  _CirclePainter(Color color, this.radius)
      : _paint = Paint()
          ..color = color
          ..isAntiAlias = true;

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration cfg) {
    final Offset circleOffset =
        offset + Offset(cfg.size.width / 2, cfg.size.height - radius - 5);
    canvas.drawCircle(circleOffset, radius, _paint);
  }
}
