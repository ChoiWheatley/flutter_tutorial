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
  late final List<LikeUserWidget> _users=[
    LikeUserWidget('홍길동', deleteFunc: deleteUser,),
    LikeUserWidget('최승현', deleteFunc: deleteUser,),
    LikeUserWidget('옴뇸뇸', deleteFunc: deleteUser,),
    LikeUserWidget('고길동', deleteFunc: deleteUser,),
    LikeUserWidget('상도곱창', deleteFunc: deleteUser,),
    LikeUserWidget('피라냐', deleteFunc: deleteUser,),
    LikeUserWidget('굼벵이', deleteFunc: deleteUser,),
    LikeUserWidget('좋아연', deleteFunc: deleteUser,),
    LikeUserWidget('승현티비', deleteFunc: deleteUser,),
    LikeUserWidget('Cheater', like: 1000, deleteFunc: deleteUser,),
  ];

  /// addUser와 deleteUser 인터페이스의 구현체는 MyApp에 있다. 이 객체는 MyDialog의 addUser
  /// 를 구현하고 LikeUserWidget의 delUser를 구현한다. 이 둘에 비해 MyApp 객체는 의존적이며,
  /// 책임이 없다. 즉, MyDialog와 LikeUserWidget은 MyApp에 비해 더 중요하고 잘 바뀌지 않는
  /// 정책을 담고, MyApp은 반대로 자주 바뀌는 구현체를 담게 되는 것이다.
  ///
  /// 상식에 벗어나는 것인가? 아니면 기존의 고정관념을 깨는 것인가?
  addUser(LikeUser user) {
    setState(() {
      _users.add(LikeUserWidget.likeUser(user, deleteFunc: deleteUser,));
    });
  }
  /// delete 연산, users의 index를 통해 지우거나, 인스턴스를 아예 지워버리거나
  deleteUser(user) {
    print('user is ' + user.toString());
    setState(() {
      /// index를 통해 지우는 방법
      if (user is int && user >= 0 && user < _users.length) {
        _users.removeAt(user);
      }
      /// instance를 직접 지우는 방법
      if (user is LikeUserWidget?) {
        // TODO: 근데 이래도 되나? 포인트나 레퍼런스로 전달되겠지?
        _users.remove(user);
      }
    });
  }

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
                showDialog(context: cntxt, builder: (cntxt){
                  /// 인터페이스 자체를 자식에게 보낼 수도 있다.
                  return MyDialog(addUser: addUser,);
                });
              },
            );
          }
        ),
        appBar: AppBar(
          title: Text(appBarName + _users.length.toString()),
        ),
        body: ListView.builder(
            itemCount: _users.length,
            itemBuilder: (context, idx){
              return _users[idx];
            })
      );
  }
}
class LikeUserWidget extends StatefulWidget{
  final LikeUser _likeUser;
  /// deleteUser라는 이름의 함수 포인터를 정의함으로써 추상 인터페이스를 정의한다.
  /// 이 위젯을 사용하는 객체가 deleteUser를 구현하도록 만드는 것이다.
  /// 신기한 점은 함수 포인터를 사용하면 굳이 추상 클래스를 만들 필요가 없다는 점이다.
  final void Function(Object?)? _deleteUser;

  // facade
  LikeUserWidget(String? name, {Function(Object?)? deleteFunc, int? like, Key? key})
      : _deleteUser = deleteFunc, _likeUser = LikeUser(name, like: like), super(key: key);
  LikeUserWidget.likeUser(LikeUser newUser, {Function(Object?)? deleteFunc, Key? key}) /// Constructor.name 식으로 생성자를 구분해야 함. 이름 똑같으면 망함.
      : _deleteUser = deleteFunc, _likeUser = newUser, super(key: key);

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
          Expanded(
            child: TextButton(
              child: Text('delete',
                style: TextStyle(
                  color: Colors.redAccent,
                ),
              ),
              onPressed: (){
                // TODO: delete button pressed
                var deleteFunc = widget._deleteUser;
                print(deleteFunc.toString());
                if (deleteFunc != null) {
                  deleteFunc(widget);
                }
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
///
///

class MyDialog extends StatelessWidget {
  /// addUser라는 함수포인터를 정의함으로써 우리는 이 객체의 추상 인터페이스를 정의할 수 있다.
  final void Function(LikeUser)? _addUser;
  final _inputData = TextEditingController();   /// 유저가 텍스트필드에 입력한 데이터를 변수에 담을 수 있다.

  MyDialog({Function(LikeUser)? addUser, Key? key,})
      : _addUser = addUser, super(key: key);

  _submit() {
    /// 빈칸이면 완료 눌러도 추가 안 되게
    if (_inputData.text.isNotEmpty){
      _addUser?.call(LikeUser(_inputData.text));
    }
  }

  static _close(context) {
    /// 알아서 닫히게
    Navigator.of(context, rootNavigator: true).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: 100,
          height: 300,
          child: Column(
            children: [
              TextField(
                controller: _inputData,  /// TextField에 작성한 내용을 담는 컨트롤러 등록.
                enabled: true,
                autofocus: true,
                onSubmitted: (text){
                  _submit();
                  _close(context);
                  },
                decoration: InputDecoration(
                    border: UnderlineInputBorder(),
                    hintText: 'new friend name here'
                ),
              ),
              TextButton(
                child: Text('완료'),
                onPressed: (){
                  /// 부모 객체에 있는 리스트에 1 추가해보자.
                  /// 부모 state를 자식이 수정하려면
                  /// 1. 부모에 수정하는 함수 만들기
                  /// 2. 자식으로 보내기 + 자식에서 함수 등록하기
                  _submit();
                  _close(context);
                },
              ),
              TextButton(
                child: Text('취소'),
                onPressed: (){
                  _close(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}