import 'package:flutter/material.dart';
import 'package:simple_ques_ans/questions.dart';

void main() => runApp(MaterialApp(
      home: myapp(),
      debugShowCheckedModeBanner: false,
    ));

class myapp extends StatefulWidget {
  @override
  _myappState createState() => _myappState();
}

class _myappState extends State<myapp> {
  var score = 0;
  var n = 0;
  void checkanswer(bool choice, BuildContext ctx) {
    if (choice == _queslist[n].ans) {
      final snackbar = SnackBar(
          duration: Duration(milliseconds: 1000),
          backgroundColor: Colors.greenAccent.shade400,
          content: Text(
            'Correct Answer',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ));
      Scaffold.of(ctx).showSnackBar(snackbar);
      setState(() {
        score++;
      });
    } else {
      final snackbar = SnackBar(
          duration: Duration(milliseconds: 1000),
          backgroundColor: Colors.red.shade300,
          content: Text(
            'Wrong Answer',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ));
      Scaffold.of(ctx).showSnackBar(snackbar);
    }
  }

  void questionchange(BuildContext ctx) {
    if (_queslist.length - 1 > n) {
      setState(() {
        n++;
      });
    } else {
      final snackbar = SnackBar(
          duration: Duration(seconds: 5),
          backgroundColor: Colors.blueAccent,
          content: Text(
            'Quiz completed Your Score : $score/4',
            style: TextStyle(
                color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
          ));
      Scaffold.of(ctx).showSnackBar(snackbar);
      reset();
    }
  }

  void reset() {
    setState(() {
      score = 0;
      n = 0;
    });
  }

  List _queslist = [
    Questions("Are you a Indian citizen", true),
    Questions("Sun always rises at west", false),
    Questions("Respecting our parents is always our duty", true),
    Questions("Our earth is the centre of our solar system", false)
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple Quiz'),
        backgroundColor: Colors.brown,
        centerTitle: true,
      ),
      body: Builder(
        builder: (ctx) => Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Score: $score/4',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.black),
                  ),
                  InkWell(
                    onTap: () {
                      reset();
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 25,
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      _queslist[n].ques,
                      style: TextStyle(
                          fontSize: 20,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.brown, width: 4),
                    borderRadius: BorderRadius.circular(15.0)),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  RaisedButton(
                    onPressed: () {
                      checkanswer(true, ctx);
                      questionchange(ctx);
                    },
                    child: Text(
                      'TRUE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    textColor: Colors.white,
                    color: Colors.green,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  RaisedButton(
                    onPressed: () {
                      checkanswer(false, ctx);
                      questionchange(ctx);
                    },
                    child: Text(
                      'FALSE',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    textColor: Colors.white,
                    color: Colors.red,
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
