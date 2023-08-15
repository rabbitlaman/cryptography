import 'package:flutter/material.dart';
  import 'package:url_launcher/url_launcher.dart';


class VideoForLearn extends StatefulWidget {
  const VideoForLearn({super.key});

  @override
  State<VideoForLearn> createState() => _VideoForLearnState();
}

class _VideoForLearnState extends State<VideoForLearn> {
  @override
  final List<String> videoItems = [
    '密碼學經典歷史',
    '',
    '',
    '',
    '',
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('YT經典密碼學影片'),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: videoItems.length,
          itemBuilder: (context, index) {
            return VideoItemCard(videoTitle: videoItems[index], indexn: index);
          },
        ),
      ),
    );
  }
}

class VideoItemCard extends StatelessWidget {
  final String videoTitle;
  final int indexn;
  VideoItemCard({required this.videoTitle, required this.indexn});
  final List<String> YTUrl = [
    'https://www.youtube.com/watch?v=yH3K9Yhdr68&ab_channel=%E6%9F%B4%E7%9F%A5%E9%81%93ChaiKnowsOfficialChannel',
    'https://www.youtube.com/watch?v=kHwTYgktGlM&ab_channel=PanSci%E6%B3%9B%E7%A7%91%E5%AD%B8',
    'https://www.youtube.com/watch?v=4AV0LEQTNTc&ab_channel=TainingLu',
    'https://www.youtube.com/watch?v=dgNyGjwwYpk&ab_channel=%E6%9D%8E%E6%B0%B8%E4%B9%90%E8%80%81%E5%B8%88',
    'https://www.youtube.com/watch?v=SkJcmCaHqS0&ab_channel=Udacity',
  ];


  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 20),
            TextButton(
              style: TextButton.styleFrom(
                primary: Colors.black, // Background color
              ),
              child: Text(videoTitle,
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold,)),
              onPressed: () {
                launch(
                    YTUrl[indexn],
                    enableJavaScript: true,
                    forceWebView: false,
                    forceSafariVC: false
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
