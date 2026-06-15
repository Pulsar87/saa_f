import 'package:flutter/material.dart';

import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../category-item.dart';
import 'build-category-item.dart';

class CategoryItemsList extends StatelessWidget {
  const CategoryItemsList({
    super.key, required this.selectedCategory, required this.isImage,
  });
  final String selectedCategory;
  final bool isImage;
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
        itemBuilder: (context, index) => BuildCategoryItem(categoryName: categoryItem[index],selectedCategory: selectedCategory, isImage: isImage,),
        separatorBuilder: (context , index) => //line
        SizedBox(width: SizeConfig.screenWidth!/30
          ,),
        itemCount:categoryItem.length,
      ),
    );
  }
}
