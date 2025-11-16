// lib/pages/chatpage.dart
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:newpro1/pages/home.dart';
import 'package:newpro1/services/gemini_services.dart';
import '../services/database.dart';


class ChatPage extends StatefulWidget {
  final String characterName; // e.g., "sofi"
  final String characterImage; // e.g., "images/sofi.png"

  const ChatPage({
    Key? key,
    required this.characterName,
    required this.characterImage,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  final TextEditingController _textController = TextEditingController();
  final DatabaseMethods _databaseMethods = DatabaseMethods();
  bool _isLoading = false;

   void _sendMessage() async {
    if (_textController.text.isEmpty || _isLoading) return;

    final String userMessage = _textController.text;
    _textController.clear();
    setState(() {
      _isLoading = true;
    });

    try {
      
      debugPrint("Saving user message to Firestore...");
      await _databaseMethods.saveMessage(
        characterName: widget.characterName.toLowerCase(),
        text: userMessage,
        sender: 'user',
      );
      debugPrint("User message saved.");

     
      debugPrint("Fetching chat history...");
      final querySnapshot = await _databaseMethods.getChatHistoryAsFuture(widget.characterName.toLowerCase());
      debugPrint("Chat history fetched.");
      
      
      final history = querySnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        final role = data['sender'] == 'user' ? 'user' : 'model';
        return Content(role, [TextPart(data['text'])]);
      }).toList();

      // 3. Get response from Gemini
      debugPrint("Getting response from Gemini...");
      final botResponse = await GeminiService.getChatResponse(
          widget.characterName.toLowerCase(), userMessage, history);
      debugPrint("Gemini response received: $botResponse");

      // 4. Save bot response to Firestore
      if (botResponse != null) {
        debugPrint("Saving bot response to Firestore...");
        await _databaseMethods.saveMessage(
          characterName: widget.characterName.toLowerCase(),
          text: botResponse,
          sender: 'bot',
        );
        debugPrint("Bot response saved.");
      }
    } catch (e, s) {
      // In case of any error, print it and stop loading
      debugPrint("An error occurred in _sendMessage: $e");
      debugPrint("Stack trace: $s");

      
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to send message: $e')),
        );
      }
    } finally {
      // 5. IMPORTANT: Ensure loading is always turned off
      if(mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      debugPrint("Finished _sendMessage and reset loading state.");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=> Home())
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.characterImage),
            ),
            const SizedBox(width: 10),
            Text(widget.characterName.toUpperCase()),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder<QuerySnapshot>(
              stream: _databaseMethods.getChatHistory(widget.characterName.toLowerCase()),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                  return const Center(child: Text("No messages yet."));
                }
                if(snapshot.hasError) {
                   return const Center(child: Text("Error fetching messages."));
                }
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index].data() as Map<String, dynamic>;
                    final isUser = message['sender'] == 'user';
                    return ListTile(
                      title: Align(
                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isUser ? Colors.blue[100] : Colors.grey[300],
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(message['text']),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
          if (_isLoading) const Padding(
            padding: EdgeInsets.all(8.0),
            child: CircularProgressIndicator(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    decoration: InputDecoration(
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}