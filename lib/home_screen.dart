import 'package:flutter/cupertino.dart';
import 'news_template.dart';
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key,this.newsData}) : super(key: key);

  final newsData;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: controller,
      children: [
        NewsTemplate(newsData: widget.newsData,index: 0,),
        NewsTemplate(newsData: widget.newsData,index: 1,),
        NewsTemplate(newsData: widget.newsData,index: 2,),
        NewsTemplate(newsData: widget.newsData,index: 3,),
        NewsTemplate(newsData: widget.newsData,index: 4,),
        NewsTemplate(newsData: widget.newsData,index: 5,),
        NewsTemplate(newsData: widget.newsData,index: 6,),
        NewsTemplate(newsData: widget.newsData,index: 7,),
        NewsTemplate(newsData: widget.newsData,index: 8,),
        NewsTemplate(newsData: widget.newsData,index: 9,),
        NewsTemplate(newsData: widget.newsData,index: 10,),
        NewsTemplate(newsData: widget.newsData,index: 11,),
        NewsTemplate(newsData: widget.newsData,index: 12,),
        NewsTemplate(newsData: widget.newsData,index: 13,),
        NewsTemplate(newsData: widget.newsData,index: 14,),
        NewsTemplate(newsData: widget.newsData,index: 15,),
        NewsTemplate(newsData: widget.newsData,index: 16,),
        NewsTemplate(newsData: widget.newsData,index: 17,),
        NewsTemplate(newsData: widget.newsData,index: 18,),
        NewsTemplate(newsData: widget.newsData,index: 19,),
      ],
    );
  }
}
