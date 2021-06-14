import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class POST extends StatefulWidget {
  @override
  _POSTState createState() => _POSTState();
}

class _POSTState extends State<POST> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(

        child: Column(
          children: [
           // Flexible(child: Image.network())
            Row(
              children: [
                CircleAvatar(
                  radius:15.0,

                  backgroundImage: NetworkImage('https://static.remove.bg/remove-bg-web/a72f919da581145bc8a52ac0c5d21f5c4741f367/assets/start_remove-79a4598a05a77ca999df1dcb434160994b6fde2c3e9101984fb1be0f16d0a74e.png'),
                  // child: Image.network('https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' ,fit: BoxFit.cover,)

                ),
                SizedBox(width: 10.0,),
                Text('sammar.ali',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 16.0),)

              ],


            ),
            SizedBox(height: 10.0,),
            Container(
              //height: 300.0,

              child: Image.network('https://pbs.twimg.com/profile_images/1176978746433318914/QaEiHIP6_400x400.jpg'),
            ),
            Row(
              children: [
                //
                 Icon(Icons.favorite_border,size: 35.0,),
                SizedBox(width: 12.0,),
                 Icon(Icons.message,size: 35.0,color: Colors.blueGrey[800],),





              ],
            ),
            SizedBox(height: 5.0,),
            Text('I wanna kill you I wanna kill you I wanna kill you I wanna kill you ',style: TextStyle(fontWeight: FontWeight.w700),)

            //

          ],



        ),
      ),
    );
  }
}
