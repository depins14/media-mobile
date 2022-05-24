import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/course_page.dart';
import 'package:media/cubit/page_cubit.dart';
import 'package:media/exam_page.dart';
import 'package:media/profile_dev_page.dart';
import 'package:media/theme.dart';
import 'package:media/user_guide_page.dart';
import 'package:media/widgets/custom_buttom_nav_item.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return CoursePage(); //menu materi
        case 1:
          return ExamPage(); //menu evaluasi
        case 2:
          return UserGuide(); //menu panduan
        case 3:
          return ProfileDev(); //menu profile
        default:
          return CoursePage(); //menu materi
      }
    }

//untuk mengatur posisi menu-menu yang ada di android
    Widget customButtomNavigation() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(),
          decoration: BoxDecoration(
            color: whiteColor,
            // borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomButtomNavigation(
                  index: 0, imageUrl: 'assets/icon_home.png'),
              CustomButtomNavigation(
                  index: 1, imageUrl: 'assets/icon_exam.png'),
              CustomButtomNavigation(
                  index: 2, imageUrl: 'assets/icon_petunjuk.png'),
              CustomButtomNavigation(
                  index: 3, imageUrl: 'assets/icon_help.png'),
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor:
              Color(0xffEEEEEE), //untuk mengganti baground di halaman materi
          body: Stack(
            children: [
              buildContent(currentIndex),
              customButtomNavigation(),
            ],
          ),
        );
      },
    );
  }
}
