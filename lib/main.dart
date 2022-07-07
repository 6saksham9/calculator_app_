import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calculator',
      theme: ThemeData(primarySwatch: Colors.lightBlue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int firstnum = 0, secondnum = 0;
  String texttodisplay = "", res = "", operatortoperform = "";

  void buttonclicked(String buttonvalue) {
    if (buttonvalue == 'C') {
      firstnum = 0;
      secondnum = 0;
      texttodisplay = "";
      res = "";
    } else if (buttonvalue == '+' ||
        buttonvalue == '-' ||
        buttonvalue == 'x' ||
        buttonvalue == '/') {
      firstnum = int.parse(texttodisplay);
      res = "";
      operatortoperform = buttonvalue;
    } else if (buttonvalue == '=') {
      secondnum = int.parse(texttodisplay);
      if (operatortoperform == '+') res = (firstnum + secondnum).toString();
      if (operatortoperform == 'x') res = (firstnum * secondnum).toString();
      if (operatortoperform == '/') res = (firstnum ~/ secondnum).toString();
      if (operatortoperform == '-') res = (firstnum - secondnum).toString();
    } else {
      res = int.parse(texttodisplay + buttonvalue).toString();
    }

    setState(() {
      texttodisplay = res;
    });
  }

  Widget custombutton(String buttonvalue) {
    return Expanded(
        child: SizedBox(
      width: 80,
      height: 80,
      child: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: () => buttonclicked(buttonvalue),
        child: Text(
          // ignore: unnecessary_string_interpolations
          "$buttonvalue",
          style: const TextStyle(
            fontSize: 25.0,
            fontWeight: FontWeight.w600,
            color: Colors.white,
          ),
        ),
      ),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Calculator",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.black,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        color: const Color(0xff323E42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Expanded(
                child: Container(
              alignment: Alignment.bottomRight,
              padding: const EdgeInsets.all(15),
              // ignore: unnecessary_string_interpolations
              child: Text('$texttodisplay',
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 40.0,
                    color: Colors.white70,
                  )),
            )),
            Row(
              children: <Widget>[
                custombutton("7"),
                custombutton("8"),
                custombutton("9"),
                custombutton("x"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                custombutton("4"),
                custombutton("5"),
                custombutton("6"),
                custombutton("-"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                custombutton("1"),
                custombutton("2"),
                custombutton("3"),
                custombutton("+"),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              children: <Widget>[
                custombutton("C"),
                custombutton("0"),
                custombutton("/"),
                custombutton("="),
              ],
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
