import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// 당근마켓 정답
    return MaterialApp(
        home: Scaffold(
          appBar: AppBar(),
          body: Container(
            height: 150,
            padding: EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset('assets/madeline.png', width: 150,),
                /// 하트 아이콘을 오른쪽 정렬을 해도 제 자리에 있는 이유는 기본적으로 Column이나
                /// Text나 모두 소심해서 그런 것이다. 그래서 width를 정의해야 한다.
                /// SizedBox같은 걸 사용할 수도 있겠지만, 정적인 크기가 된다. 따라서 Flexible,
                /// Expanded 등의 활용을 재고해 볼 수 있다.
                Expanded(child:
                Column(
                  /// 정렬은 Text 컴포넌트 안에 있는 정렬기능을 쓸 수도 있고,
                  /// Column, Row에 정의되어있는 정렬기능을 쓸 수도 있다.
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('마델린'),
                    Text('Madeline'),
                    Text('Celste'),
                    Text('Madeline'),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Icon(Icons.favorite),
                        Text('4'),
                      ],
                    )
                  ],
                ),
                ),
              ],
            ),
          ),
        )
    );
  }
}
