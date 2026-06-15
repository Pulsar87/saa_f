import 'package:flutter/material.dart';
import 'package:saa_f/features/publish/presentation/widgets/post/post-list-category-list-item.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../category-item.dart';
import '../image-list/build-category-item.dart';

class PostListCategoryList extends StatelessWidget {
  const PostListCategoryList({
    super.key, required this.selectedCategory,
  });
  final String selectedCategory;
  @override

  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Container(
      //     width: double.infinity,
      height: 40,
      margin: EdgeInsets.symmetric(vertical: 20,horizontal: 10),
      child: ListView.separated(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(), //صنع حركة عند نهاية الليست
        itemBuilder: (context, index) => PostListCategoryListItem(categoryName: categoryItem[index],selectedCategory: selectedCategory),
        separatorBuilder: (context , index) => //line
        SizedBox(width: SizeConfig.screenWidth!/30
          ,),
        itemCount:categoryItem.length,
      ),
    );
  }
}
