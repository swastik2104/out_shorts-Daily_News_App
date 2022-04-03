import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'news_stack.dart';
import 'constants.dart';

class NewsTemplate extends StatefulWidget {
  const NewsTemplate({Key? key, this.newsData,required this.index}) : super(key: key);

  final newsData;
  final int index;

  @override
  State<NewsTemplate> createState() => _NewsTemplateState();
}

class _NewsTemplateState extends State<NewsTemplate> {
  NewsModel newsModel = NewsModel();
  late String newsImageUrl;
  late String newsTitle;
  late String newsDescription;
  late String newsLink;
  late String newsAuthor;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    firstPage(widget.newsData);
  }

  void firstPage(dynamic newsData) {
    setState(
          () {
        if (newsData == null) {
          print('Error');
        } else {
          try {
            newsImageUrl = newsData['articles'][widget.index]['urlToImage'];
          } catch (e) {
            newsImageUrl = 'https://upload.wikimedia.org/wikipedia/commons/a/ac/No_image_available.svg';
          }
          newsTitle = newsData['articles'][widget.index]['title'].toString();
          newsDescription = newsData['articles'][widget.index]['description'].toString();
          newsLink = newsData['articles'][widget.index]['url'];
          newsAuthor = newsData['articles'][widget.index]['source']['name'].toString();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
              height: 400,
              child: Image.network(
                newsImageUrl,
                fit: BoxFit.fill,
              )),
          Expanded(
            child: Container(
              color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    newsTitle,
                    style: kTitle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    newsDescription,
                    style: kDescription,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        'Short By: $newsAuthor',
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      GestureDetector(
                        child: const Text(
                          'Read More',
                          style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.redAccent
                          ),
                        ),
                        onTap: () {
                          _launchURL();
                        },
                      )
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void _launchURL() async {
    if (!await launch(newsLink)) throw 'Could not launch $newsLink';
  }
}
