import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          /// ListView 사용하면 스크롤바 생김. 스크롤 위치 감시도 가능, 안보이는 위젯
          /// 메모리 절약
          child: ListView(
            children: const [
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '홍길동'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
              MyListItem(name: '고길동'),
              MyListItem(name: '최승현'),
            ],
          )
        ),
      ),
    );
  }
}

/// 나만의 위젯 만들기 - 클래스 버전.
/// 길고 복잡한 레이아웃을 사용자 정의 컴포넌트에 담기. 코드 재활용
class MyListItem extends StatelessWidget {
  const MyListItem({Key? key, String? name}) : name_ = name ?? '', super(key: key);
  /// final은 런타임 const. 그럼 그냥 const는? 컴파일 타임 const
  final String name_;
  @override
  build(context) {
    /// 참고로, 다트 언어에서는 리턴타입 자리를 비워놓아도 알아서 리턴타입을 추론함.
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.account_circle, size: 50),
            Text(name_, style: TextStyle(
              fontSize: 35
            )),
          ],
        ),
      ),
    );
  }
}

/// 나만의 위젯 만들기 - 변수 버전
/// 나중에 성능 상 이슈가 있을 수도 있다. 평생 안 바뀌는 const같은 것들만 변수로 담아두셈.
var a = SizedBox(
  child: Text('안녕'),
);

/// 커스텀 위젯의 단점 = state 관리가 어렵다 -> 나중에 강의함.
/// 큰 페이지, 재사용 많은 UI만 커스텀 할 것