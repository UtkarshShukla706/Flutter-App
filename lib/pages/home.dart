import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF553370),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                right: 20.0,
                top: 50.0,
                bottom: 20.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "ChatUp",
                    style: TextStyle(
                      color: Color(0xffc199cd),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Color(0xff3a2144),
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                    margin: EdgeInsets.only(left: 10.0),
                    child: const Icon(Icons.search, color: Color(0xffc199cd)),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 1.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/po.jpg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Utkarsh Shukla",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Hello my name is ...",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 80.0,),

                      Text("04:30 PM",style: TextStyle(
                        color: Colors.black45,
                        fontSize:14.0,fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                  SizedBox(height: 20.0,),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/po.jpg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Utkarsh Shukla",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Hello my name is ...",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 80.0,),

                      Text("04:30 PM",style: TextStyle(
                        color: Colors.black45,
                        fontSize:14.0,fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                   SizedBox(height: 20.0,),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/po.jpg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Utkarsh Shukla",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Hello my name is ...",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 80.0,),

                      Text("04:30 PM",style: TextStyle(
                        color: Colors.black45,
                        fontSize:14.0,fontWeight: FontWeight.w500
                      ),)
                    ],
                  ),
                   SizedBox(height: 20.0,),
                   Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(60),
                        child: Image.asset(
                          "images/po.jpg",
                          height: 40,
                          width: 40,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Utkarsh Shukla",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 17.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Hello my name is ...",
                            style: TextStyle(
                              color: Colors.black45,
                              fontSize: 15.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 80.0,),

                      Text("04:30 PM",style: TextStyle(
                        color: Colors.black45,
                        fontSize:14.0,fontWeight: FontWeight.w500
                      ),)
                    ],
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
