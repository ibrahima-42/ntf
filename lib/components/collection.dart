import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Collection extends StatefulWidget {
  const Collection({super.key});

  @override
  State<Collection> createState() => _CollectionState();
}

class _CollectionState extends State<Collection> {


  @override
  Widget build(BuildContext context) {

  final isDarkMode = MediaQuery.of(context).platformBrightness == Brightness.dark;

    return Container(
      height: 74,
      decoration: BoxDecoration(
        color: isDarkMode ? Colors.white : Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: 50,
            child: Stack(
              children: [
                Image.asset("assets/images/gg.png", width: 50, height: 50),
                Positioned(
                  bottom: 8,
                  right: 0,
                  child: Container(
                    height: 10,
                    width: 10,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(width: 12),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("G plate reby", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: isDarkMode ? Colors.black : Colors.white),),
              const SizedBox(height: 8),
              Row(
                children: [
                  Text("Floor price", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.grey),),
                  const SizedBox(width: 4),
                  Text("1.23 ETH", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: isDarkMode ? Colors.black : Colors.white),),
                ],
              ),
            ],
          ),
          const Spacer(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text("+ 93.27%", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w700, color: Colors.green),),
              const SizedBox(height: 8),
              Row(
                children: [
                  SvgPicture.asset("assets/images/eth.svg", width: 16, height: 16,),
                  const SizedBox(width: 4),
                  Text("4.5 ETH", style: TextStyle(fontSize: 12, fontWeight: FontWeight.w900, color: Colors.black),),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
