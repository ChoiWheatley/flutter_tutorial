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
        body: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            child: Text('hello!!!'),
            width: double.infinity, height: 50, margin: EdgeInsets.all(20),
            padding: EdgeInsets.fromLTRB(5, 10, 5, 10),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
              color: Colors.black12,
            ),
          ),
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
