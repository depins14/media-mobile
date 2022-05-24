import 'package:flutter/material.dart';
import 'package:media/model/materi_model.dart';
import 'package:media/theme.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoPage extends StatefulWidget {
  final MateriModel materi;
  const VideoPage(this.materi, {Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _controller = YoutubePlayerController(
        initialVideoId: '9LyWndBgGzY',
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          loop: false,
          isLive: false,
          forceHD: true,
        ));
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayerBuilder(
        player: YoutubePlayer(
          controller: _controller,
          showVideoProgressIndicator: true,
          progressIndicatorColor: Colors.red,
          topActions: [
            SizedBox(
              width: 8.8,
            ),
            Expanded(
              child: Text(
                _controller.metadata.title,
                style: TextStyle(
                  color: whiteColor,
                  fontSize: 18,
                ),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
        builder: (context, player) => Scaffold(
              backgroundColor: Colors.blue,
              appBar: AppBar(
                backgroundColor: kBackgroundColor,
                iconTheme: IconThemeData(
                  color: blackColor,
                ),
                centerTitle: true,
                title: Text(
                  'Judul Materi',
                  style: blackTextStyle.copyWith(
                      fontWeight: semiBold, fontSize: 18),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                elevation: 0,
              ),
              body: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(18),
                            child: player),
                      ),
                      Container(
                        width: double.infinity,
                        margin: EdgeInsets.only(top: 10, left: 24, right: 24),
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: whiteColor,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Ringkasan Materi',
                              style: blackTextStyle.copyWith(
                                fontWeight: semiBold,
                                fontSize: 18,
                              ),
                            ),
                            SizedBox(
                              height: 16,
                            ),
                            Text(
                              'ringkasan',
                              style: blackTextStyle.copyWith(
                                  fontWeight: light, fontSize: 14),
                              textAlign: TextAlign.justify,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ));
  }
}
