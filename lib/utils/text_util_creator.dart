import 'package:flutter_factory_method/utils/text_util.dart';

abstract class TextUtilCreator {
  TextUtil create() {
    final textUtil = factoryMethod();
    printGenerationComplete();
    return textUtil;
  }

  TextUtil factoryMethod();
  void printGenerationComplete();
}