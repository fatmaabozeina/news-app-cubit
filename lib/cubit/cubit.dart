import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/main_screens/business.dart';

import 'package:news_app/cubit/states.dart';
import 'package:news_app/networking/dio_helper.dart';
import 'package:news_app/main_screens/science.dart';
import 'package:news_app/main_screens/sports.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:news_app/networking/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  NewsCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  void changeNavigationBar(int index) {
    currentIndex = index;
    emit(ChangeNavigationBarState());
  }

  List<BottomNavigationBarItem> items = [
    BottomNavigationBarItem(icon: Icon(Icons.business), label: 'Business'),
    BottomNavigationBarItem(icon: Icon(Icons.sports), label: 'Sports'),
    BottomNavigationBarItem(icon: Icon(Icons.science), label: 'science'),
  ];
  List<Widget> screens = [
    Business(),
    Sports(),
    Science(),
  ];
  List<Article> business = [];
  List<Article> sports = [];
  List<Article> science = [];
  void getBusiness() {
    emit(NewsLoadingsState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'business',
      'apikey': '66298930cfa1481ab86bef0af59c1820'
    }).then((value) {
      debugPrint("success");
      business = value.articles;
      print(business);
      emit(NewsBusinessSuccessfulState());
    }).catchError((onError) {
      print(onError.toString());
      print('fatme');
      emit(NewsBusinessErrorState(onError));
    });
  }

  void getSports() {
    emit(NewsSportsLoadingsState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'sports',
      'apikey': '66298930cfa1481ab86bef0af59c1820'
    }).then((value) {
      debugPrint("success");
      sports = value.articles;
      print(sports);
      emit(NewsSportsSuccessfulState());
    }).catchError((onError) {
      print(onError.toString());
      print('fatme');
      emit(NewsSportsErrorState(onError));
    });
  }

  void getScience() {
    emit(NewsScienceLoadingsState());
    DioHelper().getData(url: 'v2/top-headlines', query: {
      'country': 'eg',
      'category': 'science',
      'apikey': '66298930cfa1481ab86bef0af59c1820'
    }).then((value) {
      debugPrint("success");
      science = value.articles;
      print(science);
      emit(NewsScienceSuccessfulState());
    }).catchError((onError) {
      print(onError.toString());
      print('fatme');
      emit(NewsScienceErrorState(onError));
    });
  }

  bool isDark = true;
  void changeThemeMode() {
    isDark = !isDark;
    print('hello$isDark');
    emit(NewsChangeAppModeState());
  }
}
