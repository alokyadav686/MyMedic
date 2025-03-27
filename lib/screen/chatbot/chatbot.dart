import 'package:flutter/material.dart';
import 'dart:async';
import 'package:my_medic/components/bottom_nav_bar.dart';
import 'package:my_medic/constants/colors.dart';
import 'package:my_medic/services/api/api_services.dart' as ApiService;

class ChatBotApp extends StatelessWidget {
  const ChatBotApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChatScreen(),
    );
  }
}

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final List<Map<String, String>> messages = [
    {"sender": "bot", "text": "Hi! How can I assist you today? 😊"},
  ];

  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  bool isTyping = false;
  String typingText = "";
  Timer? _typingTimer;

  void startTypingAnimation() {
    List<String> typingStates = ["", ".", "..", "..."];
    int index = 0;
    _typingTimer?.cancel();
    _typingTimer = Timer.periodic(Duration(milliseconds: 500), (timer) {
      setState(() {
        typingText = typingStates[index];
      });
      index = (index + 1) % typingStates.length;
    });
  }

  void stopTypingAnimation() {
    _typingTimer?.cancel();
    setState(() {
      isTyping = false;
      typingText = "";
    });
  }

  void sendMessage() async {
    if (_controller.text.isEmpty) return;
    String userMessage = _controller.text.trim();

    setState(() {
      messages.add({"sender": "user", "text": userMessage});
      isTyping = true;
      typingText = "";
      startTypingAnimation();
    });

    _controller.clear();
    scrollToBottom();

    try {
      String botResponse = await ApiService.chatbot(message: {"message": userMessage});
      
      setState(() {
        messages.add({"sender": "bot", "text": botResponse});
        stopTypingAnimation();
      });
    } catch (e) {
      setState(() {
        messages.add({"sender": "bot", "text": "Error: Unable to get response."});
        stopTypingAnimation();
      });
    }

    scrollToBottom();
  }

  void scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Text(
          "AI Assistant",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        leading: InkWell(
          onTap: () {
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) => BottomNavBar()));
          },
          child: const Icon(Icons.arrow_back_ios_sharp, color: Colors.white, size: 24),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(10),
              itemCount: messages.length + (isTyping ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == messages.length && isTyping) {
                  return Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 5,
                              spreadRadius: 1,
                            ),
                          ],
                        ),
                        child: Text(
                          "Typing$typingText", 
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ),
                  );
                }

                final msg = messages[index];
                bool isUser = (msg['sender'] ?? "") == "user";

                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.green.shade600 : Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 5,
                          spreadRadius: 1,
                        ),
                      ],
                    ),
                    child: Text(
                      msg['text']!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
            color: Colors.white,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: "Type your message...",
                      filled: true,
                      fillColor: Colors.white,
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide(color: Colors.green.shade700, width: 2),
                      ),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.send, color: Colors.green),
                  onPressed: sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
