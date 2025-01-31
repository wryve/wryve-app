import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';
import 'package:wryve_app/models/chat.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  _ChatScreen createState() => _ChatScreen();
}

class _ChatScreen extends State<ChatScreen> {
  String _selectedID = '';
  final List<Chat> _chats = [
    Chat(id: Uuid().v4(), name: 'General Chat'),
    Chat(id: Uuid().v4(), name: 'Backend Architecture'),
    Chat(id: Uuid().v4(), name: 'Tech News'),
    Chat(id: Uuid().v4(), name: 'Client Application - iOS, Android'),
    Chat(id: Uuid().v4(), name: 'Gaming Room'),
    Chat(id: Uuid().v4(), name: 'Flutter Devs'),
    Chat(id: Uuid().v4(), name: 'Work Chat'),
    Chat(id: Uuid().v4(), name: 'Non-Functional Requirements'),
    Chat(id: Uuid().v4(), name: 'control over corporate or personal data: Non-Functional Requirements'),
  ];

  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Filter chat list based on search query
    final List<Chat> filteredChats = _chats
        .where((chat) =>
        chat.name.toLowerCase().contains(_searchQuery.toLowerCase()))
        .toList();

    return Scaffold(
      body: Row(
        children: [
          // Left column
          Expanded(
            flex: 25, // 30%
            child: Container(
              color: Colors.grey[900],
              child: Column(
                children: [
                  // Search bar
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: _searchController,
                      decoration: InputDecoration(
                        hintText: 'Search',
                        filled: true,
                        fillColor: Colors.grey[800],
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        prefixIcon: Icon(Icons.search, color: Colors.white70),
                      ),
                      style: TextStyle(color: Colors.white),
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                    ),
                  ),

                  // Chat list
                  Expanded(child: ListView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: filteredChats.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(
                          filteredChats[index].name,
                          style: TextStyle(
                            color: _selectedID == filteredChats[index].id ? Colors.blue : Colors.white,
                            fontWeight: _selectedID == filteredChats[index].id ? FontWeight.bold : FontWeight.normal,
                            fontSize: 14,
                          ),
                        ),
                        tileColor: _selectedID == filteredChats[index].id ? Colors.blueGrey[800] : null,
                        onTap: () {
                          setState(() {
                            _selectedID = filteredChats[index].id;
                          });
                        },
                      );
                    },
                  ))
                ],
              )
            )
          ),
          // Right column
          Expanded(
            flex: 75, // 70%
            child: Container(

            ),
          ),
        ],
      ), // Row
    );
  }
}