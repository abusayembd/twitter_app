import 'package:flutter/material.dart';
import 'package:twitter_app/data/datasources/tweet_datasource.dart';
import 'package:twitter_app/data/models/tweet_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: TweetDatasource.getAllTweets(),
      builder: (BuildContext context, AsyncSnapshot sn) {
        if (sn.hasError) {
          return Text("Error Data ${sn.error}");
        }
        if (sn.hasData) {
          List<TweetModel> tweets = sn.data;
          return ListView.builder(
              itemCount: tweets.length,
              itemBuilder: (BuildContext context, int index) => ListTile(
                    leading: const CircleAvatar(),
                    title: Text("${tweets[index].writter}"),
                    subtitle: Text(" ${tweets[index].tweet}"),
                  ));
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
//     return ListView.builder(
//       itemBuilder: (context, index) => Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListTile(
//           leading: const CircleAvatar(
//             backgroundImage: NetworkImage("https://i.pravatar.cc/300"),
//           ),
//           title: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: const [
//               Text("Rahim Molla"),
//               Text(
//                 "2023-01-05T14:20:47.491Z",
//                 style: TextStyle(fontSize: 12.0),
//               ),
//             ],
//           ),
//           subtitle: const Text(
//               "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."),
//         ),
//       ),
//     );
  }
}
