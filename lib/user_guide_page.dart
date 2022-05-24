import 'package:flutter/material.dart';
import 'package:media/theme.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class UserGuide extends StatelessWidget {
  const UserGuide({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Panduan ',
          style: blackTextStyle.copyWith(
            fontWeight: semiBold,
            fontSize: 18,
          ),
        ),
        centerTitle: true,
      ),
      body: SfPdfViewer.asset('assets/panduan.pdf'),
    );
  }
}
