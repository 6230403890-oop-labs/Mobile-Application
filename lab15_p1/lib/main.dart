import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => UserFinalScore()),
    //Provider(create: (context) => SomeOtherClass()),
  ], child: const MyFlutterApp()));
}

class UserFinalScore extends ChangeNotifier {
  int UserScore = 0;
  bool _correct = false;

  bool get correct => _correct;

  set correct(bool value) {
    if (value == true) {
      UserScore += 1;
    } else {}

    notifyListeners();
  }

  void resetScore() {
    UserScore = 0;
  }
}

class TapAnswer extends StatefulWidget {
  final question;
  final q_color;
  final collectAnswer;
  final num;
  final nextchoice;
  TapAnswer(
      {Key? key,
      required this.question,
      required this.q_color,
      required this.num,
      required this.nextchoice,
      required this.collectAnswer})
      : super(key: key);

  @override
  _TapAnswerState createState() => _TapAnswerState();
}

class _TapAnswerState extends State<TapAnswer> {
  var check = Colors.red;
  var score = 0;
  var _value = 0;

  void alertMessages(
    BuildContext context,
    collect,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        if (collect == true) {
          return AlertDialog(
            title: const Text('Score!'),
            content: Text("Congrats, you get 1 point"),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => widget.nextchoice ?? Container())),
                child: const Text("Next"),
              ),
            ],
          );
        } else {
          return AlertDialog(
            title: const Text('Score!'),
            content: const Text('Sorry, you miss it!'),
            actions: <Widget>[
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => widget.nextchoice ?? Container())),
                child: const Text("OK"),
              )
            ],
          );
        }
      },
    );
  }

  bool _active = true;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  // void _onValueChanged(double value) {
  //   setState(() {
  //     _value = value;
  //   });
  // }

  void _checkAnswer() {
    // final userscore = UserFinalScore();
    // final userscore = Provider.of<UserFinalScore>(context);
    if (widget.collectAnswer == true) {
      check = Colors.green;
      // score = 'Congrats, you get 1 point';

      score += 1;

      // userscore.Userscore = 1;
    } else {
      // score = 'Sorry, you miss it!';
    }
  }

  @override
  Widget build(BuildContext context) {
    _checkAnswer();
    final userscore = Provider.of<UserFinalScore>(context);
    return GestureDetector(
      onTap: () {
        _handleTap();
        _checkAnswer();

        // ScaffoldMessenger.of(context)
        //     .showSnackBar(SnackBar(content: Text("Your score $score")));
        alertMessages(context, widget.collectAnswer);
        userscore.correct = widget.collectAnswer;
      },
      child: Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.all(10),
        color: _active ? widget.q_color : check,
        //padding: const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 20),
        height: 45,
        width: 150,
        child: Text(widget.question,
            textDirection: TextDirection.ltr,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}

// ChangeNotifierProvider<UserFinalScore>(
// create: (context) => UserFinalScore(),
// child: Builder(
// builder: (context) {
// return
// },
// ),
// );

Widget pictures(imgUrl) {
  return Column(children: [
    Container(
        padding: const EdgeInsets.only(top: 20),
        child: const Text(
          "What is this game?",
          style: TextStyle(fontSize: 30, color: Colors.pinkAccent),
        )),
    Container(
        padding: const EdgeInsets.only(top: 20),
        child: Image(
          image: NetworkImage('$imgUrl'),
          width: 300,
        )),
  ]);
}

class choice extends StatefulWidget {
  const choice({Key? key}) : super(key: key);

  @override
  _choiceState createState() => _choiceState();
}

class _choiceState extends State<choice> {
  var questionInfo = {
    1: {
      "imgUrl":
          'https://i0.wp.com/playpost.gg/wp-content/uploads/2021/11/bc-sleep.jpg?resize=600%2C324&ssl=1',
      1: "BombCrypto",
      "State1": true,
      2: "SpaceCrypto",
      "State2": false,
      3: "MorningMoonVillage",
      "State3": false,
      4: "LunarRush",
      "State4": false,
    },
    2: {
      "imgUrl":
          'https://www.minecraft.net/content/dam/games/minecraft/marketplace/updates-catspandas_latest.jpg',
      1: "Stardew valley",
      "State1": false,
      2: "Terraria",
      "State2": false,
      3: "Minecraft",
      "State3": true,
      4: "Starbound",
      "State4": false,
    },
    3: {
      "imgUrl":
          'https://gamerism.co/wp-content/uploads/2020/05/valorant-open-beta.jpg',
      1: "Call of duty",
      "State1": false,
      2: "Battlefield",
      "State2": false,
      3: "CS:GO",
      "State3": false,
      4: "Valorant",
      "State4": true,
    },
  };
  @override
  Widget build(BuildContext context) {
    return GameCom(num: 1, info: questionInfo);
  }
}

class GameCom extends StatefulWidget {
  const GameCom({Key? key, required this.num, required this.info})
      : super(key: key);
  final int num;
  final Map<dynamic, dynamic> info;
  @override
  _GameComState createState() => _GameComState();
}

class _GameComState extends State<GameCom> {
  late String question1;
  late String question2;
  late String question3;
  late String question4;

  late bool state1;
  late bool state2;
  late bool state3;
  late bool state4;
  Widget? nextchoice;
  late String imgUrl;
  bool previous = false;

  @override
  void initState() {
    super.initState();
    question1 = widget.info[widget.num][1];
    question2 = widget.info[widget.num][2];
    question3 = widget.info[widget.num][3];
    question4 = widget.info[widget.num][4];

    state1 = widget.info[widget.num]["State1"];
    state2 = widget.info[widget.num]["State2"];
    state3 = widget.info[widget.num]["State3"];
    state4 = widget.info[widget.num]["State4"];

    imgUrl = widget.info[widget.num]["imgUrl"];

    if (widget.num > 1 && widget.num <= widget.info.length) {
      previous = true;
    }
    if (widget.num < widget.info.length) {
      nextchoice = GameCom(num: widget.num + 1, info: widget.info);
    }
    if (widget.num >= widget.info.length) {
      nextchoice = Restart();
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenW = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: screenW <= 600
            ? AppBar(
                title: const Text("Mobile App Dev"),
                backgroundColor: Colors.green)
            : null,
        backgroundColor: Colors.white,
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constrains) {
            if (constrains.maxWidth > 600) {
              return Center(
                  child: Column(
                children: [
                  pictures(imgUrl),
                ],
              ));
            } else {
              return Center(
                  child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(bottom: 30),
                    child: pictures(imgUrl),
                  ),
                  Expanded(
                      child: Center(
                          child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: TapAnswer(
                            question: question1,
                            q_color: Colors.orange,
                            collectAnswer: state1,
                            num: widget.num,
                            nextchoice: nextchoice,
                          )),
                          Expanded(
                              child: TapAnswer(
                            question: question2,
                            q_color: Colors.deepPurple,
                            collectAnswer: state2,
                            num: widget.num,
                            nextchoice: nextchoice,
                          ))
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Expanded(
                              child: TapAnswer(
                            question: question3,
                            q_color: Colors.blueAccent,
                            collectAnswer: state3,
                            num: widget.num,
                            nextchoice: nextchoice,
                          )),
                          Expanded(
                              child: TapAnswer(
                            question: question4,
                            q_color: Colors.amberAccent,
                            collectAnswer: state4,
                            num: widget.num,
                            nextchoice: nextchoice,
                          )),
                        ],
                      ),
                    ],
                  ))),
                  Container(
                      margin: const EdgeInsets.only(
                          left: 20, right: 20, bottom: 50),
                      child: Stack(
                        children: <Widget>[
                          Container(
                            alignment: Alignment.center,
                            child: ElevatedButton(
                              onPressed: () => Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) => MyFlutterApp())),
                              child: const Text("Home"),
                            ),
                          ),
                          Container(
                            alignment: Alignment.bottomLeft,
                            child: Visibility(
                                visible: previous,
                                child: ElevatedButton(
                                  onPressed: () => Navigator.of(context).pop(),
                                  child: const Text("Previous"),
                                )),
                          ),
                          Container(
                              alignment: Alignment.bottomRight,
                              child: ElevatedButton(
                                onPressed: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            nextchoice ?? Container())),
                                child: const Text("Next"),
                              )),
                        ],
                      )),
                ],
              ));
            }
          },
        ));
  }
}

class Restart extends StatelessWidget {
  const Restart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<UserFinalScore>(builder: (context, value, child) {
      return Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            alignment: Alignment.center,
            margin: EdgeInsets.only(top: 350),
            child: Column(
              children: [
                Center(
                  child: Text(
                    "Your total score is  ${value.UserScore}",
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                    child: ElevatedButton(
                  onPressed: () {
                    value.resetScore();
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => Homepage()));
                  },
                  child: const Text("Restart"),
                )),
              ],
            ),
          ));
    });
  }
}

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Column(
                children: [
                  Container(
                      margin: EdgeInsets.only(top: 100),
                      alignment: Alignment.center,
                      child: Image.asset(
                        'images/quiz.jpg',
                      )),
                  const Text(
                    "Welcome to the Quiz App",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                  ),
                  const Text(
                    "By Patharadach Maneewong 623040389-0",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ],
              ),
              Container(
                  margin: EdgeInsets.only(top: 100),
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () => Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => choice())),
                    child: const Text("Start"),
                  ))
            ],
          ),
        ));
  }
}

class MyFlutterApp extends StatelessWidget {
  const MyFlutterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "My Flutter App",
        home: Scaffold(backgroundColor: Colors.white, body: Homepage()));
  }
}
