import 'package:flutter/material.dart';
import 'app_info.dart';

class Home extends StatelessWidget {

  // Home view has a dependency on the AppInfo
  AppInfo? appInfo;

  Home({Key? key, this.appInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Colors.white,
          )
        ],
      ),
    );
  }
}
