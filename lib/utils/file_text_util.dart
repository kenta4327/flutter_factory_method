import 'dart:io';

import 'package:flutter_factory_method/utils/text_util.dart';
import 'package:path_provider/path_provider.dart';

class FileTextUtil extends TextUtil {

  @override
  void save(text) async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/hoge.txt');

    // ファイルがなかったら生成する
    if (!await file.exists()) {
      await file.create();
    }
    await file.writeAsString(text);
  }

  @override
  Future<String> read() async {
    final directory = await getApplicationDocumentsDirectory();
    final path = directory.path;
    final file = File('$path/hoge.txt');

    // ファイルがあった時だけ読み込む
    if (await file.exists()) {
      final data = await file.readAsString();
      return data;
    }

    return '';
  }
}