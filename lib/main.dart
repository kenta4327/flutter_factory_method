import 'package:flutter/material.dart';
import 'package:flutter_factory_method/utils/file_text_util_creator.dart';
import 'package:flutter_factory_method/utils/text_util.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _textController = TextEditingController();
  String _outputText = '';
  TextUtil? _textUtil;

  @override
  void initState() {
    super.initState();

    final textUtilCreator = FileTextUtilCreator();
    _textUtil = textUtilCreator.create();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  void _saveText() {
    _textUtil?.save(_textController.text);
    print('保存したよ');
  }

  void _readText() async {
    final text = await _textUtil?.read();
    print('読み込んだよ');
    setState(() {
      _outputText = text!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 300,
              child: TextField(
                controller: _textController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '文字を入力してください',
                ),
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _saveText,
                  child: Text('保存する'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _readText,
                  child: Text('読み込む'),
                ),
              ],
            ),
            SizedBox(height: 16.0),
            Text(
              _outputText,
            ),
          ],
        ),
      ),
    );
  }
}
