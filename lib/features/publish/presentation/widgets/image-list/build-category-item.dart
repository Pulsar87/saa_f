import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';

class BuildCategoryItem extends StatelessWidget {
  const BuildCategoryItem({super.key, required this.categoryName, required this.selectedCategory, required this.isImage});
  final String categoryName;
  final String selectedCategory;
  final bool isImage;

  @override
  Widget build(BuildContext context) {
    return BlocListener<PublishBloc, PublishState>(
        listener: (context, state) {},
      child: BlocBuilder<PublishBloc, PublishState>(
          builder: (context, state) {
            return  InkWell(
              onTap: () {
                //استدعاء توابع جلب الصور عن طريق الكاتيغوري للصور
                if (isImage) {
                  print(categoryName);
                  print("Image list");
                  context
                      .read<PublishBloc>()
                      .add(ImageListChangeCategoryEvent());


                  context
                      .read<PublishBloc>()
                      .add(ImageCategoryListRequestEvent(
                      categoryName: categoryName, limit: 10, skip: 0));
                } //توابع جلب الفيديو عن طريق الكاتيغوري
                else {
                  print(categoryName);
                  print("Video list");

                  context
                      .read<PublishBloc>()
                      .add(VideoListChangeCategoryEvent());

                  context
                      .read<PublishBloc>()
                      .add(VideoCategoryListRequestEvent(
                      categoryName: categoryName, limit: 10, skip: 0));

                }
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
      ),
    );
  }
}
