import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';

class ArticleListCategoryListItem extends StatelessWidget {
  const ArticleListCategoryListItem({super.key, required this.categoryName, required this.selectedCategory, });
  final String categoryName;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        //استدعاء توابع جلب البوست عن طريق الكاتيغوري
        print(categoryName);
        print("article list");
        print("article list");
        print("article list");
        context
            .read<PublishBloc>()
            .add(ArticleListChangeCategoryEvent());


        context
            .read<PublishBloc>()
            .add(ArticleListRequestEvent(
            categoryName: categoryName, limit: 10, skip: 0));
      },
      child: Container(
          decoration: BoxDecoration(
            color: selectedCategory == categoryName ? primaryColor : Colors.grey.withOpacity(0.7),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0,horizontal: 16),
            child: Center(
              child: Text(categoryName ,
                  style:TextStyle(
                    fontSize: 20,
                    fontWeight: selectedCategory == categoryName ? FontWeight.bold : FontWeight.normal,

                    color: selectedCategory == categoryName ? Colors.white : Colors.black,

                  )
              ),
            ),
          )
      ),
    );
  }
}
