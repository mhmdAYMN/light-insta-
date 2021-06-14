import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path/path.dart' as Path;
import 'package:firebase_auth/firebase_auth.dart';
final  _auth=FirebaseAuth.instance;
//var image;
class NEW_ADD extends StatefulWidget {
  @override
  _NEW_ADDState createState() => _NEW_ADDState();
}

class _NEW_ADDState extends State<NEW_ADD> {

  final myController = TextEditingController();
  var _image ;
  String text='';
  String url;
  String mystringpost='';
  final cloud =Firestore.instance;

  Future _imgFromGallery() async {
    final image = await  ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  Future  _imgFromCamera() async {
    final image = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50
    );

    setState(() {
      _image = image;
    });
  }
  Future  _uploadImage()async{
    FirebaseStorage mystorage =FirebaseStorage( storageBucket: 'gs://instgram-1ae95.appspot.com');
    StorageReference ref =mystorage.ref().child(Path.basename(_image.path));
    StorageUploadTask storageUploadTask =ref.putFile(_image);
    StorageTaskSnapshot storageTaskSnapshot=await storageUploadTask.onComplete;
     url =await storageTaskSnapshot.ref.getDownloadURL();
    print(url);
    
    




  }
  FirebaseUser loggedin;
  Future getcuurentuser() async{
    try{
      final user= await _auth.currentUser();
      if(user!=null){
        loggedin=user;
        print(user.email);


      }
    }
    catch(e){
      print(e);
    }
  }
  Future _uploadinDatabase ()async{
    await  getcuurentuser();

    cloud.collection('post').add(

      {
        'image':url,
        'text':text,
        'sender':loggedin.email,









      }
    );




  }

/////////***


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [

          Center(child: MaterialButton(
            onPressed:()async{
              await _uploadImage();
              await _uploadinDatabase ();





              Navigator.pushNamed(context, 'home');
            } ,

            child: Text( 'Done' , style: TextStyle(fontWeight: FontWeight.w900,fontSize: 22.0,color: Colors.white),)

          ),
          ),
          SizedBox(width:30.0),



        ],
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [


          Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(child: _image==null?place:Image.file(_image) ),
              )) ,

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration( 
                borderRadius: BorderRadius.circular(12.0),

                border: Border.all(
                  width: 1.0,
                  color: Colors.black38
                )
              ),
              height: 75.0,
              width: double.infinity,
              //color: Colors.white,
              child: Row(
                //mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(width: 16.0),
                  Expanded(
                    child: Column(
                      //mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       SizedBox(height: 15.0,),
                       Expanded(
                         child: TextField(controller: myController,
                           maxLines: 6,
                           //textAlign: TextAlign.center,
                           onChanged: (value){text=value;},
                           decoration: new InputDecoration(

                             border: InputBorder.none,
                             hintText: 'Write something...',),
                           //onChanged:
                         ),
                       ),



                     ],
                    ),

                  ),
                  SizedBox(width: 20.0),
                  IconButton(
                    icon: Icon(Icons.image,size: 30.0,color: Colors.white70,),
                    onPressed: (){    _imgFromGallery();},
                  ),
                  SizedBox(width: 8.0,),

                  IconButton(
                    onPressed:(){ _imgFromCamera();},
                    icon: Icon(Icons.camera_alt,size: 30.0,color: Colors.white70,),
                  ),
                  SizedBox(width: 5.0,),



                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}
var place=Container(
  decoration: BoxDecoration(
    color: Colors.orange,
    borderRadius: BorderRadius.circular(8.0)
    
    
  ),

  width: double.infinity,
  
  child: Center(child: Text('upload your photo here',style: TextStyle(color: Colors.blueGrey[900],fontSize: 20.0,fontWeight: FontWeight.w700),)),


);

