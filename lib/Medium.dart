import 'package:flutter/material.dart';
import 'dart:math';
import 'dart:core';
class Medium extends StatefulWidget {
  @override
   _MediumState createState() => _MediumState();
}
class _MediumState extends State<Medium> {
   AssetImage fish=AssetImage("images/01.png");
   AssetImage bub=AssetImage("images/03.ico");
   AssetImage des=AssetImage("images/02.jpeg");
   AssetImage shark=AssetImage("images/04.png");
   int home;
   int X=90;
   num minsteps;
   num gamesteps;
   num x,y;
   bool over=false;
   bool movement=true;
   bool gameover=false;
   @override
   void initState(){
     super.initState();
     generatehome();
   }
   void generatehome(){
    int random=Random().nextInt(6);
    random+=4;
    int ten=Random().nextInt(7);
    random=random+(10*ten);
    if(random==28){
      random++;
    }
    num temp=random;
    num jaix=temp%10;
    temp=temp-jaix;
    temp=temp/10;
    num jaiy=9-temp;
    setState(() {
      this.y=jaiy;
     this.x=jaix;
     this.minsteps=jaix+jaiy+2;
     this.gamesteps=jaix+jaiy+2;
     this.home=random; 
    });
   }
   AssetImage draw(int i){
     if(!this.gameover&&!this.over){
       if(home==i){
       return des; 
     }else if(X==i){
       return fish;
     }else if(i==92||i==80||i==31||i==78||i==2||i==75||i==28){
       return shark;
     }
     else{
       return bub;
     }
     }else if(this.over){
       return shark;
     }else{
       return fish; 
     }
   }
   void topLogic(){
     if(this.movement){
       int temp=X;
     temp=temp-10;
     if(temp<0){
       temp=temp+100;
     };
     setState(() {
       this.X=temp;
       this.gamesteps--;
       if(X==home){
        this.gameover=true;
      };
      if(gamesteps==0){
        this.movement=false;
      }
      if(X==92||X==80||X==31||X==78||X==2||X==75||X==28){
        this.over=true;
      }
     });
     }else{

     }
   }
   void rightlogic(){
     if(this.movement){
       int temp=X;
     temp=temp+1;
     if(temp>99){
       temp=0;
     };
     setState(() {
      this.X=temp; 
      this.gamesteps--;
      if(X==home){
        this.gameover=true;
      };
      if(gamesteps==0){
        this.movement=false;
      }
      if(X==92||X==80||X==31||X==78||X==2||X==75||X==28){
        this.over=true;
      }
     });
     }else{}
   }
   void leftlogic(){
     if(this.movement){
       int temp=X;
     temp=temp-1;
     if(temp<0){
       temp=99;
     };
     setState(() {
      this.X=temp; 
      this.gamesteps--;
      if(X==home){
        this.gameover=true;
      };
      if(gamesteps==0){
        this.movement=false;
      }
      if(X==92||X==80||X==31||X==78||X==2||X==75||X==28){
        this.over=true;
      }
     });
     }else{}
   }
   void downlogic(){
     if(this.movement){
       int temp=X;
     temp=temp+10;
     if(temp>99){
       temp=temp-100;
     }
     setState(() {
      this.X=temp;
      this.gamesteps--; 
      if(X==home){
        this.gameover=true;
      };
      if(gamesteps==0){
        this.movement=false;
      }
      if(X==92||X==80||X==31||X==78||X==2||X==75||X==28){
        this.over=true;
      }
     });
     }else{}
   }
   
   
   
   
   
   
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("You have $gamesteps moves only",style: TextStyle(color:Colors.black),),
      ),
      body:Container(
        color: Colors.blue[100],
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: GridView.builder(
              padding: EdgeInsets.all(5.0),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 10,
                 childAspectRatio: 1.0,
                 crossAxisSpacing: 1.0,
                 mainAxisSpacing: 1.0,
               ),
               itemCount: 100,
               itemBuilder: (context,i)=>SizedBox(
                 height: 20.0,
                 width: 20.0,
                 child: Image(
                   image: draw(i),
                 ),
               ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[
                  ButtonTheme(
                  child:MaterialButton(
                    child: Text("RESET",style: TextStyle(color: Colors.black),),
                    color: Colors.blue,
                    onPressed:(){
                      setState(() {
                       this.generatehome() ;
                       this.X=90;
                       this.gameover=false;
                       this.movement=true;
                       this.over=false;
                      });
                    },
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  MaterialButton(
                    onPressed: (){},
                  ),
                  ButtonTheme(
                  child:MaterialButton(
                    child: Text("TOP",style: TextStyle(color: Colors.black),),
                    color: Colors.blue,
                    onPressed: (){this.topLogic();},
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  MaterialButton(
                    onPressed: (){},
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[
                  ButtonTheme(
                  child:MaterialButton(
                    
                    child: Text("LEFT",style: TextStyle(color: Colors.black),),
                    color: Colors.blue,
                    onPressed: (){this.leftlogic();},
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  MaterialButton(
                    child:Text("$gamesteps",style: TextStyle(
                      color: Colors.black,
                    ),),
                    onPressed: (){},
                  ),
                  ButtonTheme(
                  child: MaterialButton(
                    child: Text("RIGHT",style: TextStyle(color: Colors.black),),
                    color: Colors.blue,
                    onPressed: (){this.rightlogic();},
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,

                children: <Widget>[
                  ButtonTheme(
                    child:MaterialButton(
                    
                    child: Text("DOWN",style: TextStyle(color: Colors.black),),
                    color: Colors.blue,
                    onPressed: (){this.downlogic();},
                  ),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
                  ),
                  MaterialButton(
                    onPressed: (){},
                  ),
                ],
              ),
              
            ],
          )
        ],
      ),),
    );
  }
}