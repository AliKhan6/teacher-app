import 'package:flutter/cupertino.dart';
import 'package:teacher/core/models/subjects.dart';

class SubjectsViewModel extends ChangeNotifier{
  int groupValue = 0;
  String pageTitle = 'Grade 3 - Apple';
  List<Subjects> subjects = [
    Subjects(
      name: 'Grade 3 - Apple',
      isChecked: true,
    ),
    Subjects(
      name: 'Grade 3 - banana',
      isChecked: false,
    ),
    Subjects(
      name: 'Grade 4 - Rose',
      isChecked: false,
    ),
    Subjects(
      name: 'Grade 5 - New',
      isChecked: false,
    ),
  ];

  changeRadioValue(index){
    print(index);
    subjects[index].isChecked = subjects[index].isChecked == true ? false : true;
    groupValue = index;
    pageTitle = subjects[index].name;
    notifyListeners();
  }
}