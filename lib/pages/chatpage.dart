import 'package:flutter/material.dart';
// import 'package:newpro1/pages/home.dart';

// The main chat page widget.
class Chatpage extends StatefulWidget {
  const Chatpage({super.key});

  @override
  State<Chatpage> createState() => _ChatpageState();
}

class _ChatpageState extends State<Chatpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      backgroundColor: const Color(0xFF553370),
      
     
      appBar: AppBar(
        
        backgroundColor: const Color(0xFF553370),
    elevation: 0,
        
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Color(0xffc199cd),
          ),
          onPressed: () {
            
            
           

          
          },
        ),
        
        title: const Text(
          "Utkarsh Shukla",
          style: TextStyle(
            color: Color(0xffc199cd),
            fontSize: 20.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      
        centerTitle: true,
      ),

     
      body: Container(
        
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Column(
          children: [
           
            Expanded(
              child: _MessageList(),
            ),
           
            _MessageInputField(),
          ],
        ),
      ),
    );
  }
}


class _MessageList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // A ListView is used to display a scrollable list of messages.
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 10.0),
      children: const [
        // A reusable widget for displaying a single chat bubble.
        _ChatBubble(
          text: "Hello this is the chat page",
          isSender: true, // This is a message from the current user.
        ),
        SizedBox(height: 15.0),
        _ChatBubble(
          text: "Hello ! this is the second chat page...",
          isSender: false, 
        ),
      ],
    );
  }
}


class _ChatBubble extends StatelessWidget {
  final String text;
  final bool isSender;

  const _ChatBubble({
    required this.text,
    required this.isSender,
  });

 @override
Widget build(BuildContext context) {
  return Align(
    alignment: isSender ? Alignment.centerRight : Alignment.centerLeft,
    child: Container(
      constraints: BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width * 0.7,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
      margin: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      decoration: BoxDecoration(
        color: isSender
            ? const Color(0xFF0078FF) // modern blue for sender
            : const Color(0xFFE9EEF6), // light grey-blue for receiver
        borderRadius: isSender
            ? const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
              )
            : const BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16.0,
          color: isSender ? Colors.white : Colors.black87,
          fontWeight: FontWeight.w500,
          height: 1.3,
        ),
      ),
    ),
  );
}

}

class _MessageInputField extends StatelessWidget {
  @override
    @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
       
        child: Row(
          children: [
            // Text Field
            Expanded(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: const TextField(
                  decoration: InputDecoration(
                    hintText: "Type a message...",
                    hintStyle: TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                  ),
                  minLines: 1,
                  maxLines: 4,
                ),
              ),
            ),

            const SizedBox(width: 8),

            // Send Button
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFF0078FF), // Modern blue color
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: const Icon(Icons.send, color: Colors.white),
                onPressed: () {
                  
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}