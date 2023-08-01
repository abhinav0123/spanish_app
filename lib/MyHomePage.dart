import 'package:flutter/material.dart';
import 'numberaudio.dart';
import 'package:audioplayers/audioplayers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AudioPlayer audioPlayer = AudioPlayer();
  List<NumberAudio> numberList = [
    NumberAudio("one.wav", Colors.red, "One"),
    NumberAudio("two.wav", Colors.blue, "Two"),
    NumberAudio("three.wav", Colors.green, "Three"),
    NumberAudio("four.wav", Colors.pink, "Four"),
    NumberAudio("five.wav", Colors.brown, "Five"),
    NumberAudio("six.wav", Colors.blueGrey, "Six"),
    NumberAudio("seven.wav", Colors.teal, "Seven"),
    NumberAudio("eight.wav", Colors.grey, "Eight"),
    NumberAudio("nine.wav", Colors.orange, "Nine"),
    NumberAudio("ten.wav", Colors.purple, "Ten"),
  ];

  play(String uri) async {
    await audioPlayer.play(AssetSource(uri));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Spanish Number'),
      ),
      body: Container(
          child: Center(
        child: Column(
          children: <Widget>[
            Image(
              image: AssetImage("images/logo.png"),
            ),
            Expanded(
              child: GridView.builder(
                padding: EdgeInsets.all(10.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 10.0,
                    mainAxisExtent: 10.0),
                itemCount: numberList.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 50.0,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: numberList[i].buttonColor,
                    ),
                    onPressed: () {
                      if (numberList[i].audioUri != null) {
                        play(numberList[i].audioUri!);
                      } else {
                        // Handle the case when audioUri is null, such as showing an error message.
                        // For example:
                        // print("Audio URI is null for index $i");
                      }
                    },
                    child: Text(
                      numberList[i].buttonText!,
                      style: TextStyle(
                        fontSize: 20.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
