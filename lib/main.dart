import 'package:flutter/material.dart';
import 'dep_injection/home_page.dart';
import 'inherited-widget/page/main_page.dart';
import 'inherited-widget/widget/state_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String title = 'Inherited Widget';

  @override
  Widget build(BuildContext context) => StateWidget(
        child: Builder(
          builder: (context){
            final state = StateInheritWidget.of(context).state;
            return MaterialApp(
              title: 'Flutter Demo',
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                scaffoldBackgroundColor: state.bgColor,
                primaryColor: Colors.black
              ),
              home: const MainPage(
                title: title,
              ),
            );
          }
        ),
      );
}
