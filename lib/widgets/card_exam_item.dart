import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:media/model/materi_model.dart';
import 'package:media/theme.dart';
import 'package:media/ujian_page.dart';

// ignore: must_be_immutable
class CardExam extends StatelessWidget {
  final MateriModel materi;

  CardExam(
    this.materi, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        await openUrl('${materi.soal}');
      },
      child: Container(
        height: 99,
        width: double.infinity,
        margin: EdgeInsets.only(
          left: 24,
          right: 24,
          bottom: 24,
        ),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(18),
        ),
        child: Row(
          children: [
            Container(
              width: 86,
              height: 80,
              margin: EdgeInsets.only(top: 10, left: 10, bottom: 10, right: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                image: DecorationImage(
                  image: NetworkImage(
                      'http://media-backend.web.id/storage/${materi.thumbnail}'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(top: 22, bottom: 21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${materi.judul}',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 14,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Text(
                      '${materi.kd?.kd}',
                      style: grayTextStyle.copyWith(
                        fontWeight: medium,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> openUrl(String url,
    {bool forcewebView = false, bool enableJavaScript = false}) async {
  await launch(url);
}
