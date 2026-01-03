import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/components/collection.dart';
import 'package:nft/constant/color.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int selectedIndex = 0;
  bool isFavorite = false;

  final List<Map<String, dynamic>> _menu = [
    {'menu': "Trending"},
    {'menu': "Recent"},
    {'menu': "Top"},
    {'menu': "Art"},
  ];

  List<Widget> buildFenetre(bool isDarkMode) {
    return [
    SingleChildScrollView(
      child: Stack(
        children: [
          // Text("Trendig"),
          //icon favorite
          Positioned(
            top: 20,
            right: 20,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.white.withValues(alpha: 1),
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.white),
              ),
              child: IconButton(
                icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border, color: Colors.blue, size: 24),
                onPressed: () {
                  setState(() {
                    isFavorite = !isFavorite;
                  });
                },
              ),
            ),
          ),//end icon favorite
          
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              Container(
                height: 242,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFFFBCC7).withValues(alpha: 1),
                      Color(0xFFC732D4).withValues(alpha: 1),
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
                child: Image.asset("assets/images/Image1.png"),
              ),
              //contenue
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  gradient: isDarkMode ? LinearGradient(
                      colors: [Colors.white, Colors.white]): LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      ColorApp.secondary.withValues(alpha: 0.1),
                    ])
                ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Backpack (Pacific Pink)",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: isDarkMode ? Colors.white : Colors.black,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Auction ends : 1h 30m 45s",
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w700,
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            Image.asset("assets/images/gg.png", width: 40, height: 40,),
                            const SizedBox(width: 16),
                            Text(
                              "Bjorka Robert",
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: isDarkMode ? Colors.white : Colors.black
                              ),
                            ),
                            const SizedBox(width: 4),
                            SvgPicture.asset("assets/images/certif.svg"),
                            Spacer(),
                            GestureDetector(
                              onTap: () {},
                              child: Container(
                                height: 37,
                                width: 83,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  gradient: LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [ColorApp.secondary, ColorApp.primary],
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.shopping_cart_outlined,
                                      color: Colors.white,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      "Cart",
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    Text("Top Collection", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                    Spacer(),
                    Text("See all", style: TextStyle(color: ColorApp.primary,fontSize: 12,fontWeight: FontWeight.w400),),
                  ],
                ),
                const SizedBox(height: 24),
                Collection(),
                
            ],
          ),
        ],
      ),
    ),
    Column(children: [Text("Recent")]),
    Column(children: [Text("Top")]),
    Column(children: [Text("Art")]),
  ];

  }



  @override
  Widget build(BuildContext context) {
    final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return AnnotatedRegion(
      value: isDarkMode
          ? SystemUiOverlayStyle.light
          : SystemUiOverlayStyle.dark,
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    text: "Selling the ",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: isDarkMode ? Colors.white : Colors.black,
                    ),
                    children: [
                      TextSpan(
                        text: " most popular\n",
                        style: TextStyle(fontSize: 24, color: ColorApp.primary),
                      ),
                      WidgetSpan(
                        child: Row(
                          children: [
                            Text(
                              "NFT is only here",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: isDarkMode ? Colors.white : Colors.black,
                              ),
                            ),
                            const SizedBox(width: 8),
                            Image.asset("assets/images/gorge.jpg"),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                //menu
                Row(
                  children: List.generate(_menu.length, (index) {
                    final isSelected = selectedIndex == index;
                    return Padding(
                      padding: EdgeInsets.only(left: 0.0, right: 31.0),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                        child: Container(
                          width: isSelected ? 83 : null,
                          height: 30,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            gradient: isSelected
                                ? LinearGradient(
                                    begin: Alignment.centerLeft,
                                    end: Alignment.centerRight,
                                    colors: [
                                      ColorApp.secondary,
                                      ColorApp.primary,
                                    ],
                                  )
                                : null,
                          ),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              _menu[index]['menu'] as String,
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: isSelected
                                    ? Colors.white
                                    : (isDarkMode
                                          ? Colors.white70
                                          : Colors.black54),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
                const SizedBox(height: 24),
                Text(
                  "Trending Collections",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                ),
                const SizedBox(height: 16),

                //fenetre
                Expanded(child: buildFenetre(isDarkMode)[selectedIndex]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
