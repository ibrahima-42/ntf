import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:nft/constant/color.dart';
import 'package:flutter/services.dart';

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {


  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

   final  isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return AnnotatedRegion(
      value: isDarkMode ? SystemUiOverlayStyle.light : SystemUiOverlayStyle.dark,
      child: CupertinoPageScaffold(
        child: SafeArea(
          child: Column(
            children: [
              isDarkMode ?
              Image.asset(
                "assets/images/bannerblack.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
              ):Image.asset(
                "assets/images/banner.jpg",
                fit: BoxFit.cover,
                width: double.infinity,
              ),
              const SizedBox(height: 24),
              SizedBox(
                height: 150,
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: "Discover, Collect\nand sell",
                        style: TextStyle(
                          color: isDarkMode ? Colors.white : Colors.black,
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Poppins",
                        ),
                        children: [
                          WidgetSpan(child: SizedBox(width: 10)),
                          TextSpan(
                            text: "NFTs",
                            style: TextStyle(
                              color: ColorApp.primary,
                            ),
                          )
                        ]
                      ),
                    ),
                    Positioned(
                      top: 70,
                      left: 160,
                      child: SvgPicture.asset("assets/images/Stripe.svg"),
                    ),
                    Positioned(
                      top: 88,
                      left: 0,
                      right: 0,
                      child: Center(
                        child: Text("Ape NFTs is the world’s first and largest\nNFT marketplace", 
                        textAlign: TextAlign.center,
                        style: TextStyle(color: isDarkMode ? const Color.fromARGB(255, 218, 216, 216) : const Color.fromARGB(255, 140, 138, 138), fontSize: 14),),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Container(
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      gradient: LinearGradient(
                        begin: Alignment.centerRight,
                        end: Alignment.centerLeft,
                        colors: [
                          ColorApp.primary,
                          ColorApp.secondary,
                        ])
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text("Get Started", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
