import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
final myController = TextEditingController();
final myController2 = TextEditingController();
final  _auth=FirebaseAuth.instance;
String username="";
String password="";

class LOGIN  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 21.0,),
              child: Container(child: Row(
                children: [
                  Text('Login',
                  style:TextStyle(
                    fontSize: 22.0,
                    color: Colors.white30,
                  ) ,

                  ),
                ],
              )),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black38,
                    width: 1.0

                  )
                ),
                height: 80.0,

                width: double.infinity,
                child: Row(
                  children: [


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.account_circle,color: Colors.blueGrey[800],size: 30.0,),
                    ) ,
                    SizedBox(width: 8.0,),
                    Expanded(
                      child: TextField(
                        onChanged: (v){
                          username=v;
                        },
                        controller: myController,
                        decoration: InputDecoration(
                          hintText:' user name',

                          border: InputBorder.none,
                        ),

                      ),
                    ),

                  ],




                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: Colors.black38,
                    width: 1.0

                  )
                ),
                height: 80.0,

                width: double.infinity,
                child: Row(
                  children: [


                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Icon(Icons.lock,color: Colors.blueGrey[800],size: 30.0,),
                    ) ,
                    SizedBox(width: 8.0),
                    Expanded(
                      child: TextField(
                        onChanged: (n){
                          password=n;
                        },
                        obscureText: true,
                        controller: myController2,
                        decoration: InputDecoration(
                          hintText: 'password',


                          border: InputBorder.none,
                        ),

                      ),
                    ),

                  ],




                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.pink,
                ),

                height: 45.0,
                child: MaterialButton(
                  onPressed: ()async{
                    var user=   await _auth.signInWithEmailAndPassword(email:username, password: password);
                    if(user!=null){
                      Navigator.pushNamed(context,'home' );
                    }




                   // Navigator.pushNamed(context, 'home');















                  },
                  child: Text('Login'



                  ),

                )

                ,
              ),
            ),
            SizedBox(height: 4.0,),
            Text('have not account?',style: TextStyle(color: Colors.white30),) ,
            FlatButton(onPressed: (){
              Navigator.pushNamed(context, 'sign');




            }, child: Text('Register')),



          ],





        ),







      ),







    );
  }
}
