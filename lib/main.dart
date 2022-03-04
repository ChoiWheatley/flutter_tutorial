import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Flexible: `flex` 값에 배수를 가지고 비율을 지정할 수 있다.
    /// Expanded: `flex`를 1만큼 갖는다. 물론 따로 설정할 수도 있기는 하다.
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Row(
          children: [
            Expanded(
              child: Container(color: Colors.blue,),
            ),
            Flexible(
              child: Container(color: Colors.green,),flex: 5,
            ),
            Flexible(
              child: Container(color: Colors.red,),flex: 5,
            ),
          ],
        ),
      )
    );
  }
}
