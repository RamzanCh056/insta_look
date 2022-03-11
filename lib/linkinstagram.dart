import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:insta_look/addrow.dart';
class linkinstagram extends StatefulWidget {
  const linkinstagram({ Key? key }) : super(key: key);

  @override
  _linkinstagramState createState() => _linkinstagramState();
}

class _linkinstagramState extends State<linkinstagram> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:   AppBar(
        centerTitle: true,
      backgroundColor: Color.fromARGB(241, 1, 23, 34),
    title: Text('aestheticpie'),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        bottom: Radius.circular(30),
      ),
    ),
  ),


  body: Column(children: [

    SizedBox(height: 30,),
         Row(
           mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                //  color: Colors.white,
                  minWidth: 30,
                  height: 50,
                  
                  onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context)=> AddRow ()));// signup
                  },
                  shape: RoundedRectangleBorder(
                    side: BorderSide(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child:  Row(mainAxisAlignment: MainAxisAlignment.center,
             children: [
                  
         Icon(Icons.add_circle_rounded, color: Colors.black, ),
            SizedBox(width: 10,),
            Text(
             "Add a Row",
             style: TextStyle(
               fontWeight: FontWeight.w600,
               fontSize: 18,color: Colors.black,
             ),

           ),

           

           ],),
                ),
              
             
              
              
              
              ],
            ),
            SizedBox(height: 40,),
            Column(children: [
              Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                 width: 133,
                  child: Image.network('https://oasis.opstatics.com/content/dam/oasis/page/2021/operation/1217/homepage/mo/02-OnePlus-9.jpg' , fit: BoxFit.fill, )


             ),
               Row(children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                 width: 133,
                  child: Image.network('https://www.gardendesign.com/pictures/images/675x529Max/site_3/helianthus-yellow-flower-pixabay_11863.jpg' , fit: BoxFit.fill, )


             ),
             


              ],),
                Row(children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                 width: 133,
                  child: Image.network('https://st3.depositphotos.com/3047333/12924/i/600/depositphotos_129246006-stock-photo-kitten-sitting-in-flowers.jpg' , fit: BoxFit.fill, )


             ),
             


              ],),
             


              ],),

SizedBox(height: 10,),

                 Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                 width: 133,
                  child: Image.network('https://media.istockphoto.com/photos/snowy-peaks-of-the-caucasus-mountains-picture-id1327243304?b=1&k=20&m=1327243304&s=170667a&w=0&h=eVHzfEbMv7ki-LY0p-KO4L7X19KaqMYe2GmfPwcrGjU=' , fit: BoxFit.fill, )


             ),
               Row(children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                width: 133,
                  child: Image.network('https://cdn.britannica.com/67/19367-050-885866B4/Valley-Taurus-Mountains-Turkey.jpg' , fit: BoxFit.fill, )


             ),
             


              ],),
                Row(children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                width: 133,
                  child: Image.network('https://images.pexels.com/photos/40784/drops-of-water-water-nature-liquid-40784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' , fit: BoxFit.fill, )


             ),
             


              ],),
             


              ],),

              SizedBox(height: 10,),

                 Row( mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                 width: 133,
                  child: Image.network('https://site.tre-altamira.com/wp-content/uploads/2018/06/earth_zoom-1440x901.jpg' , fit: BoxFit.fill, )


             ),
               Row(children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                 width: 133,
                  child: Image.network('https://cdn.pixabay.com/photo/2016/05/05/02/37/sunset-1373171__480.jpg' , fit: BoxFit.fill, )


             ),
             


              ],),
                Row(children: [
             Container(
                 color: Colors.grey,
                 height: 118,
                 width: 133,
                  child: Image.network('https://images.pexels.com/photos/40784/drops-of-water-water-nature-liquid-40784.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500' , fit: BoxFit.fill, )


             ),
             


              ],),
             


              ],),
             
              
              



            ],)






  ],),
    );
  }
}