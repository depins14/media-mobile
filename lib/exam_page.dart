import 'package:flutter/material.dart';
import 'package:media/provider/materi_provider.dart';
import 'package:media/theme.dart';
import 'package:media/widgets/card_exam_item.dart';
import 'package:provider/provider.dart';

class ExamPage extends StatelessWidget {
  const ExamPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MateriProvider materiProvider = Provider.of<MateriProvider>(context);
    Widget learn() {
      return Column(
          children: materiProvider.materis
              .map((materi) => CardExam(materi))
              .toList());
    }

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Evaluasi',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 18,
            ),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0,
        ),
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.only(top: 30),
            ),
            learn(),
          ],
        ),
      ),
    );
  }
}
