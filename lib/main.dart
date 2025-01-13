import 'package:flutter/material.dart';
import 'package:moyamoya/designsystem/component/segmented_button.dart';
import 'package:moyamoya/designsystem/foundation/app_theme.dart';
import 'package:provider/provider.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
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
            SizedBox(
              width: double.infinity,
              height: 48,
              child: MoyaMoyaSegmentedButton(
                segments: [
                  MoyaMoyaSegment(
                    selected: _selectIndex == 0,
                    onClick: () {
                      _changeSelectIndex(0);
                    },
                    text: "text1",
                  ),
                  MoyaMoyaSegment(
                    selected: _selectIndex == 1,
                    onClick: () {
                      _changeSelectIndex(1);
                    },
                    text: "text2",
                  ),
                  MoyaMoyaSegment(
                    selected: _selectIndex == 2,
                    onClick: () {
                      _changeSelectIndex(2);
                    },
                    text: "text3",
                  ),
                  MoyaMoyaSegment(
                    selected: _selectIndex == 3,
                    onClick: () {
                      _changeSelectIndex(3);
                    },
                    text: "text4",
                  ),
                ],
              ),
              // child: MoyaMoyaButton(
              //   text: "Hello",
              //   buttonSize: ButtonSize.small,
              //   buttonType: ButtonType.primary,
              //   onPressed: () {
              //     print("hello");
              //   },
              // ),
            )
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
