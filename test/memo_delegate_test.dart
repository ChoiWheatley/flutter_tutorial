import 'package:flutter/material.dart';
import 'package:flutter_projects/memo_delegate.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:flutter_projects/main.dart';

void main() {
  runApp(MemoDelegate(
    folderName: 'Folder1',
    memoName: [
      'memo1',
      'memo2',
      'memo3',
      'memo4',
    ],
  ));
}
