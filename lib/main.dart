import 'package:flutter/material.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Game',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: TicTacToe(),
    );
  }
}


class TicTacToe extends StatefulWidget{
  @override
  _TicTacToeState createState() => _TicTacToeState();
}

class _TicTacToeState extends State<TicTacToe>{
  List<String>board = List.generate(9, (index) => "");
  String currentPlayer = "X";
  String winner = "";

  void handleTap(int index){
    if(board[index] == "" && winner == ""){
      setState(() {
        board[index] = currentPlayer;
        currentPlayer = currentPlayer == "X" ? "O" : "X";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic Tac Toe'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Turn: $currentPlayer",
          style: TextStyle(fontSize: 24),
          ),
        ],
      ),
    );
  }
}



class _MyHomePageState extends State<TicTacToe> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(),

    );
  }
}
