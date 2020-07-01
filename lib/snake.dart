import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static List<int> snakePosition = [45,65,85,105,125];
  int numberOfSquares = 640;

  static var randomNumber = Random();
  int food = randomNumber.nextInt(600);
  void generateNewFood(){
    food = randomNumber.nextInt(600);
    for(int i=0;i<snakePosition.length;i++){
      if(food==snakePosition[i]){
        generateNewFood();
        break;
      }
    }
  }

  void startGame(){
    snakePosition = [45,65,85,105,125];
    const duration = const Duration(milliseconds: 300);
    Timer.periodic(duration, (Timer timer){
      updateSnake();
      if(gameOver()){
        timer.cancel();
        _showGameOverScreen();
      }
    });
  }
  
  var direction = 'down';
  void updateSnake(){
    setState(() {
      switch (direction){
        case 'down':
          if(snakePosition.last >620){
            snakePosition.add(snakePosition.last + 20 -640);
          }else{
            snakePosition.add(snakePosition.last + 20);
          }
          break;

        case 'up':
          if(snakePosition.last <20){
            snakePosition.add(snakePosition.last - 20 +640);
          }else{
            snakePosition.add(snakePosition.last - 20);
          }
          break;
        case 'left':
          if(snakePosition.last % 20 ==0){
            snakePosition.add(snakePosition.last -1 +20);
          }else{
            snakePosition.add(snakePosition.last -1);
          }
          break;
        case 'right':
          if((snakePosition.last+1)%20 ==0){
            snakePosition.add(snakePosition.last + 1 -20);
          }else{
            snakePosition.add(snakePosition.last + 1);
          }
          break;

        default:
      }

      if(snakePosition.last == food){
        generateNewFood();
      }else{
        snakePosition.removeAt(0);
      }
    });
  }
  
  bool gameOver(){
    for(int i=0;i<snakePosition.length;i++){
      int count=0;
      for(int j=0;j<snakePosition.length;j++){
        if(snakePosition[i] == snakePosition[j]){
          count +=1;
        }
        if(count==2){
          return true;
        }
      }
    }
    return false;
  }

  void _showGameOverScreen(){
    showDialog(context: context,
    builder: (BuildContext context){
      return AlertDialog(
        title: Text("Game Over!"),
        content: Text('You\'re score: '+snakePosition.length.toString()),
        actions: <Widget>[
          FlatButton(
            onPressed:(){
              generateNewFood();
              Navigator.of(context).pop();
              startGame();
              
            }, 
            child: Text('Play Again!!'),
          )
        ],
      );
    }
    );
  }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      body: Column(
        children: <Widget>[
          Expanded(
            child: GestureDetector(
              onVerticalDragUpdate:(details){
                if(direction != 'up' && details.delta.dy > 0){
                  direction = 'down';
                }else if(direction != 'down' && details.delta.dy <0){
                  direction = 'up';
                }
              },
              onHorizontalDragUpdate: (details){
                if(direction != 'left' && details.delta.dx > 0){
                  direction = 'right';
                }else if(direction != 'right' && details.delta.dx <0){
                  direction = 'left';
                }
              },

              child: Container(
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: numberOfSquares,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 20
                  ),
                  itemBuilder: (BuildContext context, int index){
                    if(snakePosition.contains(index)){
                      return Center(
                        child: Container(
                          padding: EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: Container(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      );
                    }
                    if(index==food){
                      return Container(
                        padding: EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(color: Colors.red),
                        ),
                      );
                    }else{
                      return Container(
                        padding: EdgeInsets.all(2),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Container(color: Colors.yellow[100]),
                        ),
                      );
                    }
                  },
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0,left: 20.0,right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: startGame,
                  child: Text(
                    "START",
                    style: TextStyle(color: Colors.black,fontSize: 20,fontStyle: FontStyle.italic),
                  ),
                ),
                Text(
                  "3000",
                  style: TextStyle(color: Colors.black,fontSize: 20,fontStyle: FontStyle.italic),
                ),
              ],
            ),
          )

        ],
      ),
    );
  }
}