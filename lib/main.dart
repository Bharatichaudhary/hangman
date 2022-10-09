//import 'dart:math';
//import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
//import 'package:flame/flame.dart';
//import 'package:audioplayers/audioplayers.dart';
///import 'package:audioplayers/audio_cache.dart';

//import 'package:flame_audio/flame_audio.dart';
//import 'package:assets_audio_player/assets_audio_player.dart';




void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Hang man game",
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var word = ["FOREVER",'AID','AGGRESSIVE','FOLLOWING','ADVOCATE',"FIRM",'EXEMPT','IGNORANT',];
  var mword = ["FOREVER",'AID','AGGRESSIVE','FOLLOWING','ADVOCATE',"FIRM",'EXEMPT','IGNORANT',];
  var hint=["Always","Help or Assist","Militant","Next","Support",'Hard','Immune','Unaware'];
var sco=0;
  bool _isVisiblebutton = true;
  var s = "ABCDEFGHIJKLMNOPQRSTUVWXYZ", data = "";

  var a = [
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1,
    1
  ];
  var score = 0;
  String win = "";
  var imgno = 1;
  var i = 0;
  String letter = "";
  var text = "";
  bool _isVisibleimg=true;
  bool _isVisible = false;
  showText() {
    setState(() {
      _isVisible = true;
    });
  }
  //bool musicPlaying=false;
    //prefix: 'assets/',
  createGame(var b) {
    if (a[b] == 0) {
      a[b] = 0;
      return false;
    } else
      return true;
  }

  check(var num) {
    if (mword[i].contains("${s[num]}")) {
      //print("yes");

      return 1;
    } else
      // print("no");
      return 0;
  }

  getScore(String data) {
    score = 0;
    for (var z = 0; z < mword[i].length; z++) {
      if (data.contains(mword[i][z]) == true) {
        score++;
      }
    }
    if (score == mword[i].length) {
      setState(() {
        win = "You Win";
        _isVisiblebutton=false;
        sco=sco+10;
        //s = s.replaceAll(s, "");

      });
    }
    return score;
  }

  PressedButton(var k) {
    setState(() {
      if (imgno < 7 && check(k) == 0) {
        imgno++;
        if (imgno == 7) {
          win = "You Lost";
          //_isVisiblebutton = false;

        }
      }
     
      //letter = "${s[k]}";
      data = data + "${s[k]}";
      score = getScore(data);

    });
  }

  result() {
    text = mword[i];
    word[i] = "";

    for (var c = 0; c < text.length; c++) {
      String str = text.substring(c, c + 1);
      //print("str=$str");
      for (var d = 0; d < data.length; d++) {
        String st = data.substring(d, d + 1);
        //print("st=$st");

        setState(() {
          if (str == st) {
            word[i] = word[i] + st;
            //print(word[i]);
          }
        });
      }
      if (data.contains(str) == false) {
        word[i] = word[i] + "_";
      }

      //print(word[i]);
    }

    //print(word[i].length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Hangman Game"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Text("Next"),
          onPressed: () {
 //AudioCache player =  AudioCache();
//const alarmAudioPath = "assets/bg.wav";
//player.play(alarmAudioPath);           // if(!musicPlaying){
           // }
            
            setState(() {
              if(i<mword.length){
               // print("true");
              //score = getScore(data);
              s = ("ABCDEFGHIJKLMNOPQRSTUVWXYZ");
              win = "";
              imgno=1;
              score = 0;
              data = "";
              _isVisible = false;
              _isVisiblebutton=true;
              if(i!=mword.length-1){
                //print("true");
              i++;}
              else{
                setState(() {
                  print("false");
                  i=mword.length-1;
                  win="Game over";
                  mword[i]="";
                  //word[i]="";
                  hint[i]="";
                  _isVisibleimg=false;
                  _isVisiblebutton=false;




                });
              }
              

      }/*else{
              //i = Random().nextInt(word.length);
              score = sco;
              imgno=1;
                            s = ("");
                                          data = "";




              win="Game over";
              mword[i]="";
              word[i]="";
              hint[i]="";}*/

            });
          },
        ),
        body: Container(
          child: ListView(children: [
            Column(
              children: [

                SizedBox(height: 20),
                Visibility(
                  visible: _isVisibleimg,
                  child:Text("Your Score: $sco",style: TextStyle(fontWeight: FontWeight.bold,),)
                  ),
                  Visibility(
                  visible: !_isVisibleimg,
                  child:Text("Your Score: $sco",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),)
                  ),
                   Visibility(
                  visible: !_isVisibleimg,
                  child:SizedBox(height: 20,)
                  ),
                  

                Wrap(
                  children: [
                    for (var letter = 0; letter < mword[i].length; letter++)

                      /*Text(
                        " ${word[i][letter]} ",
                        style: TextStyle(fontSize: 30),
                      )*/

                      Container(
                        padding: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                          border: Border(
                            right: BorderSide(
                                width: 1.0, color: Colors.lightBlue.shade50),
                            top: BorderSide(
                                width: 1.0, color: Colors.lightBlue.shade50),
                            left: BorderSide(
                                width: 1.0, color: Colors.lightBlue.shade50),
                            bottom: BorderSide(
                                width: 1.0, color: Colors.lightBlue.shade900),
                          ),
                        ),
                        child: Wrap(
                          children: [
                            Container(
                                height: 25,
                                width: 25,
                                child: Visibility(
                                  visible: _isVisible,
                                  child: Text("${word[i][letter]}",
                                      style: TextStyle(fontSize: 20)),
                                ))
                          ],
                        ),
                      ),
                  ],
                ),
                Visibility(
                  visible: _isVisibleimg,
                  child:Text("Hint: ${hint[i]}",style: TextStyle(color:Colors.amber,fontSize: 24),),

                  ),

                Visibility(
                  visible: _isVisibleimg,
                  child:Image.asset(
                  "image/man$imgno.png",
                  height: 200,
                )),
                //Text("You have Clicked: $data"),
                Text(
                  "$win",
                  style: TextStyle(fontSize: 30, color: Colors.red),
                ),
                Container(
                  //height: 300,
                  child: Wrap(
                    children: [
                      for (var j = 0; j < s.length; j++)
                        MaterialButton(
                          child: Visibility(
                            visible: _isVisiblebutton,
                            child: Text("${s[j]}"),
                          ),
                          onPressed: () {
                            createGame(j);
                            showText();
                            //print(j);
                            check(j);

                            PressedButton(j);
                            result();
                            
                            //checking(s[j]);

                            setState(() {
                              //print(s[j]);
                              s = s.replaceAll(s[j], "");
                              if(win!=""){
                                s = s.replaceAll(s, "");
                                word[i]=mword[i];
                              }

                              //print(s[j]);
                            });
                          },
                        ),
                    ],
                  ),
                ),
               
              ],
            )
          ]),
        ));
  }
}
