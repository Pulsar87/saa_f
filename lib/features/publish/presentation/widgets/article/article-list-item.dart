import 'package:flutter/material.dart';
import '../../../../../core/constant/assets-const.dart';
import '../post/post-time.dart';
import '../post/post-user-info.dart';
import 'article-category-list-item.dart';
import 'article-post-like.dart';
import 'article-post-text.dart';

class ArticleListItem extends StatelessWidget {
  const ArticleListItem({
    super.key,
    required this.originalText,
  });

  final String originalText;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.all(10),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: 8,
              vertical: 8
          ),
          padding: EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 8,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children:[
              PostUserInfo(userName: "user", userPhoto:  null),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Center(
                            child: ArticleListCategoryListItem(categoryName:"category" , selectedCategory: "selectedCategory",)),
                      ],
                    ),
                  ) ,
                ],
              ),
              Center(child: Image(image: AssetImage(AssetsConst.wallpaper3))),
              ArticlePostText(articleText: originalText),
              ArticlePostLike (id :2,likesCount: 2,isLike: true),
              PostTime(time: "time",date: "date"),

            ],
          ),
        ),
      ),
    );
  }
}
