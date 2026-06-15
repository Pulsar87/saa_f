import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';

class PostListCategoryListItem extends StatelessWidget {
  const PostListCategoryListItem({super.key, required this.categoryName, required this.selectedCategory, });
  final String categoryName;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: () {
        //استدعاء توابع جلب البوست عن طريق الكاتيغوري
          print(categoryName);
          print("post list");
          print("post list");
          print("post list");
          context
              .read<PublishBloc>()
              .add(PostListChangeCategoryEvent());


          context
              .read<PublishBloc>()
              .add(PostListRequestEvent(
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
                    fontFamily: 'Handlee',
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
