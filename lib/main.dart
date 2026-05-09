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

        checkWinner();
        currentPlayer = currentPlayer == "X" ? "O" : "X";
      });
    }
  }
  void checkWinner() {
    List<List<int>> patterns = [
      [0,1,2], [3,4,5], [6,7,8],
      [0,3,6], [1,4,7], [2,5,8],
      [0,4,8], [2,4,6]
    ];

    for (var p in patterns) {
      String a = board[p[0]];
      String b = board[p[1]];
      String c = board[p[2]];

      if (a != "" && a == b && b == c) {
        winner = a;
        return;
      }
    }

    // Draw condition
    if (!board.contains("")) {
      winner = "Draw";
    }
  }
  void resetGame() {
    setState(() {
      board = List.generate(9, (index) => "");
      currentPlayer = "X";
      winner = "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "Tic Tac Toe",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
      winner == ""
      ? "Turn: $currentPlayer"
          : winner == "Draw"
      ? "It's a Draw!"
        : "Winner: $winner",
        style: TextStyle(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        )
          ),
          SizedBox(height: 20),
          Center(
            child: SizedBox(
              height: 320,
              width: 320,
              child: GridView.builder(
              shrinkWrap: true,
              itemCount: 9,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
              ),
              itemBuilder: (context,index){
                return GestureDetector(
                  onTap: () =>handleTap(index),
                   child: Container(
                    margin: EdgeInsets.all(6),
                      decoration: BoxDecoration(color: Colors.grey[900],
                                 borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                           BoxShadow(
                                    color: Colors.black54,
                          blurRadius: 4,
                             offset: Offset(2, 2),
                    ),
                  ],
                ),

                child: Center(
                  child: Text(
                  board[index],
                  style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: board[index] == "X"
                    ? Colors.cyan
                    : Colors.pinkAccent,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
            ),
          ),
          SizedBox(height: 20),

          ElevatedButton(
            onPressed: resetGame,
            child: Text("Restart Game"),
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
