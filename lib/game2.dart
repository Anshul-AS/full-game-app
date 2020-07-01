import 'package:flutter/material.dart';
class HomePage2 extends StatefulWidget {
  @override
   _HomePage2State createState() => _HomePage2State();
}
class _HomePage2State extends State<HomePage2> {
   AssetImage dory=AssetImage("images/dory.png");
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("Help Dory In Finding Home!",style: TextStyle(color: Colors.black,),),
      ),
      body: Container(
        color: Colors.blue[100],
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            
            ButtonTheme(
              height: 40.0,
              minWidth: 200.0,
              
              child: MaterialButton(
                onPressed: (){},
                child: Text("Select the level!!",style: TextStyle(fontSize: 40.0),),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
            ),
            MaterialButton(onPressed: (){},),
            ButtonTheme(
              height: 40.0,
              minWidth: 100.0,
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                
                color: Colors.blue,
                onPressed: ()=>Navigator.of(context).pushNamed("\a"),
                //=> Navigator.of(context).pushNamed("\ah"),
                child: Text("EASY",style: TextStyle(color:Colors.black,fontSize: 30.0),),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
            MaterialButton(onPressed: (){},),
            ButtonTheme(
              height: 40.0,
              minWidth: 100.0,
              padding: EdgeInsets.all(10.0),
              child: MaterialButton(
                color: Colors.blue,
                onPressed: ()=>Navigator.of(context).pushNamed("\b"),
                child: Text("MEDIUM",style: TextStyle(color:Colors.black,fontSize: 30.0),),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
            MaterialButton(onPressed: (){},),
            ButtonTheme(
              height: 40.0,
              minWidth: 100.0,
              padding: EdgeInsets.all(10.0),
              
              child: MaterialButton(
                color: Colors.blue,
                onPressed: ()=>Navigator.of(context).pushNamed("\c"),
                child: Text("HARD",style: TextStyle(color:Colors.black,fontSize: 30.0),),
              ),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0)),
            ),
            Container(
            margin: EdgeInsets.all(10.0),
            child:Image(
              image: dory,
              height: 195.0,
              
            ))
          ],
        ),
      ),
    );
  }
}