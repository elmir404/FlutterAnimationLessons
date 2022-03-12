import 'package:animation/animasyon_widgets.dart';
import 'package:flutter/material.dart';

import 'new_page.dart';
import 'transform_widget.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        

        
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> with SingleTickerProviderStateMixin {
  int _counter = 0;
  AnimationController controller;

  Animation animation;
  Animation animation2;
  Animation animation3;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller =AnimationController(vsync:this,duration: Duration(seconds: 3) );
    controller.addListener(() {
      setState(() {
        //debugPrint(controller.value.toString());
        //debugPrint(animation.value.toString());
      });
    });
    animation=ColorTween(begin: Colors.teal,end: Colors.lightGreen).animate(controller);
    animation2 =AlignmentTween(begin: Alignment(-1,-1),end: Alignment(1,1)).animate(controller);
    animation3 =CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward(from:0);
    controller.addStatusListener((durum) {
      if(durum == AnimationStatus.completed){
        controller.reverse();
      }
      else if(durum ==AnimationStatus.dismissed){controller.forward();}
      debugPrint("durum :" +durum.toString());
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }
  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(

      backgroundColor: animation.value,
      appBar: AppBar(
        
        
        title: Text(widget.title),
      ),
      body: Center(
        
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: TextStyle(fontSize: animation3.value*36),
            ),
            Container(
              height: 100,
              alignment: animation2.value,
              child: Text(
                '$_counter',
                style:TextStyle(fontSize: controller.value+20),
              ),
            ),
            Hero(tag: 'elmir', child: FlutterLogo(
              size: 64,
            )),
            RaisedButton(child:Text("Next Page"),onPressed:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>NewPage()));}),
            RaisedButton(child:Text("Next Page"),onPressed:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AnimasyonluWidget()));}),
            RaisedButton(child:Text("Transformla Ilgili widgetler"),onPressed:(){ Navigator.of(context).push(MaterialPageRoute(builder: (context)=>TransformWidget()));}),


          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), 
    );
  }
}
