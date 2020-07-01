import 'package:flutter/material.dart';
class HomePage extends StatefulWidget {
  @override
   _HomePageState createState() => _HomePageState();
}
class _HomePageState extends State<HomePage> {
   AssetImage getImage(int i){
     if(i==0){
       return(AssetImage("images/game0.png"));
     }
     if(i==1){
      return(AssetImage("images/game1.png"));
     }
     if(i==2){
       return(AssetImage("images/dory.png"));
     }
     if(i==3){
       return (AssetImage("images/snake.png"));
     }

   }
   
   
   @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text("Games!!",
        style: TextStyle(color: Colors.black,fontSize: 25.0),),
      ),
      body: Container(
        color: Colors.yellow[800],
        child: Center(
          child: Column(
            children: <Widget>[
              Image(
                image: AssetImage("images/start.png"),
                height: 200.0,
                width: 200.0,
              ),
              Expanded(
                child: GridView.builder(
                  padding: EdgeInsets.all(30.0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.0,
                    crossAxisSpacing: 50.0,
                    mainAxisSpacing: 50.0,
                  ),
                  itemCount: 4,
                  itemBuilder: (context,i)=>SizedBox(
                    width: 80.0,
                    height: 80.0,
                    child: MaterialButton(
                      color: Colors.red[900],
                      child:Image(
                        image: getImage(i),
                      ),
                      onPressed: (){
                        if(i==0){
                          return Navigator.of(context).pushNamed("\0");
                        }else if(i==1){
                          return Navigator.of(context).pushNamed("\1");
                        }else if(i==2){
                          return Navigator.of(context).pushNamed("\2");
                        }else if(i==3){
                          return Navigator.of(context).pushNamed("\d");
                        }else{
                          return null;
                        }
                      },
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
       
    );
  }
} 