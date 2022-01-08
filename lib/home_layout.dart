import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';

class HomeLayout extends StatelessWidget {
  NewsCubit cubit;
  HomeLayout(this.cubit);
  @override
  Widget build(BuildContext context) {
    cubit = BlocProvider.of<NewsCubit>(context);
    return BlocProvider(
      create: (BuildContext context) => cubit
        ..getBusiness()
        ..getSports()
        ..getScience(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {
          print("fatmaCubit");
        },
        builder: (context, state) {
          var cubit = NewsCubit().get(context);
          print("fatmaCubit $state");
          if (state is NewsChangeAppModeState) {
            print("Fatma mode changed");
          }

          return Scaffold(
            appBar: AppBar(
              elevation: 10,
              title: Text(
                'News App',
                // style:
                //     TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
              ),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.search),
                  // color: Colors.black87,
                ),
                IconButton(
                  onPressed: () {
                    // cubit..getSports();
                    // cubit..getSports();
                    BlocProvider.of<NewsCubit>(context)..changeThemeMode();
                  },
                  icon: Icon(Icons.settings),
                  // color: Colors.black87,
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              items: cubit.items,
              type: BottomNavigationBarType.fixed,
              currentIndex: cubit.currentIndex,
              onTap: (index) {
                cubit.changeNavigationBar(index);
              },
            ),
            body: cubit.screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
