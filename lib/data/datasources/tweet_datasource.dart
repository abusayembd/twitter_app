import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:twitter_app/data/models/tweet_model.dart';

class TweetDatasource {
  static Future<List<TweetModel>> getAllTweets() async {
    //
    List<TweetModel> tweetList = [];
    //
    http.Response response = await http
        .get(Uri.parse("https://63b6f30c4f17e3a931c5c8fb.mockapi.io/tweet"));
    //
    if (response.statusCode == 200) {
      //debugPrint(response.body);
      List parsedJson = jsonDecode(response.body);
      //
      parsedJson.forEach((tweet) {
        tweetList.add(TweetModel.fromJson(tweet));
      });
    }
    return tweetList;
  }
}
