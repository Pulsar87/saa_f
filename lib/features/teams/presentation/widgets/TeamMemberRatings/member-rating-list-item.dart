import 'package:flutter/material.dart';

class MemberRatingListItem extends StatelessWidget {
  const MemberRatingListItem({
    super.key, required this.count, required this.date,
  });
  final int count;
  final String date;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
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
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(child: Text(date,style: Theme.of(context).textTheme.bodyLarge,)),
          ListView.separated(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,

              itemBuilder: (context,index) =>  Icon(Icons.star, color: Colors.amber,size: 40,),
              separatorBuilder: (context , index) => const SizedBox(width: 5,),
              itemCount: count),
        ],
      ),
    );
  }
}
