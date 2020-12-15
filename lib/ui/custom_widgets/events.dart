import 'package:flutter/material.dart';

class Events extends StatelessWidget {
  final String eventType;
  final String eventName;
  final bool showTime;
  final String time;
  
  Events({this.eventType, this.eventName, this.showTime = false,this.time});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 12.0),
      child: Container(
        height: 58,
        decoration: BoxDecoration(
            color: Color(0xFFFFF4F4),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Theme.of(context).primaryColor)
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(eventType, style: TextStyle(color: Theme.of(context).primaryColor, fontSize: 10),),
                  Text(eventName, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),)
                ],
              ),
              showTime ? Container(
                height: 24,
                width: 65,
                decoration: BoxDecoration(
                  color: Colors.red[100],
                  borderRadius: BorderRadius.circular(3)
                ),
                child: Center(child: Text(time,style: TextStyle(fontSize: 10,color: Theme.of(context).primaryColor),)),
              ) : Container()
            ],
          ),
        ),
      ),
    );
  }
}
