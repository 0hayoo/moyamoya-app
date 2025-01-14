import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/checkbox.dart';
import 'package:moyamoya/designsystem/component/radio.dart';
import 'package:moyamoya/designsystem/component/text_field.dart';
import 'package:moyamoya/designsystem/component/text_radio.dart';
import 'package:moyamoya/designsystem/component/toggle.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:provider/provider.dart';

import 'designsystem/component/avatar.dart';

void main() {
  runApp(const MoyaMoyaApp());
}

class MoyaMoyaApp extends StatelessWidget {
  const MoyaMoyaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppTheme(),
      builder: (context, _) => MaterialApp(
        title: "Flutter Demo",
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        themeMode: context.watch<AppTheme>().themeMode,
        debugShowCheckedModeBanner: false,
        home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _selectIndex = 0;
  bool _isChecked = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _changeSelectIndex(int index) {
    setState(() {
      _selectIndex = index;
    });
  }

  void _changeIsChecked(bool checked) {
    setState(() {
      _isChecked = checked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.backgroundNormal,
      appBar: AppBar(
        backgroundColor: context.colors.backgroundNormal,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: context.typography.display2Regular.copyWith(
                color: context.colors.statusPositive,
              ),
            ),
            // MoyaMoyaTextButton(
            //   text: "text",
            //   buttonSize: TextButtonSize.large,
            //   onPressed: () {},
            // ),
            // CenteredTextField(
            //   controller: TextEditingController(text: "hi"),
            //   hintText: "hi",
            // ),
            MoyaMoyaTextField(
              onPrefixClick: () {},
              onSuffixClick: () {},
              controller: TextEditingController(text: "hi"),
            ),
            MoyaMoyaToggle(
              isChecked: _isChecked,
              onChanged: _changeIsChecked,
            ),
            MoyaMoyaCheckbox(
              isChecked: _isChecked,
              onChanged: _changeIsChecked,
            ),
            MoyaMoyaRadio(
              isChecked: _isChecked,
              onChanged: _changeIsChecked,
            ),
            MoyaMoyaTextRadio(
              text: "사과나무",
              isChecked: _isChecked,
              onChanged: _changeIsChecked,
              radioSize: TextRadioSize.small,
            ),
            MoyaMoyaTextRadio(
              text: "사과나무",
              isChecked: _isChecked,
              onChanged: _changeIsChecked,
              radioSize: TextRadioSize.large,
            ),
            Row(
              children: [
                MoyaMoyaAvatar(
                  avatarSize: AvatarSize.medium,
                ),
                MoyaMoyaAvatar(
                  avatarSize: AvatarSize.medium,
                  image: "https://picsum.photos/200/100",
                ),
              ],
            )
            // child: MoyaMoyaButton(
            //   text: "Hello",
            //   buttonSize: ButtonSize.small,
            //   buttonType: ButtonType.primary,
            //   onPressed: () {
            //     print("hello");
            //   },
            // ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
