import 'package:flutter/material.dart';
import 'package:bill_splitter/TotalSplit/total_split_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bill Splitter',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              children: <Widget>[
                Expanded(
                  child: HomeOptionCard(
                    title: "Total Split",
                  ),
                ),
                SizedBox(height: 30),
                Expanded(
                  child: HomeOptionCard(
                    title: "Item Split",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class HomeOptionCard extends StatelessWidget {
  const HomeOptionCard({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textStyle = theme.textTheme.headlineLarge!.copyWith(
      color: theme.primaryTextTheme.headlineLarge!.color,
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    );

    final color1 = Color(0xFFE8338E);
    final color2 = Color(0xFFD92EBF);
    final color3 = Color(0xFFCD28E7);

    return Card(
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TotalSplit()),
            );
          },
          child: Ink(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: LinearGradient(
                colors: [color1, color2, color3],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(title, style: textStyle),
              ],
            ),
          ),
        ),
      );
  }
}
