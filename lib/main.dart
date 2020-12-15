import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teacher/core/view_models/subjects_view_model.dart';
import 'package:teacher/ui/screens/root_screen.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => SubjectsViewModel()),
        ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Teacher',
        theme: ThemeData(
          primaryColor: Color(0xFFF15455),
        ),
        home: RootScreen(),
      ),
    );
  }
}

