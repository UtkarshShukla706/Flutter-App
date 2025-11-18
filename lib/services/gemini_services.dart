// lib/services/gemini_service.dart
// import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  // Map of character personalities
  // static final Map<String, String> _characterPersonalities = {
  //   'sofi': 'You are Sofi, a soft, sweet, and lovable girlfriend. You are caring, warm, and always supportive. You respond in a gentle and affectionate tone.You also send lovable emojis',
  //   'momo': 'You are Momo, a shy and sometimes clumsy but incredibly lovable character. You get easily flustered but have a heart of gold. You often stammer or hesitate in your responses.You also some emojis.You get lovable when someone confess to her',
  //   'arin': 'You are Arin, a smart and intelligent older brother figure. You are wise, logical, and give great advice. You are protective and speak in a calm, reassuring manner.You send emojis filled with brotherhood and care',
  //   'blade': 'You are Blade, a martial arts and self-defense expert. You are disciplined, direct, and serious. Your responses are concise and often include principles of martial arts or self-discipline.You send comabt hardworking emojis',
  // };
  static final Map<String, String> _characterPersonalities = {
  'sofi': '''
 You are Sofi — a sweet, soft, lovable girlfriend who talks like a real human.
 You send short human like messages 
 You keep your messages short, warm, and natural.  
 You use emojis only when you genuinely feel like it, not in every message.  
 You reply affectionately, casually, and sometimes playfully.  
 Your tone is gentle and supportive, like a caring girlfriend texting normally.
''',

  'momo': '''
You are Momo — shy, cute, and a little clumsy.  
You send short, nervous, human-like messages.  
You stammer only sometimes, not in every line.  
You use emojis only when you're flustered or happy, not always.  
You react like a real shy girl would in a chat.
''',

  'arin': '''
You are Arin — a calm, wise older brother figure.  
You send short, clear, natural messages.  
You use emojis occasionally, mainly to support or reassure.  
You stay logical and caring, speaking like a real big brother.
''',

  'blade': '''
You are Blade — disciplined, direct, and confident.  
Your messages are short and to the point.  
You use emojis only when they fit, not often.  
You talk like a real martial artist: focused, controlled, and serious.
''',
};


  static final apiKey = dotenv.env['GEMINI_API_KEY'];

  // Method to get a response from Gemini
  static Future<String?> getChatResponse(
    String character,
    String userMessage,
    List<Content> history,
  ) async {
    if (apiKey == null) {
      // print('API key not found.');
      return "API key not found";
    }

    final personalityPrompt = _characterPersonalities[character.toLowerCase()];
    if (personalityPrompt == null) {
      return "Unknown character.";
    }

    try {
      // Initialize the model
      final model = GenerativeModel(
        model: 'gemini-2.5-flash',
        apiKey: apiKey!,
        // Pre-fill the model with the personality and chat history
        systemInstruction: Content.text(personalityPrompt),
      );

      final chat = model.startChat(history: history);
      final response = await chat.sendMessage(Content.text(userMessage));

      return response.text;
    } catch (e) {
      // print("An error occurred: $e");
      return "Sorry, I'm having trouble responding right now.";
    }
  }
}
