import 'package:flutter/material.dart';

import 'aricle-publish-requests-list-item.dart';

class ArticlePublishRequestList extends StatelessWidget {
  const ArticlePublishRequestList({
    super.key, required this.articleList,
  });
  final  List <dynamic> articleList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.separated(
        shrinkWrap: true,
        physics:const BouncingScrollPhysics(),
        itemBuilder: (context, index) =>
            ArticlePublishRequestListItem(
              title: articleList[index]['title'],
              id: articleList[index]['id'],
              time: articleList[index]['created_at_relative'],
              userImageUrl: articleList[index]['user_img']?? null,
              userName:articleList[index]['user_name'],
            ),
        separatorBuilder: (context , index) => const SizedBox(height: 8,),
        itemCount: articleList.length,
      ),
    );
  }
}
