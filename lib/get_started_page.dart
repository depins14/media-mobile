import 'package:flutter/material.dart';
import 'package:media/login_page.dart';
import 'package:media/theme.dart';

class GetStarted extends StatelessWidget {
  const GetStarted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Container(
            width: double.infinity,
            height: 238,
            margin: EdgeInsets.only(bottom: 55),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/image_get_started.png'),
              ),
            ),
          ),
          Text(
            'Belajar Dengan Mudah, \nDimana Saja, Kapan Saja',
            style: blackTextStyle.copyWith(
              fontWeight: semiBold,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false);
            },
            child: Container(
              width: double.infinity,
              height: 55,
              margin: EdgeInsets.only(bottom: 50, left: 24, right: 24),
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(18),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Get Started',
                    style: whiteTextStyle.copyWith(
                        fontWeight: medium, fontSize: 18),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
