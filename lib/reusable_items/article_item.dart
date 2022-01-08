import 'package:flutter/material.dart';
import 'package:news_app/networking/dio_helper.dart';

Widget buildArticleItem(Article article, context) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      children: [
        Container(
          width: 120,
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${article.urlToImage}'),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
          child: Container(
            height: 120,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Text('${article.title}', //list['title']
                        textDirection: TextDirection.ltr,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodyText1)),
                Text(
                  '${article.publishedAt}', //list['publishedAt']
                  style: TextStyle(color: Colors.grey),
                )
              ],
            ),
          ),
        )
      ],
    ),
  );
}
