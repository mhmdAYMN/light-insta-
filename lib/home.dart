import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:instgram/myhome.dart';
import 'package:instgram/post.dart';
import 'story.dart';
import 'package:firebase_auth/firebase_auth.dart';
final  _auth=FirebaseAuth.instance;
//import '';
final cloud=Firestore.instance;
int  _selectedIndex =0;

String user1 ;
FirebaseUser loggedin;
void getcuurentuser() async{
  try{
    final user= await  _auth.currentUser();
    if(user!=null){
      loggedin=user;
      print(user.email);


    }
  }
  catch(e){
    print(e);
  }
}

class HOME extends StatelessWidget {
  //getcuurentuser();
  @override

  Widget build(BuildContext context) {
    getcuurentuser();
    return Scaffold(
       backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 1.0,

        backgroundColor: Colors.white,
        title: Text('GallaryON', style: TextStyle(color: Colors.black,fontSize: 20.0,fontWeight: FontWeight.w500)),
        actions: [
          //IconButton(icon :Icon(Icons.account_balance,color: Colors.black,), ),

          Column(mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                child: Container(
                  child: Center(child: Icon(Icons.add,size: 22.0,color: Colors.black,),),
                  width: 28.0,
                  height: 28.0,
                 // color: Colors.blueGrey,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7.0),
                    //color: Colors.white,


                    border:Border.all(

                      color: Colors.black,
                      width: 2.0
                    )
                  ),



                ),
                onTap:() {Navigator.pushNamed(context, 'add');}
              ),
            ],
          ),
          SizedBox(width: 20.0,),
         // SizedBox(width: 30.0,),
          IconButton(icon :Icon(Icons.search,color: Colors.black,size: 28.0,), ),
          SizedBox(width: 20.0,),





        ],



      ),
      body: Column(

        children:<Widget> [
           //Padding(
             //padding: const EdgeInsets.all(8.0),
             //child: Container(
              //color: Colors.white70,
              //width: double.infinity,
              //height: 105.0,
               //child: ListView(
                 //scrollDirection: Axis.horizontal,
                 //children: [

              //   ],
            //   ),

          //),
           //),
          StreamBuilder<QuerySnapshot>(
            stream: cloud.collection('post').snapshots(),
            builder: (context,snapshot){
              if(!snapshot.hasData){
                return Center(
                  child: Text('no data yet'),
                );

              }
              List<yourpost> postlist=[];
              cloud.collection('post');
              var posts=snapshot.data.documents;
              for(var post in posts){

                String t=post.data['text'];
                String  i =post.data['image'];
                String  u =post.data['sender'];


                Widget postW=yourpost( url: i,text: t,username: u,  );


                postlist.add(postW);
              }









             return Expanded(child: ListView(

               children: postlist,
             ));
            }









          )


          
          //Container(),
        ],
      ),
    );
  }

}
/////////////////////*****

