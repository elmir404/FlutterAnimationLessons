import 'package:flutter/material.dart';

class AnimasyonluWidget extends StatefulWidget {
  const AnimasyonluWidget({Key key}) : super(key: key);

  @override
  _AnimasyonluWidgetState createState() => _AnimasyonluWidgetState();
}

class _AnimasyonluWidgetState extends State<AnimasyonluWidget> {
  var _color =Colors.pink;
  var _width =300.0;
  var _heigth=300.0;
  var _ilkCocukAktiv=true;
var _opacity=1.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animasyonlu Widgetler"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              AnimatedContainer(
                duration: Duration(seconds: 2),
                height: _heigth,
                width: _width,
                color: _color,
              ),
              RaisedButton(
                onPressed: () {
                  _animatedContaierAnimasyonu();
                },
                color: Colors.lightGreen,
                child: Text("Animation Container"),
              ),
              AnimatedCrossFade(firstChild: Image.network("https://tesla-cdn.thron.com/delivery/public/image/tesla/da705069-91b5-41cb-86f3-86a585c6fdf3/bvlatuR/std/2880x1800/MX-Hero-Desktop"), secondChild: Image.network("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSLRu4GC6BPqhqz26C7XfVLIrcBc-tkcuS2rw&usqp=CAU"), crossFadeState: _ilkCocukAktiv?CrossFadeState.showFirst :CrossFadeState.showSecond, duration: Duration(seconds: 3)),
              RaisedButton(
                onPressed: () {
                  _crossFadeAnimation();
                },
                color: Colors.lightGreen,
                child: Text("Crossfade "),
              ),
              AnimatedOpacity(opacity: _opacity, duration: Duration(seconds: 2),child: FlutterLogo(size: 100,),),
              RaisedButton(
                onPressed: () {
                  _opacityAnimasyon();
                },
                color: Colors.lightGreen,
                child: Text("Opacity "),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _animatedContaierAnimasyonu() {
    setState(() {
      _color =_color==Colors.pink? Colors.teal:Colors.pink;
      _width=_width ==300?100:300;
      _heigth=_heigth ==300?100:300;
    });
  }

  void _crossFadeAnimation() {
    setState(() {
      _ilkCocukAktiv=!_ilkCocukAktiv;
    });
  }

  void _opacityAnimasyon() {
    setState(() {
      _opacity  =_opacity ==1.0 ?0.0:1.0;

    });
  }
}
