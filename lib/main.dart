import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  var a = 0;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        /// 우측 하단에 떠있는 버튼에 대한 프리셋이 있다.
        floatingActionButton: FloatingActionButton(
          /// Text 렌더링 강제하기는 다음 시간에
          child: Text(a.toString()),
          onPressed: (){
            /// 버튼 누르면 여기 코드를 실행해준다.
            a++;
          },
        ),
        appBar: AppBar(),
        body: Container(
          /// ListView 사용하면 스크롤바 생김. 스크롤 위치 감시도 가능, 안보이는 위젯
          /// 메모리 절약
          child: ListView.builder(itemCount: 100,
            itemBuilder: (buildContext, i){
              print('hello' + i.toString());
              // return MyListItem(name: "name_" + i.toString(),);
              /// ListTile을 쓰면 별도의 컴포넌트 만들 필요도 없이 바로 리스트에 필요한
              /// 아이템을 정의할 수 있다.
              return ListTile(
                autofocus: true,
                enabled: true,
                hoverColor: Colors.amber,
                focusColor: Colors.yellow,
                selectedColor: Colors.yellowAccent,
                leading: Icon(Icons.account_circle),
                title: Text('홍길동' + i.toString()),
              );
            },
          ),
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