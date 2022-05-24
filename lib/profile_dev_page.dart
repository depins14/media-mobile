import 'package:flutter/material.dart';
import 'package:media/login_page.dart';
import 'package:media/theme.dart';

class ProfileDev extends StatelessWidget {
  const ProfileDev({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget tombolLogout() {
      return Align(
        alignment: Alignment.topRight,
        child: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => LoginPage()));
          },
          child: Container(
            width: 120,
            height: 40,
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.white,
                ),
                Text(
                  'Logout',
                  style: whiteTextStyle,
                )
              ],
            ),
          ),
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        body: ListView(
          children: [
            tombolLogout(),
            Container(
              margin: EdgeInsets.only(top: 30),
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/img.png'),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 50, left: 24, right: 24),
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Depi Nopita Sari',
                        style: blackTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        '17076097',
                        style: blackTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        'Email:depinopitasari74@gmai.com',
                        style: blackTextStyle.copyWith(fontSize: 14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 24, right: 24),
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                children: [
                  Text(
                    'Mahasiswa Program Studi Pendidikan Teknik Informatika (S1) Jurusan Teknik Elektonika Fakultas Teknik Universitas Negeri Padang Tahun Masuk 2017',
                    style: blackTextStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 30, left: 24, right: 24),
              width: double.infinity,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Tentang Aplikasi',
                    style: blackTextStyle.copyWith(
                        fontWeight: semiBold, fontSize: 16),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    'Aplikasi Media Pembelajaran Interaktif pada mata pelajaran Teknik Animasi 2 Dimensi adalah Aplikasi Aplikasi Media Pembelajaran Animasi 2 Dimensi  pada kelas XI Multimedia dan aplikasi ini dilengkapi dengan video tutorial serta latihan dengan soal-soal yang dapat dijawab lagsungoleh siswa dalam aplikasi tersebut',
                    style: blackTextStyle.copyWith(fontSize: 14),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
    );
  }
}
