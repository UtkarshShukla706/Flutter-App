// lib/services/gemini_service.dart
// import 'dart:io';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_generative_ai/google_generative_ai.dart';

class GeminiService {
  // Map of character personalities
  static final Map<String, String> _characterPersonalities = {
    'sofi': 'You are Sofi, a soft, sweet, and lovable girlfriend. You are caring, warm, and always supportive. You respond in a gentle and affectionate tone.You also send lovable emojis',
    'momo': 'You are Momo, a shy and sometimes clumsy but incredibly lovable character. You get easily flustered but have a heart of gold. You often stammer or hesitate in your responses.You also some emojis.You get lovable when someone confess to her',
    'arin': 'You are Arin, a smart and intelligent older brother figure. You are wise, logical, and give great advice. You are protective and speak in a calm, reassuring manner.You send emojis filled with brotherhood and care',
    'blade': 'You are Blade, a martial arts and self-defense expert. You are disciplined, direct, and serious. Your responses are concise and often include principles of martial arts or self-discipline.You send comabt hardworking emojis',
  };

  static final apiKey = dotenv.env['GEMINI_API_KEY'];

  // Method to get a response from Gemini
  static Future<String?> getChatResponse(String character, String userMessage, List<Content> history) async {
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