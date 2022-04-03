import 'networking.dart';

const url = 'https://newsapi.org/v2/top-headlines?country=in&apiKey=b1d385c4b9894b23bd28bdb3a9d982d1';

class NewsModel{
  Future<dynamic> getNewsData() async {
    Networking networkHelper = Networking(
        url);

    var newsData = await networkHelper.getData();
    return newsData;
  }
}