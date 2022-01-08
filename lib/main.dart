import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/networking/dio_helper.dart';
import 'package:news_app/home_layout.dart';
import 'cubit/bloc_observer.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

void main() {
  DioHelper.init();
  BlocOverrides.runZoned(
    () {
      // Use cubits...
    },
    blocObserver: MyBlocObserver(),
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit().get(context);

          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.orange,
                    unselectedItemColor: Colors.black),
                scaffoldBackgroundColor: Colors.white,
                appBarTheme: AppBarTheme(
                  backgroundColor: Colors.white,
                  elevation: 0,
                  backwardsCompatibility: false,
                  titleTextStyle: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  iconTheme: IconThemeData(color: Colors.black),
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark),
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                        fontWeight: FontWeight.bold))),
            darkTheme: ThemeData(
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    selectedItemColor: Colors.orange,
                    backgroundColor: Colors.black,
                    unselectedItemColor: Colors.grey),
                scaffoldBackgroundColor: Colors.black,
                appBarTheme: AppBarTheme(
                  titleTextStyle: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18),
                  iconTheme: IconThemeData(color: Colors.white),
                  backgroundColor: Colors.black,
                  elevation: 20,
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.black54,
                      statusBarIconBrightness: Brightness.light),
                ),
                textTheme: TextTheme(
                    bodyText1: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold))),
            themeMode: cubit.isDark ? ThemeMode.dark : ThemeMode.light,
            home: HomeLayout(cubit),
          );
        },
      ),
    );
  }
}
