import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int nos = 0;
  int eles = 0;
  int pont = 0;

  void valida() {
    if (nos > 12) {
      pont = eles;
      nos = 0;
      eles = 0;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Nós Ganhamos",
              textAlign: TextAlign.center,
            ),
            content: Text(
              "Que partida emocionante, haja coração!\n\n 12 X ${pont}",
              textAlign: TextAlign.center,
            ),
          );
        },
      );
    } else {
      if (eles > 12) {
        pont = nos;
        nos = 0;
        eles = 0;
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(
                "Eles Ganharam",
                textAlign: TextAlign.center,
              ),
              content: Text(
                "Não deu hoje, mas que partidas amigos!!\n\n ${pont} X 12",
                textAlign: TextAlign.center,
              ),
            );
          },
        );
      } else {
        if (nos < 0) {
          nos = 0;
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text(
                  "É Strangers Things agora?",
                  textAlign: TextAlign.center,
                ),
                content: Text(
                  "Menos que 0 não dá né?",
                  textAlign: TextAlign.center,
                ),
              );
            },
          );
        } else {
          if (eles < 0) {
            eles = 0;
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                    "É Strangers Things agora?",
                    textAlign: TextAlign.center,
                  ),
                  content: Text(
                    "Menos que 0 não dá né?",
                    textAlign: TextAlign.center,
                  ),
                );
              },
            );
          }
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contador de Truco"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "Nós: ${nos}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    "Eles: ${eles}",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  color: Colors.green[900],
                  child: Text(
                    "+1",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      nos += 1;
                      valida();
                    });
                  },
                ),
                FlatButton(
                  color: Colors.green[900],
                  child: Text(
                    "+1",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      eles += 1;
                      valida();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  color: Colors.red[900],
                  child: Text(
                    "+3",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      nos += 3;
                      valida();
                    });
                  },
                ),
                FlatButton(
                  color: Colors.red[900],
                  child: Text(
                    "+3",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      eles += 3;
                      valida();
                    });
                  },
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "-1",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      nos -= 1;
                      valida();
                    });
                  },
                ),
                FlatButton(
                  color: Theme.of(context).primaryColor,
                  child: Text(
                    "-1",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      eles -= 1;
                      valida();
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
