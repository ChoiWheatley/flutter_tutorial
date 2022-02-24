import 'package:flutter/material.dart';

class MemoDelegate extends SizedBox {
  MemoDelegate({
    String folderName='',
    List<String>? memoName,
    Key? key
  }) : super(
      key: key,
      child: Row(
        children: [
          Column(
            /// foldername and memoname
            children: [
              Text(folderName),
              Text(StringBuilder.concat(memoName, '|')),
            ],
          ),
          Padding(padding: EdgeInsets.all(10),
            /// 3dot button
            child: IconButton(
              icon: Icon(Icons.star),
              onPressed: (){},
            ),
          ),
        ],
      )
  );
}

class StringBuilder {
  static String concat(List<String>? list, String? delemeter) {
    String ret = '';
    // null-aware operator `??`
    for (var element in list ?? [''])
    {ret += element + delemeter! ?? ''; }
    return ret;
  }
}