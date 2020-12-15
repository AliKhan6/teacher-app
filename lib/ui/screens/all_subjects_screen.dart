import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:teacher/core/constants/constants.dart';
import 'package:teacher/ui/custom_widgets/events.dart';
import 'package:teacher/ui/custom_widgets/lecture_work.dart';

class AllSubjectsScreen extends StatefulWidget {
  @override
  _AllSubjectsScreenState createState() => _AllSubjectsScreenState();
}

class _AllSubjectsScreenState extends State<AllSubjectsScreen> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
          backgroundColor: Colors.grey[200],
          body: Column(
            children: <Widget>[
              /// List of all the [lectures] and [Events]
              ///
              lecturesList(),
            ],
          ),
          /// Floating Action Button for add New Lecture
        ///
          floatingActionButton: FloatingActionButton(
            elevation: 0.0,
            backgroundColor: Theme.of(context).primaryColor,
            child: Icon(Icons.add,color: Colors.white,size: 35,),
          ),
                 ),
      /// Floating Action button in Center of Bottom Navigation Bar
      ///
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: EdgeInsets.only(bottom: 10.0,left: 15),
        child: FloatingActionButton(
          elevation: 0.0,
          backgroundColor: Theme.of(context).primaryColor,
          child: Image.asset('images/school.png'),
        ),
      ),
      /// Custom Bottom Navigation Bar
      ///
      bottomNavigationBar: customBottomNavigationBar(),
    );
  }

  Widget lecturesList(){
    return Container(
      height: MediaQuery.of(context).size.height*0.73,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 16),
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          Text('Mon, Jul 05, 2020',style: TextStyle(color: unSelectedColor),),
          Events(eventType: 'Advisory', eventName: 'Uniform Inspection',),
          Events(eventType: 'Event', eventName: 'Trip to Zoo',showTime: true, time: '09:00 AM',),
          Events(eventType: 'Parent Consent', eventName: 'Absence Leave for a day',showTime: true, time: '10:00 AM',),
          LectureWork(topic: 'Molecular System', subTopic: 'Short Quiz • Score 20',subject: 'Grade 3 - Apple • Science',showTime: true,),
          LectureWork(topic: 'Adaptation In Animals', subTopic: 'Assignment • Score 10',subject: 'Grade 4 - Pineapple • Science',showTime: false,),
          Events(eventType: 'Advisory', eventName: 'Uniform Inspection',),
          Events(eventType: 'Parent Consent', eventName: 'Absence Leave for a day',showTime: true, time: '10:00 AM',),
        ],
      ),
    );
  }


  Widget customBottomNavigationBar(){
    return Container(
      height: 55,
      child: CupertinoTabBar(
          currentIndex: pageIndex,
          onTap: (pageIndex){
            setState(() {
              this.pageIndex = pageIndex;
            });
          },
          activeColor: Theme.of(context).primaryColor,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              title: Text('ToDo'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message,size: 23,),
              title: Text('Message'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.store,size: 24,),
              title: Text('Score'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.content_copy,size: 23,),
              title: Text('More'),
            ),

          ]),
    );
//      Container(
//      decoration: BoxDecoration(
//        color: Colors.white,
//      ),
//      height: 60,
//      child: Row(
//        mainAxisAlignment: MainAxisAlignment.spaceAround,
//        children: <Widget>[
//          Padding(
//            padding: EdgeInsets.only(top: 6.0),
//            child: Column(
//              children: <Widget>[
//                Icon(Icons.list,color: Theme.of(context).primaryColor,),
//                Text('ToDo',style: TextStyle(color: Theme.of(context).primaryColor),)
//              ],
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(top: 6.0),
//            child: Column(
//              children: <Widget>[
//                Icon(Icons.message,color: unSelectedColor,),
//                Text('Message',style: TextStyle(color: unSelectedColor),)
//              ],
//            ),
//          ),
//          Container(),
//          Padding(
//            padding: EdgeInsets.only(top: 6.0),
//            child: Column(
//              children: <Widget>[
//                Icon(Icons.store,color: unSelectedColor,),
//                Text('Score',style: TextStyle(color: unSelectedColor),)
//              ],
//            ),
//          ),
//          Padding(
//            padding: EdgeInsets.only(top: 6.0),
//            child: Column(
//              children: <Widget>[
//                Icon(Icons.content_copy,color: unSelectedColor,),
//                Text('More',style: TextStyle(color: unSelectedColor),)
//              ],
//            ),
//          )
//        ],
//      ),
//    );
  }
}
