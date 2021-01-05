import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/pages/splash_screen_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.blueGrey,
        //primarySwatch: Colors.white,
        textTheme: TextTheme(
           bodyText2: TextStyle(fontSize: 14.0,color: Colors.black87),
        ),
       
        visualDensity: VisualDensity.adaptivePlatformDensity,
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

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //width: MediaQuery.of(context).size.width,
        //height: MediaQuery.of(context).size.height,
 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            splash_screen_page(),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
