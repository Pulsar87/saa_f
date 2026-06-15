import 'package:flutter/material.dart';
import '../../../../../../core/components/material-button-componat.dart';
import '../../../../../../core/constant/responsive/MediaQuery.dart';
import '../../../../../../core/router/animation_route.dart';
import '../../../../../../core/themes/text_style.dart';
import '../../../widgets/user-publish/insert-post-title.dart';
import '../../user-publish/insert-image-screen.dart';
import '../../user-publish/insert-viedo-screen.dart';
import 'add-article-with-photo.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);

    return Scaffold(
      appBar:
      AppBar(
        title: const Text('شارك بصناعة المحتوى',),),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              // margin: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                        "شاركنا شغف السماء!",
                        style: authTitleTextStyle()
                    ),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! / 50,
                  ),

                  const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: InsertPostTitle(
                      text:   "يمكنك المشاركة في صناعة المحتوى الفلكي، الصور، والفيديوهات، والأخبار الجديدة",),
                  ),

                  MaterialButtonComponent (
                    // horizontalPadding: 20,
                    buttonVerticalPadding: 5,
                    verticalMargin: 5,
                    child: Text("نشر مقال",
                      style: buttonTextStyle(fontSize: 25)
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MyAnimatedRoute(page: AddArticleWithPhoto()));
                      },
                  ),
                  MaterialButtonComponent (
                    buttonVerticalPadding: 10,
                    verticalMargin: 20,

                    child: Text("نشر صورة",
                        style: buttonTextStyle(fontSize: 25)
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MyAnimatedRoute(page: InsertImageScreen()));
                      },
                  ),
                  MaterialButtonComponent (
                    buttonVerticalPadding: 5,
                    verticalMargin: 5,

                    child: Text("نشر فيديو",
                        style: buttonTextStyle(fontSize: 25)
                    ),
                    onPressed: (){
                      Navigator.of(context).push(MyAnimatedRoute(page: InsertVideoScreen()));
                      },
                  ),

                  // MaterialButtonComponent (
                  //   child: Text("فتح محرر النصوص",
                  //       style: TextStyle(
                  //           fontSize: 25, fontWeight: FontWeight.bold
                  //       )
                  //   ),
                  //   onPressed: (){
                  //     Navigator.push(
                  //       context,
                  //       MaterialPageRoute(builder: (context) => TextEditor()),
                  //     );                },
                  // )
                ],
              ),
            ),
          ) ,
        ),
      ),
    );
  }
}
