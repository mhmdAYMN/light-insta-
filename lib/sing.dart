import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
final  _auth=FirebaseAuth.instance;
final myController = TextEditingController();
final myController2 = TextEditingController();
String mail;
String password;
class signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body:   Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21.0,),
            child: Container(child: Row(
              children: [
                Text('Sign Up',
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
                      onChanged: (v0){
                        mail=v0;
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
                      onChanged: (v){
                        password=v;
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

                  final new_user = await _auth.createUserWithEmailAndPassword(
                      email: mail, password: password);
                  if (new_user!=null){
                    Navigator.pushNamed(context, 'login');
                  }






                },
                child: Text('Sign UP'



                ),

              )

              ,
            ),
          ),




        ],





      ),









    );
  }
}
