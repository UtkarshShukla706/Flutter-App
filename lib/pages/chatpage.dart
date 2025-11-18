
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:newpro1/pages/home.dart';
import 'package:newpro1/services/gemini_services.dart';
import '../services/database.dart';


class ChatPage extends StatefulWidget {
  final String characterName;
  final String characterImage;

  
  const ChatPage({
    super.key,
    required this.characterName,
    required this.characterImage,
  });

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
     // Ensure loading is always turned off
      if(mounted) {
        setState(() {
          _isLoading = false;
        });
      }
      debugPrint("Finished _sendMessage and reset loading state.");
    }
  }

    void _clearChat() async {
    try {
      await _databaseMethods.clearChatHistory(widget.characterName.toLowerCase());
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Chat cleared successfully.')),
        );
      }
    } catch (e) {
      debugPrint("Error clearing chat: $e");
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to clear chat: $e')),
        );
      }
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: const Color(0xFF0A0E27),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E27),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context)=> Home())
          ),
        ),
        title: Row(
          children: [
            CircleAvatar(
              backgroundImage: AssetImage(widget.characterImage),
            ),
            const SizedBox(width: 12),
            Text(widget.characterName.toUpperCase(),style: const TextStyle(
                fontWeight: FontWeight.w700,
                color: Colors.white, 
                fontSize: 16.0, 
              ),),
          ],
        ),
        actions: [
          PopupMenuTheme(
            data: PopupMenuThemeData(color: Colors.black),
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: Colors.white),
              onSelected: (value) {
                if (value == 'clear_chat') {
                  _clearChat();
                }
              },
              itemBuilder: (BuildContext context) {
                return [
                  PopupMenuItem<String>(
                    
                    value: 'clear_chat',
                    
                    child: Row(
                      children: [
                        Icon(Icons.delete_outline, color: Colors.red),
                        SizedBox(width: 8),
                        Text(
                          'Clear Chat',
                          style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 12.0),
                        ),
                      ],
                    ),
                  ),
                ];
              },
            ),
          ),
        ],
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
                  return const Center(child: Text("No messages yet.",style: TextStyle(
                        color: Color(0xFFB0B0B0), 
                        fontSize: 14.0, 
                      ),));
                }
                if(snapshot.hasError) {
                   return const Center(child: Text("Error fetching messages.",style: TextStyle(
                        color: Color(0xFFB0B0B0),
                        fontSize: 14.0, 
                      ),));
                }
                final messages = snapshot.data!.docs;
                return ListView.builder(
                  reverse: true,
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index].data() as Map<String, dynamic>;
                    final isUser = message['sender'] == 'user';
                    return 
                       Align(
                        alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                        child: Container(
                          margin: const EdgeInsets.symmetric(vertical: 4.0),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: isUser ? const Color(0xFFE8FF00) : const Color(0xFF1A1F3A),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(message['text'],style: TextStyle(
                            color: isUser ? const Color(0xFF0A0E27) : Colors.white, 
                            fontSize: 14.0, 
                            fontWeight: FontWeight.w400, 
                          ),),
                        ),
                      );
                    
                  },
                );
              },
            ),
          ),
          // if (_isLoading) const Padding(
          //   padding: EdgeInsets.all(8.0),
          //   child: CircularProgressIndicator(),
          // ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _textController,
                    style: const TextStyle( 
                            fontWeight: FontWeight.w500, color: Colors.white, fontSize: 14.0),
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 14.0, horizontal: 20.0),
                       filled: true,
                      fillColor: const Color(0xFF252A42),
                      hintText: 'Type a message...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFF2A2F4A)), 
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: const BorderSide(color: Color(0xFFE8FF00)), 
                      ),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                SizedBox(width: 8.0),
                 Material(
                  color: const Color(0xFFE8FF00), 
                  borderRadius: BorderRadius.circular(30),
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Color(0xFF0A0E27)), 
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}