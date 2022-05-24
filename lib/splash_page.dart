import 'dart:async';

import 'package:flutter/material.dart';
import 'package:media/login_page.dart';
import 'package:media/provider/materi_provider.dart';
import 'package:media/theme.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState

    getInit();
    super.initState();
  }

  getInit() async {
    await Provider.of<MateriProvider>(context, listen: false).getMateris();

    Timer(Duration(seconds: 3), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
      // yang seconds: 3 itu durasi transisi nya 3 detik
    });
  }

  @override
  Widget build(BuildContext context) {
    // Widget image => memanggil gambar
    Widget image() {
      return Align(
        alignment: Alignment.center,
        child: Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image_splash.png'),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      // warna background
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          // menyesuaikan lebar layar device
          width: MediaQuery.of(context).size.width,
          // menyesuaikan tinggi layar device
          height: MediaQuery.of(context).size.height,
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(),
                image(),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  child: Text(
                    'Media Pembelajaran \nAnimasi 2 Dimensi',
                    textAlign: TextAlign.center,
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
