import 'package:flutter/material.dart';
class story  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: CircleAvatar(
              radius:40.0,

              backgroundImage: NetworkImage('https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
              // child: Image.network('https://images.pexels.com/photos/1987301/pexels-photo-1987301.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' ,fit: BoxFit.cover,)

            ),
          ),
          Text('Esraa',style: TextStyle(fontWeight: FontWeight.w700,),)
        ],
      ),
    );
  }
}