import 'package:flutter/material.dart';
import 'package:royal_car_wash_customer_app/pages/details_page.dart';
import 'package:royal_car_wash_customer_app/pages/home_page.dart';
import 'package:royal_car_wash_customer_app/pages/preview_page.dart';
import 'package:royal_car_wash_customer_app/pages/profile_page.dart';

class MainHomePage extends StatefulWidget {
  @override
  _MainHomePageState createState() => _MainHomePageState();
}

class _MainHomePageState extends State<MainHomePage> {
  PageController _pageController;
  int _currentIndex = 0;

  String appbarTitleString;

  Text appBarTitleText;

  int selectedIndex=0;
  @override
  void initState() {
    _pageController = new PageController(
      initialPage: _currentIndex,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    BottomNavigationBar bottamNavigationBar = BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xFFFCFCFC),
      selectedItemColor: Color.fromRGBO(46, 79, 101, 1),
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex,
      selectedFontSize: 15,
      unselectedFontSize: 15,
      onTap: onTabTapped,
      items: [
        BottomNavigationBarItem(

            // ignore: deprecated_member_use
            title: Text('Home'),
            icon: ImageIcon(
              const AssetImage(
                'assets/images/home.png',
              ),
              size: 50,
            )),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Details'),
            icon: ImageIcon(
              const AssetImage(
                'assets/images/car.png',
              ),
              size: 50,
            )),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Preview'),
            icon: ImageIcon(
              const AssetImage(
                'assets/images/list.png',
              ),
              size: 50,
            )),
        BottomNavigationBarItem(
            // ignore: deprecated_member_use
            title: Text('Profile'),
            icon: CircleAvatar(
              radius: 23,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                backgroundImage: ExactAssetImage('assets/images/person.jpg'),
                //child: Image.asset('assets/images/person.jpg',width:30,fit: BoxFit.cover,),
                //backgroundImage:Image.asset('assets/images/list.png'),
                radius: 20,

                //backgroundColor: Colors.transparent,
              ),
            )),
      ],
    );

    List<Widget> tabPages = [
      homePage("", ""),
      details_page(),
      preview_page(),
      ProfilePage(),
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      
          bottomNavigationBar: bottamNavigationBar,
          body: PageView(
            children: tabPages,
            onPageChanged: onPageChanged,
            controller: _pageController,
          )),
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._currentIndex = page;
        
    });
  }

  void onTabTapped(int index) {
    this._pageController.animateToPage(index,
        duration: const Duration(milliseconds: 100), curve: Curves.easeInOut);
    
  }
}
