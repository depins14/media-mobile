import 'package:flutter/material.dart';
import 'package:media/model/materi_model.dart';
import 'package:media/theme.dart';
import 'package:media/widgets/pilihan_item.dart';

class Ujian extends StatefulWidget {
  final MateriModel materi;
  const Ujian(this.materi, {Key? key}) : super(key: key);

  @override
  State<Ujian> createState() => _UjianState();
}

class _UjianState extends State<Ujian> {
  @override
  Widget build(BuildContext context) {
    Widget soal() {
      return Container(
        width: double.infinity,
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.only(
          bottom: 24,
          top: 10,
          left: 24,
          right: 24,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 15),
              child: Text(
                'Pertanyaan: 1',
                style: blackTextStyle,
              ),
            ),
            // Text("${widget.course.questions!.length}"),
            Text(
              '${widget.materi.questions?[0].pertanyaan}',
              style: blackTextStyle.copyWith(
                fontWeight: semiBold,
                fontSize: 16,
              ),
            ),
            SizedBox(height: 10),
            // Question
            Column(
              children: [
                Column(
                  children: [
                    Option(
                      id: 'a',
                      text: '${widget.materi.questions?[0].option1}',
                    ),
                    Option(
                      id: 'b',
                      text: '${widget.materi.questions?[0].option2}',
                    ),
                    Option(
                      id: 'c',
                      text: '${widget.materi.questions?[0].option3}',
                    ),
                    Option(
                      id: 'd',
                      text: '${widget.materi.questions?[0].option4}',
                    ),
                    Option(
                      id: 'e',
                      text: '${widget.materi.questions?[0].option5}',
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                soal(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
