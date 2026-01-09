import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:nft/constant/color.dart';
import 'package:nft/pages/screen.dart';
import 'package:nft/pages/home.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  bool isScreen = true;
  
  
  @override
  void initState() {
    super.initState();
    // TODO: implement initState
    Timer(const Duration(seconds: 3), () {
      setState(() {
        isScreen = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle.dark,
      child: CupertinoApp(
        debugShowCheckedModeBanner: false,
        title: "nft",
        onGenerateRoute: (settings) {
          if (settings.name == '/') {
            return CupertinoPageRoute(builder: (context) => Screen());
          }
          return null;
        },
        home: isScreen ? Screen() : CupertinoTabScaffold(
          tabBuilder: (context, index) {
            switch (index) {
              case 0:
                return const Home();
              case 1:
                return const Home();
              case 2:
                return const Home();
              case 3:
                return const Home();
              default:
                return const Home();
            }
          },
          tabBar: CupertinoTabBar(
            height: 50,
            activeColor: ColorApp.primary,
            items: const [
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home, size: 24),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.person, size: 24),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.settings, size: 24),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.shopping_cart, size: 24),
                label: 'Cart',
              ),
            ],
          ),
        ),
      ),
    );
  }
}