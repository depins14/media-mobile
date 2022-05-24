import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:media/cubit/option_cubit.dart';
import 'package:media/cubit/page_cubit.dart';
import 'package:media/get_started_page.dart';
import 'package:media/provider/auth_provider.dart';
import 'package:media/provider/materi_provider.dart';
import 'package:media/splash_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // PageCubit => mengatur untuk berpindah halaman dengan tombol yang terdapat di bawah pada aplikasi
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (create) => OptionCubit(),
        ),
      ],
      child: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AuthProvider()),
          ChangeNotifierProvider(create: (context) => MateriProvider()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          routes: {
            '/': (context) => const SplashPage(),
          },
        ),
      ),
    );
  }
}
