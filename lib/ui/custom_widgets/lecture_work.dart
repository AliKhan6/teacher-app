import 'package:flutter/material.dart';
import 'package:teacher/core/constants/constants.dart';

class LectureWork extends StatelessWidget {
  final String topic;
  final String subTopic;
  final String subject;
  final bool showTime;
  LectureWork({this.topic, this.subTopic, this.subject, this.showTime = true});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 8),
        height: 115,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Color(0xFFDEDEDE))
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(topic,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                Icon(Icons.more_vert)
              ],
            ),
            SizedBox(height: 2,),
            Text(subTopic,style: TextStyle(fontSize: 10,color: unSelectedColor),),
            Divider(height: 25.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Image.asset('images/profile.png',height: 32,width: 32,),
                    SizedBox(width: 8,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text('Tony Stark',style: TextStyle(color: unSelectedColor,fontSize: 13),),
                        Text(subject,style: TextStyle(color: unSelectedColor,fontSize: 10),)
                      ],
                    ),
                  ],
                ),
                showTime ? Container(
                  height: 24,
                  width: 65,
                  decoration: BoxDecoration(
                      color: Colors.red[100],
                      borderRadius: BorderRadius.circular(3)
                  ),
                  child: Center(child: Text('12:00 PM',style: TextStyle(fontSize: 10,color: Theme.of(context).primaryColor),)),
                ) :
                Container(
                  height: 24,
                  width: 65,
                  decoration: BoxDecoration(
                      color: Color(0xFFD9D7D7),
                      borderRadius: BorderRadius.circular(3)
                  ),
                  child: Center(child: Text('Draft',style: TextStyle(fontSize: 10,color: unSelectedColor),)),
                )
              ],
            ),

          ],
        ),
      ),
    );
  }
}
