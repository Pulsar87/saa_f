import 'package:flutter/material.dart';
import 'package:saa_f/core/constant/app-const.dart';
import 'package:saa_f/core/constant/colors/light-colors.dart';
import 'package:saa_f/core/themes/text_style.dart';

class OneActivityInfoScreen extends StatelessWidget {
  const OneActivityInfoScreen({super.key, required this.name, required this.date, required this.description,
    // required this.place,
    required this.age, required this.imgUrl, required this.Activivtyimges, required this.time});
  final String name;
  final String date;
  final String description;
  // final String place;
  final String time;
  final String age;
  final String imgUrl;
  final List<dynamic>? Activivtyimges;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network("${AppConst.imgUrl}$imgUrl"),
              SizedBox(height: 20,),
              Center(child: Text(name,style: normalTextStyle(),)),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                    BoxShadow(color: Colors.grey[400]!,
                    offset: Offset(-5.0,5.0),
                      blurRadius: 10,

                    ),
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(description,style: normalTextStyle(),),
                    Row(
                      children: [
                        Text("الفئة العمرية:   ",style: normalTextStyle(color: primaryColor),),
                        Expanded(child: Text(age,style: normalTextStyle(),))
                      ],
                    ),
                    Row(
                      children: [
                        Text("تاريخ النشاط:   ",style: normalTextStyle(color: primaryColor),),
                        Expanded(child: Text(date,style: normalTextStyle(),))
                      ],
                    ),
                    Row(
                      children: [
                        Text("وقت النشاط: ",style: normalTextStyle(color: primaryColor),),
                        Align(
                          alignment: Alignment.centerRight,
                            child: Expanded(child: Directionality(textDirection: TextDirection.ltr, child: Text(time,style: normalTextStyle(),))))
                      ],
                    ),

                  ],
                ),
              ),
              if(Activivtyimges!=null)
                if(Activivtyimges!.isNotEmpty)
                  Column(
                    children: [
                      SizedBox(height: 20,),
                      Text("شاهد ماذا نفعل بنشاطاتنا المذهلة",style: normalTextStyle(fontSize: 18),),
                      ListView.separated(
                        shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemBuilder: (context, index) => Image.network("${AppConst.imgUrl}${Activivtyimges![index]}"),
                          separatorBuilder: (context, index) => SizedBox(height: 10,),
                          itemCount: Activivtyimges!.length)
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}
