import 'package:flutter_factory_method/utils/file_text_util.dart';
import 'package:flutter_factory_method/utils/text_util.dart';
import 'package:flutter_factory_method/utils/text_util_creator.dart';

class FileTextUtilCreator extends TextUtilCreator {
  @override
  TextUtil factoryMethod() {
    return FileTextUtil();
  }

  @override
  void printGenerationComplete() {
    print('FileTextUtilCreator を生成しました');
  }
}