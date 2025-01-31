import 'package:uuid/uuid.dart';

var uuid = Uuid();

class Chat {
  final String id;
  final String name;
  final String? after; // ID of previous chat (nullable)

  Chat({required this.id, required this.name, this.after});
}