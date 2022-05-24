import 'package:flutter/material.dart';
import 'package:media/login_page.dart';
import 'package:media/model/materi_model.dart';
import 'package:media/model/user_model.dart';
import 'package:media/provider/auth_provider.dart';
import 'package:media/provider/materi_provider.dart';
import 'package:media/theme.dart';
import 'package:media/widgets/card_course_item.dart';
import 'package:provider/provider.dart';

class CoursePage extends StatelessWidget {
  const CoursePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    UserModel user = authProvider.user;
    MateriProvider materiProvider = Provider.of<MateriProvider>(context);

    Widget header() {
      //untukmenampilkan nama di diatas di halaman materi
      return Container(
        margin: EdgeInsets.only(left: 24, right: 24, top: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Halo, \n${user.name}',
                    style: blackTextStyle.copyWith(
                      fontSize: 24,
                      fontWeight: semiBold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white, shape: BoxShape.circle),
                  child: Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage('${user.profilePhotoUrl}'),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 6),
            Container(
              margin: EdgeInsets.only(bottom: 25),
              child: Text(
                'Ingin belajar apa hari ini?',
                style: grayTextStyle.copyWith(
                  fontWeight: light,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      );
    }

    Widget learn() {
      //menu materi untuk membuat perulangan materi
      return Column(
          children: materiProvider.materis
              .map((materi) => CardCourse(materi))
              .toList());
    }

    Widget tombolLogout() {
      return Container(
        margin: EdgeInsets.only(right: 24),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            backgroundColor: const Color(0xff03dac6),
            foregroundColor: Colors.black,
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            },
            child: Icon(Icons.logout),
          ),
        ),
      );
    }

    return SafeArea(
      child: ListView(
        children: [
          header(),
          learn(),
          // tombolLogout(),
          Container(
            margin: EdgeInsets.only(bottom: 80),
          ),
        ],
      ),
    );
  }
}
