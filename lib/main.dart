import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // MaterialApp : google이 제공한 Material 앱 스타일을 제공한다.
    // Cupertino* : apple 느낌의 앱 스타일을 제공한다.
    return MaterialApp(
      // home: Text("hello, world 앙뇽!")
      // home: Image.asset('assets/madeline.png') // pubspec.yml 파일에 `assets` 디렉터리 등록 필수
      // home: Center(
      //   // 자식 위젯 생성
      //   child: Container(width: 50, height: 50, color: Colors.blue)
      // )
      home: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: Text("hello, title!")
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(Icons.star),
            Icon(Icons.star),
            Icon(Icons.star),
          ],
        ),
        bottomNavigationBar: BottomAppBar(
          child: Padding(
            padding: const EdgeInsets.all(100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const[
                Icon(Icons.phone),
                Icon(Icons.message),
                Icon(Icons.contact_page),
              ],
            ),
          ),
        ),
      )
    );
  }
}
