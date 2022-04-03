import 'package:flutter/material.dart';
import 'home_screen.dart';
import 'loader.dart';
import 'news_stack.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _LoadingScreenState();
  }
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getNewsData();
  }

  void getNewsData() async {
    var newsData = await NewsModel().getNewsData();

    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return HomeScreen(
        newsData : newsData,
      );
    },),);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: ColorLoader3(
          radius: 15,
          dotRadius: 6,
        ),
        // child: SpinKitDoubleBounce(
        //   color: Colors.white,
        //   size: 100.0,
        ),
      );

  }
}