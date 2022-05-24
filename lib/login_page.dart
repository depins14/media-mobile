import 'package:flutter/material.dart';
import 'package:media/home_page.dart';
import 'package:media/provider/auth_provider.dart';
import 'package:media/theme.dart';
import 'package:media/widgets/loading_button.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController nisController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);

    handleSignIn() async {
      setState(() {
        isLoading = true;
      });

      if (await authProvider.login(
        nis: nisController.text,
        password: passwordController.text,
      )) {
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => HomePage()),
            (route) => false);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(
              'Gagal Login',
              textAlign: TextAlign.center,
            ),
          ),
        );
      }

      setState(() {
        isLoading = false;
      });
    }

    Widget inputSection() {
      Widget emailInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'NIS',
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: nisController,
                cursorColor: blackColor,
                decoration: InputDecoration(
                    hintText: 'NIS',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                      borderSide: BorderSide(
                        color: blackColor,
                      ),
                    )),
              )
            ],
          ),
        );
      }

      Widget passwordInput() {
        return Container(
          margin: EdgeInsets.only(bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Password',
                style: blackTextStyle.copyWith(
                  fontWeight: regular,
                ),
              ),
              SizedBox(
                height: 6,
              ),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                cursorColor: blackColor,
                decoration: InputDecoration(
                  hintText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                    borderSide: BorderSide(
                      color: blackColor,
                    ),
                  ),
                ),
              )
            ],
          ),
        );
      }

      Widget buttonSignIn() {
        return GestureDetector(
          onTap: handleSignIn,
          child: Container(
            width: double.infinity,
            height: 55,
            margin: EdgeInsets.only(
              top: 50,
              bottom: 50,
            ),
            decoration: BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.circular(18),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sign In',
                  style:
                      whiteTextStyle.copyWith(fontWeight: medium, fontSize: 18),
                ),
              ],
            ),
          ),
        );
      }

      return Container(
        width: 327,
        // height: 323,
        margin: EdgeInsets.only(
          top: 66,
        ),
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(color: whiteColor),
        child: Column(
          children: [
            emailInput(),
            passwordInput(),
            isLoading ? LoadingButton() : buttonSignIn(),
          ],
        ),
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffEEEEEE),
        body: Container(
            margin: EdgeInsets.symmetric(
              vertical: 30,
              horizontal: 24,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
            ),
            child: ListView(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Login',
                      style: blackTextStyle.copyWith(
                        fontWeight: semiBold,
                        fontSize: 24,
                      ),
                    ),
                    inputSection(),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
