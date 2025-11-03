import 'package:flutter/material.dart';
class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body:Container(
        margin: EdgeInsets.only(top:50.0),
        child:Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left:20.0),
              child: Row(
                children: [
                  Icon(Icons.arrow_back_ios_new_outlined,color: Color(0xffc199cd),),
                  SizedBox(width: 100.0,),
                  Text(
                    "Utkarsh Shukla",style:TextStyle(
                      color:Color(0xffc199cd),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500
                    )
                  )
                ],
              ),
            ),
            SizedBox(height: 38.0,),
            Container(
              width:MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/1.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0),topRight: Radius.circular(30.0))
              ),
            )
          ],
        )
      )
    );
  }
}