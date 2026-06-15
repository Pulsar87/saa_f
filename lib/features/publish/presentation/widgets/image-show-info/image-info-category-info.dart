import 'package:flutter/material.dart';

import '../image-list/build-category-item.dart';

class ImageInfoCategoryInfo extends StatelessWidget {
  ImageInfoCategoryInfo({
    super.key, required this.category, required this.selectedCategory,
  });

  final String category;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Center(
              child: BuildCategoryItem(categoryName:category , selectedCategory: selectedCategory, isImage: true,)),
        ],
      ),
    );
  }
}
