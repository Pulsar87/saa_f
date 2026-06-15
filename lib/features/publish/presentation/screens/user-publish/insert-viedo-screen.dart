import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saa_f/core/components/screen_componant/loading_screen.dart';
import 'package:saa_f/core/themes/text_style.dart';
import '../../../../../core/components/material-button-componat.dart';
import '../../../../../core/components/under-line-text-filed-componant.dart';
import '../../../../../core/constant/colors/light-colors.dart';
import '../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../core/constant/strings-const.dart';
import '../../../data/repository/publish_repo.dart';
import '../../../domain/bloc/publish-bloc.dart';
import '../../../domain/bloc/publish-event.dart';
import '../../../domain/bloc/publish-state.dart';
import '../../widgets/category-item.dart';
import '../../widgets/publish-method.dart';
import '../../widgets/user-publish/insert-post-title.dart';

class InsertVideoScreen extends StatelessWidget {

  var descriptionController = TextEditingController();
  var videoUrlController = TextEditingController();
  var titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  String selectedDropdownItem = categoryItem[0];
  final PublishBloc publishBloc = PublishBloc(publishRepo: PublishRepo());

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return BlocProvider(
        create: (BuildContext context) => publishBloc,
        child: BlocListener<PublishBloc, PublishState>(
            listener: (context, state) {
              if (state is InsertVideoSuccessState ) {
                publishSuccessMethod(state, context , "بانتظار موافقة المشرف" , "تم رفع الفيديو", "pop");
              }
              else if (state is InsertVideoErrorState) {
                publishErrorCoolAlert(
                    state, context, StringConst.somethingWrong, StringConst.sorry);
              }
            },
            child: BlocBuilder<PublishBloc, PublishState>(
                builder: (context, state) {
                  return SafeArea(
                    child: Directionality(
                      textDirection: TextDirection.rtl,

                      child: Scaffold(
                        appBar: AppBar(title: Text ("نشر فيديو"),),
                        body: Center(
                          child:
                          state is InsertVideoLoadingState ?
                          MyLoadingScreen()
                              :
                          Container(
                            margin: const EdgeInsets.all(20),
                            child: SingleChildScrollView(
                              child: Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    InsertPostTitle(text:   "إن كان لديكَ فيديوهات فلكيةً مذهلة تريد عرضها على موقعنا، يمكنك مشاركتها معنا",),
                                    UnderLineTextFieldComponant(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      labelText: "رابط الفيديو",
                                      hintText: "أدخل رابط يوتيوب",
                                      suffixIcon: Icon(Icons.tv),
                                      controller: videoUrlController,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء إدخال رابط الفيديو";
                                        } else if (!validateYouTubeUrl(value)) {
                                          return "يرجى إدخال رابط يوتيوب صالح";
                                        }
                                        return null;
                                      },
                                    ),
                                    UnderLineTextFieldComponant(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      maxLength: 200,
                                      labelText: "عنوان الفيديو",
                                      hintText: "ضع عنواناً مناسباً",
                                      suffixIcon: Icon(Icons.description),
                                      controller: titleController,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء إدخال العنوان";
                                        }
                                      },
                                    ),
                                    UnderLineTextFieldComponant(
                                      horizontalPadding: 8,
                                      verticalPadding: 8,
                                      maxLength: 500,
                                      labelText: "وصف الفيديو",
                                      hintText: "أخبرنا بحكاية هذا الفيديو",
                                      suffixIcon: Icon(Icons.description),
                                      controller: descriptionController,
                                      validate: (value) {
                                        if (value!.isEmpty) {
                                          return "الرجاء إدخال وصف الفيديو";
                                        }
                                      },
                                    ),
                                    choseCategory(context),
                                    MaterialButtonComponent(
                                      verticalMargin: 16,
                                      onPressed: () {
                                        if (formKey.currentState!.validate()) {
                                          print("satart send");
                                          context
                                              .read<PublishBloc>()
                                              .add(InsertVideoRequestEvent(
                                              viedoUrl: videoUrlController.text,
                                              description: descriptionController.text,
                                              title: titleController.text,
                                              mediaCategory: selectedDropdownItem
                                          )
                                        );
                                        }
                                      },
                                      child: Text("إرسال",
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white
                                          )
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                }
                )
        )
    );
  }

  bool validateYouTubeUrl(String value) {
    final youtubeRegex = RegExp(
        r'^https?:\/\/(?:www\.)?youtube\.com\/(?:watch\?v=|embed\/|v\/|shorts\/)([a-zA-Z0-9_-]{11})');

    if (youtubeRegex.hasMatch(value)) {
      return true; // رابط يوتيوب صالح
    } else {
      return false; // رابط يوتيوب غير صالح
    }
  }

  Widget choseCategory(BuildContext context) {
   return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "تصنيف الفيديو",
              style: TextStyle(
                color: primaryColor,
                fontSize: 18,
                fontWeight: FontWeight.w900,
                overflow: TextOverflow.ellipsis,
              )
          ),
          Text(
              "الرجاء اختيار أحد التصنيفات:",
              style: TextStyle(
                color: Colors.grey[400],
                fontSize: 14,
                fontWeight: FontWeight.w900,
                overflow: TextOverflow.ellipsis,
              )
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.topCenter,

            child: Row(
              children: [

                Expanded(
                  child: DropdownButton<String>(
                    value: selectedDropdownItem,
                    items: categoryItem.map((String value) {
                      return DropdownMenuItem<String>(

                        value: value,
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                              value,
                              style: normalTextStyle()
                          ),
                        ),
                      );
                    }).toList(),
                    elevation: 1,

                    onChanged: (value) {
                      selectedDropdownItem = value!;
                      context
                          .read<PublishBloc>()
                          .add(InsertVideoChangItemEvent());
                    },
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}

