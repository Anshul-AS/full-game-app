import 'package:flutter/material.dart';
import 'dart:math';
class HomePage1 extends StatefulWidget {
  @override
   _HomePage1State createState() => _HomePage1State();
}
class _HomePage1State extends State<HomePage1> {
   //01
   AssetImage circle = AssetImage("images/circle1.png");
   AssetImage lucky = AssetImage("images/rupee.png");
   AssetImage unlucky = AssetImage("images/sadface.png");

   //02
   List<String> itemarray;
   int luckynumber;

   //03
   @override
   void initState() {
    super.initState();
    itemarray=List<String>.generate(25, (index)=>"empty");
    generaterandomnumber();
  }
   void generaterandomnumber(){
     int random =Random().nextInt(25);
     setState(() {
      luckynumber=random; 
     });
   }
  //04
  AssetImage getimage(int index){
    String current = itemarray[index];
    switch(current){
      case ("lucky"):
      return(lucky);
      break;
      case ("unlucky"):
      return(unlucky);
      break;
      
    }
    return(circle);

  }

  //05
  playgame(int index){
    if(luckynumber == index){
      setState(() {
       itemarray[index]="lucky"; 
      });

    }else{
      setState(() {
       itemarray[index]="unlucky"; 
      });
    }
  }

  //06
  showall(){
    setState(() {
     itemarray = List<String>.filled(25, "unlucky");
     itemarray[luckynumber]= "lucky";
    });
  }
  //07
  void resetgame(){
    setState(() {
     itemarray = List<String>.filled(25, "empty");
     generaterandomnumber();
    });
  }






   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("Scratch and Win!!",style: TextStyle(fontSize: 20.0),),
      ),
       body: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
         mainAxisAlignment: MainAxisAlignment.start,
         children: <Widget>[
           Expanded(
             child: GridView.builder(
               padding: EdgeInsets.all(20.0),
               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                 crossAxisCount: 5,
                 childAspectRatio: 1.0,
                 crossAxisSpacing: 10.0,
                 mainAxisSpacing: 10.0,
               ),
               itemCount: 25,
               itemBuilder: (context, i)=> SizedBox(
                 width: 50.0,
                 height: 50.0,
                 child: RaisedButton(
                   onPressed: (){
                     this.playgame(i);
                   },
                   child:Image(
                     image: this.getimage(i),
                   )
                 ),
               ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(15.0),
             child: RaisedButton(
                onPressed: (){
                 this.showall();
                },
                color: Colors.pink,
                padding: EdgeInsets.all(20.0),
                child:Text("Show All",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
                ),
             ),
           ),
           Container(
             margin: EdgeInsets.all(15.0),
             child: RaisedButton(
                onPressed: (){
                 this.resetgame();
                },
                color: Colors.pink,
                padding: EdgeInsets.all(20.0),
                child:Text("Reset!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0
                ),
                ),
             ),
           ),
         ],
       ),
    );
  }
} 