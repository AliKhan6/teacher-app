import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher/core/constants/constants.dart';
import 'package:teacher/core/view_models/subjects_view_model.dart';
import 'package:teacher/ui/custom_widgets/model_bottom_sheet.dart';
import 'package:teacher/ui/screens/all_subjects_screen.dart';
import 'package:teacher/ui/screens/science_screen.dart';

class RootScreen extends StatefulWidget {
  @override
  _RootScreenState createState() => _RootScreenState();
}

class _RootScreenState extends State<RootScreen> {
  int length = 2;
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<SubjectsViewModel>(context);
    return DefaultTabController(
      ///
      /// Numbers of tabs
      length: length,
      child: Scaffold(
        /// App Bar .... Having Profile Pic and Title of the Page
        ///
          appBar: appBar(provider.subjects, provider.subjects.length),
          body: TabBarView(
            children: [
              ///
              /// Screens
              ///
              ScienceScreen(),
              AllSubjectsScreen(),
            ],
          ),
        ),
    );
  }

  appBar(subjects, length){
    return AppBar(
      backgroundColor: Colors.white,
      title: Container(
        height: 45,
        child: Container(
          decoration: BoxDecoration(
              border: Border.all(color: Color(0xFFECECEC)),
              borderRadius: BorderRadius.circular(5)
          ),
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Image.asset('images/profile.png'),
              Row(
                children: <Widget>[
                  Consumer<SubjectsViewModel>(
                    builder: (context, model, child){
                      return Text(model.pageTitle,style: TextStyle(color: Theme.of(context).primaryColor,fontSize: 16),);
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.keyboard_arrow_down,color: Theme.of(context).primaryColor,),
                    onPressed: (){
                      modelBottomSheet(context, subjects, length);
                    },
                  ),
                ],
              ),
              Icon(Icons.more_vert,color: Theme.of(context).primaryColor,size: 28,),
            ],
          ),
        ),
      ),
      ///
      /// Tab bar Names
      bottom: TabBar(
        unselectedLabelColor: unSelectedColor,
        labelColor: Colors.black,
        indicatorColor: Theme.of(context).primaryColor,
        tabs: [
          Padding(
            padding: EdgeInsets.only(bottom: 14.0),
            child: Text('Science'),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 14.0),
            child: Text('All Subjects'),
          ),
        ],
      ),
    );
  }
}
