import 'package:flutter/material.dart';
import 'package:flutter_projects/memo_delegate.dart';

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
      home: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Scaffold(
          appBar: AppBar(
            title: Text("Monglle",
              style: TextStyle(
                color: Color(0xff49453E),
                fontSize: 50,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold
              ),
            ),
            centerTitle: false,
            backgroundColor: Colors.white,
            elevation: 0,
          ),
          body: Column(
            children: [
              MemoDelegate(
                folderName: 'Folder!',
                memoName: [
                  'memo1',
                  'memo1',
                  'memo1',
                  'memo1',
                  'memo1',
                  'memo1',
                  'memo1',
                  'memo1',
                  'memo1',
                ]
              ),
            ],
          )
        ),
      )
    );
  }
}
