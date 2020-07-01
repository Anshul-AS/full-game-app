import 'package:flutter/material.dart';


class HomePage0 extends StatefulWidget {
  @override
   _HomePage0State createState() => _HomePage0State();
}


class _HomePage0State extends State<HomePage0> {
  
  //00
  bool iscross=true;
  String message;
  List<String> gamestate;
  AssetImage cross = AssetImage("images/cross.png");
  AssetImage circle = AssetImage("images/circle.png");
  AssetImage edit = AssetImage("images/edit.png");
  
  //01
  @override
  void initState(){
    super.initState();
    setState(() {
     this.gamestate=[
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
     ]; 
     this.message="";
    });
  }

  //02

  playgame(int index){
    if(gamestate[index]=="empty"){
      setState(() {
       if(this.iscross){
         gamestate[index]="cross";
       } else{
         gamestate[index]="circle";
       }
       this.iscross=!this.iscross;
       this.checkWin();
      });
    }
  }
  //03
  resetGame(){
    setState(() {
      this.gamestate=[
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
       "empty",
     ]; 
     this.message="";
    });
  }
  //04
  AssetImage getImage(String value){
    switch (value) {
      case ('circle'):
        return(circle);
        break;
        case ('empty'):
        return(edit);
        break;
        case ('cross'):
        return(cross);
        break;   
    }
  }

  //05
  checkWin(){
    if((gamestate[0] != 'empty')
      && (gamestate[1] == gamestate[0])
      && (gamestate[2] == gamestate[0])
    ){
        setState(() {
         this.message="${gamestate[0]} has won the game"; 
         
        });
    }else if((gamestate[3] != 'empty')
      && (gamestate[4] == gamestate[3])
      && (gamestate[5] == gamestate[3])
    ){
        setState(() {
         this.message="${gamestate[3]} has won the game"; 
        });
    }else if((gamestate[6] != 'empty')
      && (gamestate[7] == gamestate[6])
      && (gamestate[8] == gamestate[6])
    ){
        setState(() {
         this.message="${gamestate[6]} has won the game"; 
        });
    }else if((gamestate[0] != 'empty')
      && (gamestate[3] == gamestate[0])
      && (gamestate[6] == gamestate[0])
    ){
        setState(() {
         this.message="${gamestate[0]} has won the game"; 
        });
    }else if((gamestate[1] != 'empty')
      && (gamestate[4] == gamestate[1])
      && (gamestate[7] == gamestate[1])
    ){
        setState(() {
         this.message="${gamestate[1]} has won the game"; 
        });
    }else if((gamestate[2] != 'empty')
      && (gamestate[8] == gamestate[2])
      && (gamestate[5] == gamestate[2])
    ){
        setState(() {
         this.message="${gamestate[2]} has won the game"; 
        });
    }else if((gamestate[0] != 'empty')
      && (gamestate[4] == gamestate[0])
      && (gamestate[8] == gamestate[0])
    ){
        setState(() {
         this.message="${gamestate[0]} has won the game"; 
        });
    }else if((gamestate[6] != 'empty')
      && (gamestate[4] == gamestate[6])
      && (gamestate[2] == gamestate[6])
    ){
        setState(() {
         this.message="${gamestate[6]} has won the game"; 
        });
    }else if(!gamestate.contains("empty")){
      setState(() {
       this.message="game is draw"; 
      });
    }

  }




   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        title: Text("Tic Tac Toe Game!!",
        style: TextStyle(color: Colors.white,fontSize: 30.0),
        textAlign: TextAlign.center,),
      ),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
                padding: EdgeInsets.all(20.0),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1.0,
                  crossAxisSpacing: 10.0,
                  mainAxisSpacing: 10.0,
                ),
                itemCount: this.gamestate.length,
                itemBuilder: (context, i) => SizedBox(
                  width: 100.0,
                  height: 100.0,
                  child: MaterialButton(
                    onPressed:(){ this.playgame(i);}
                    ,
                    child: Image(
                      image: this.getImage(this.gamestate[i]),
                    ),
                  ),
                ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: Text(
              this.message,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,

              ),
            ),
          ),
          MaterialButton(
            color: Colors.purple,
            minWidth: 300.0,
            height: 50.0,
            child: Text("Reset game",
            style:TextStyle(
                color:Colors.white,
                fontSize:20.0,
            ),
            ),
            onPressed: (){
            this.resetGame();
            },
          ),
          
        ],
      )
       
    );
  }
} 