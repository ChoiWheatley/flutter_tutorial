import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

void main() {
  /// MaterialApp 을 main함수쪽으로 빼내야 다이얼로그가 뜬다.
  /// 왜냐고? context라는 부모위젯의 정보를 담고있는 변수인데,
  /// context를 인자로 받는 함수 몇개가 있다. 대표적으로 showDialog가 있는데,
  /// 이 함수는 부모로 MaterialApp을 필요로 한다. 그래서 main함수
  /// 에서 MaterialApp의 자식으로 MyApp을 정의해야만 한다.
  runApp(MaterialApp(
    home: MyApp()
  ));
}

/// StatefulWidget : state문법을 사용하면 자료를 보관할 수 있다.
/// state는 안에 있는 값이 변한다. 값이 변하면 state를 사용하는 위젯이
/// 자동으로 재 렌더링하게 된다. `setState()` 함수를 사용하면 된다.
///
/// 주로 자주 바뀌는 데이터들, 바뀌면 바로바로 보여주어야 하는 데이터들을
/// state로 만들어주자.
class MyApp extends StatefulWidget{
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {
  final appBarName = "따봉앱";
  LikeUserWidget? likeUser;
  final users=[
    LikeUserWidget('홍길동'),
    LikeUserWidget('최승현'),
    LikeUserWidget('옴뇸뇸'),
    LikeUserWidget('고길동'),
    LikeUserWidget('상도곱창'),
    LikeUserWidget('피라냐'),
    LikeUserWidget('굼벵이'),
    LikeUserWidget('좋아연'),
    LikeUserWidget('승현티비'),
    LikeUserWidget('Cheater', like: 1000,),
  ];

  @override Widget build(BuildContext context) {
    return Scaffold(
      /// Builder는 context 생성기임. 아래의 floatingActionButton은
      /// 부모로 Scaffold - MaterialApp 모두를 갖게된다.
        floatingActionButton: Builder(
          builder: (cntxt) {
            return FloatingActionButton(
              child: Text('click'),
              onPressed: (){
                print(cntxt); /// cntxt는 Builder-Scaffold-MaterialApp 순으로 Ancestor를 갖는다.
                showDialog(context: cntxt, builder: (context){
                  return Dialog(
                    child: Text('안녕!'),
                  );
                });
              },
            );
          }
        ),
        appBar: AppBar(
          title: Text(appBarName),
        ),
        body: ListView(
          children: users,
        ),
      );
  }
}
class LikeUserWidget extends StatefulWidget{
  final LikeUser _likeUser;

  LikeUserWidget(String? name, {int? like, Key? key})
      : _likeUser = LikeUser(name, like: like), super(key: key);

  @override
  State<LikeUserWidget> createState() => _LikeUserWidgetState();
}

class _LikeUserWidgetState extends State<LikeUserWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 3, 3, 3),
              child: Text(widget._likeUser.like.toString()),
            ),
          ),
          Expanded(
            flex: 8,
            child: Text(widget._likeUser.name,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: TextButton(
              child: Text('좋아연',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),
              ),
              onPressed: (){
                setState(() {
                  widget._likeUser.upvote();
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}

class LikeUser {
  final String name;
  int _like;  /// `_` 가 맨 앞에 붙으면 private

  int get like {
    return _like;
  }
  void upvote() {
    _like++;
  }
  LikeUser(String? name, {int? like})
      : name = name ?? '', _like = like ?? 0;
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