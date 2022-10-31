import 'package:belajar_bareng/bloc/main_screen_bloc.dart';
import 'package:belajar_bareng/const/num_consts.dart';
import 'package:belajar_bareng/helper/media_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) {
        return MainScreenBloc();
      },
      child: MaterialApp(
        title: 'Belajar Bareng',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        // darkTheme: ThemeData(
        //   primarySwatch: Colors.orange,
        // ),
        home: const MyHomeScreen(
          title: 'Flutter Demo Home Page',
          initialValue: 5,
        ),
      ),
    );
  }
}

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key, required this.title, this.initialValue})
      : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;
  final int? initialValue;

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    super.initState();
    textEditingController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.

    return Scaffold(
      body: Form(
        child: Center(
          child: BlocBuilder<MainScreenBloc, MainScreenState>(
            builder: (context, state) {
              String textScreen = "";
              if (state is MainScreenFirstButtonState) {
                textScreen = state.numberString;
              }
              if (state is MainScreenSecondButtonState) {
                textScreen = state.numberString;
              }
              if (state is MainScreenThirdButtonState) {
                textScreen = state.numberString;
              }
              if (state is MainScreenFourthButtonState) {
                textScreen = state.numberString;
              }
              print("state is ${state.runtimeType}");
              return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 32,
                      ),
                      TextFormField(
                        enabled: true,
                        controller: textEditingController,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                                width: 3,
                                color: Colors.greenAccent), //<-- SEE HERE
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              context.read<MainScreenBloc>().add(
                                  GetFirstButtonValueEvent(
                                    int.parse(textEditingController.text)));
                            },
                            child: const Text("1"),
                          )),
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              context.read<MainScreenBloc>().add(
                                  GetSecondButtonValueEvent(
                                      int.parse(textEditingController.text)));
                            },
                            child: const Text("2"),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              context.read<MainScreenBloc>().add(
                                  GetThirdButtonValueEvent(
                                      int.parse(textEditingController.text)));
                            },
                            child: const Text("3"),
                          )),
                          Expanded(
                              child: ElevatedButton(
                            onPressed: () {
                              context.read<MainScreenBloc>().add(
                                  GetFourthButtonValueEvent(
                                      int.parse(textEditingController.text)));
                            },
                            child: const Text("4"),
                          )),
                        ],
                      ),
                      Row(
                        children: [
                          Flexible(
                              child: Text(
                            "$textScreen",
                            softWrap: true,
                          ))
                        ],
                      )
                    ],
                  ));
            },
          ),
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
