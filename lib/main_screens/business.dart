import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/reusable_items/article_item.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/reusable_items/item_divider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../cubit/states.dart';

class Business extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit().get(context).business;
        return ConditionalBuilder(
            condition: state is! NewsLoadingsState,
            builder: (context) => ListView.separated(
                  itemBuilder: (context, index) {
                    return buildArticleItem(list[index], context);
                  },
                  separatorBuilder: (context, index) => buildItemDivider(),
                  itemCount: list.length,
                ),
            fallback: (context) => Center(
                  child: CircularProgressIndicator(),
                ));
      },
    );
  }
}
