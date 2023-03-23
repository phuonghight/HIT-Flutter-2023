import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';

class MathGame extends StatefulWidget {
  const MathGame({super.key});

  @override
  State<MathGame> createState() => _MathGameState();
}

class _MathGameState extends State<MathGame> {
  // 0: start, 1: is playing, 2: over game
  int status = 0;

  int score = 0;
  int highestScore = 0;

  int time = 10;
  late Timer _timer;

  late int p1, p2;
  late int correctResult, result;
  late String sign;
  List<String> signArr = ["+", "-", "x", "/"];

  List<String> memeOverGame = [
    "Sợ quá, sợ quá, phải chơi lại thôi",
    "Con game này chỉ dành cho trẻ con đó:)",
    "Mình có thực lực thua mới buồn, còn không có thực lực thua thì làm sao phải buồn",
    "Cho thêm 1 ngày chắc chưa tính ra"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
        colors: [Colors.red, Colors.orange],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      )),

      // Is playing game UI
      child: status == 0
          ? homeGameWidget()
          : status == 1
              ? playGameWidget()
              : overGameWigdget(),
    );
  }

  Column overGameWigdget() {
    var rd = Random();
    String memeString = memeOverGame[rd.nextInt(memeOverGame.length)];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Game Over",
          style: TextStyle(color: Colors.white, fontSize: 48),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          memeString,
          textAlign: TextAlign.center,
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Your score: $score",
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 20,
        ),
        Text(
          "Highest score: $highestScore",
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  score = 0;
                  status = 1;
                  createExpression();
                  setState(() {});
                },
                child: const Icon(
                  Icons.replay_rounded,
                  size: 68,
                )),
            const SizedBox(width: 20),
            ElevatedButton(
                onPressed: () {
                  score = 0;
                  status = 0;
                  setState(() {});
                },
                child: const Icon(
                  Icons.home,
                  size: 68,
                ))
          ],
        )
      ],
    );
  }

  Column playGameWidget() {
    return Column(children: [
      const SizedBox(
        height: 20,
      ),

      // Time countdown
      SafeArea(
          child: Row(
        children: [
          AnimatedContainer(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8), color: Colors.white),
            height: 10,
            width: MediaQuery.of(context).size.width * time / 10,
            duration: time != 10
                ? const Duration(seconds: 1)
                : const Duration(seconds: 0),
          ),
        ],
      )),

      const SizedBox(height: 20),

      // display time
      Center(
        child: Text(
          "Score: $score",
          style: const TextStyle(color: Colors.white, fontSize: 24),
        ),
      ),

      // display expression
      Expanded(
        child: Center(
          child: DefaultTextStyle(
            style: const TextStyle(color: Colors.white, fontSize: 58),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(p1.toString()),
                Text(" $sign "),
                Text(p2.toString()),
                const Text(" = "),
                Text(result.toString())
              ],
            ),
          ),
        ),
      ),

      // display option
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  iconSize: const MaterialStatePropertyAll(64),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.all(MediaQuery.of(context).size.width / 9)),
                  backgroundColor:
                      const MaterialStatePropertyAll(Colors.green)),
              onPressed: () {
                clearInterval();
                if (result == correctResult) {
                  score++;
                  createExpression();
                } else {
                  overGame();
                }
              },
              child: const Icon(Icons.done_rounded)),
          ElevatedButton(
              style: ButtonStyle(
                  iconSize: const MaterialStatePropertyAll(64),
                  padding: MaterialStatePropertyAll(
                      EdgeInsets.all(MediaQuery.of(context).size.width / 9)),
                  backgroundColor: const MaterialStatePropertyAll(Colors.red)),
              onPressed: () {
                clearInterval();
                if (result != correctResult) {
                  score++;
                  createExpression();
                } else {
                  overGame();
                }
              },
              child: const Icon(Icons.clear_rounded))
        ],
      ),

      const SizedBox(height: 40)
    ]);
  }

  createExpression() {
    var rd = Random();
    p1 = rd.nextInt(10) + 20; // 30 - 39
    p2 = rd.nextInt(20) + 1; // 1 - 20
    int randomSign = rd.nextInt(signArr.length); // 0 - 3
    sign = signArr[randomSign];
    switch (randomSign) {
      case 0:
        correctResult = (p1 + p2);
        break;
      case 1:
        correctResult = (p1 - p2);
        break;
      case 2:
        correctResult = (p1 * p2);
        break;
      case 3:
        correctResult = (p1 ~/ p2);
        break;
      default:
    }
    result = (correctResult + rd.nextInt(2) - 1); // -1 0 1
    setInterval();
  }

  overGame() {
    highestScore = max(highestScore, score);
    status = 2;
    clearInterval();
  }

  setInterval() {
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      time--;
      if (time < 0) {
        timer.cancel();
        overGame();
      }
      setState(() {});
    });
  }

  clearInterval() {
    _timer.cancel();
    time = 10;
    setState(() {});
  }

  Column homeGameWidget() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text(
        "Freaking Math",
        style: TextStyle(color: Colors.white, fontSize: 46),
      ),
      const SizedBox(
        height: 30,
      ),

      // Start btn
      ElevatedButton(
          style: const ButtonStyle(
              padding: MaterialStatePropertyAll(
                  EdgeInsets.fromLTRB(40, 30, 40, 30))),
          onPressed: () {
            status = 1;
            createExpression();
            setState(() {});
          },
          child: const Icon(
            Icons.play_arrow_rounded,
            size: 68,
          ))
    ]);
  }
}
