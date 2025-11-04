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
      body: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Row(
                children: [
                  Icon(
                    Icons.arrow_back_ios_new_outlined,
                    color: Color(0xffc199cd),
                  ),
                  SizedBox(width: 100.0),
                  Text(
                    "Utkarsh Shukla",
                    style: TextStyle(
                      color: Color(0xffc199cd),
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 38.0),
            Container(
              padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 50.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width / 2,
                    ),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      color: Color(0xFFfafbfd),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        bottomLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Hello this is the chat page",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  SizedBox(height: 20.0),

                  Container(
                    padding: EdgeInsets.all(10.0),
                    margin: EdgeInsets.only(
                      right: MediaQuery.of(context).size.width / 2,
                    ),
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255,211,228,243),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(10.0),
                        topRight: Radius.circular(10.0),
                        topLeft: Radius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Hello ! this is the second chat page...",
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
