import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../reusable_items/article_item.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../reusable_items/item_divider.dart';

class Science extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit().get(context).science;
        return ConditionalBuilder(
            condition: state is! NewsScienceLoadingsState,
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
