import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/pages/homepage.dart';
import 'package:todo/provider/ToDoprovider.dart';

Future main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ToDoProvider(),
      child: MaterialApp(
        color: Colors.grey[300],
        debugShowCheckedModeBanner: false,
        title: 'To Do App',
        home: HomePage(),
      ),
    );
  }
}
