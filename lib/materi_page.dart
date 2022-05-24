import 'package:flutter/material.dart';
import 'package:media/model/materi_model.dart';
import 'package:media/theme.dart';
import 'package:media/video_page.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class MateriPage extends StatefulWidget {
  final MateriModel materi;
  const MateriPage(this.materi, {Key? key}) : super(key: key);

  @override
  State<MateriPage> createState() => _MateriPageState();
}

class _MateriPageState extends State<MateriPage> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = YoutubePlayerController(
        initialVideoId: '${widget.materi.video}',
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
          loop: false,
          isLive: false,
          forceHD: true,
        ));
    super.initState();
  }

  @override
  //BUTTON VIDEO
  Widget build(BuildContext context) {
    Widget video() {
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
                backgroundColor: Color(0xffEEEEEE),
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
                          margin: EdgeInsets.symmetric(
                              horizontal: 24, vertical: 24),
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
                                '${widget.materi.ringkasan_materi}',
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

    Widget inkWell() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => video(),
              ),
            );
          },
          child: Container(
            width: double.infinity,
            height: 55,
            decoration: BoxDecoration(color: primaryColor),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.video_collection_rounded,
                  color: whiteColor,
                ),
                SizedBox(
                  width: 16,
                ),
                Text(
                  'Video',
                  style: whiteTextStyle.copyWith(
                      fontWeight: regular, fontSize: 16),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        iconTheme: IconThemeData(
          color: blackColor,
        ),
        centerTitle: true,
        title: Text(
          widget.materi.judul.toString(),
          style: blackTextStyle.copyWith(fontWeight: semiBold, fontSize: 18),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          SfPdfViewer.network(
            'http://media-backend.web.id/storage/${widget.materi.materi}',
          ),
          inkWell(),
        ],
      ),
    );
  }
}
