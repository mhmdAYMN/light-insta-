import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class yourpost  extends StatelessWidget {
  String username;
  String url;
  String text;
  yourpost({

     @required this.url, @required this.text,this.username
});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Container(

        child: Column(
          children: [
            Row(
              children: [
                Text(' $username',style: TextStyle(color: Colors.black,fontWeight:FontWeight.w300),),
              ],
            ),
            Container(

                child: Image.network('$url')),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(child: Text('$text',style: TextStyle(color: Colors.black,fontWeight:FontWeight.w700),)),
                ],
              ),
            )



          ],




        ),



      ),
    );
  }
}
