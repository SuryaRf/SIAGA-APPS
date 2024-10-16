class Community {
  final String id;
  final String name;
  final String description;
  final String avatarUrl;
  final int memberCount; // Add memberCount property

  Community({
    required this.id,
    required this.name,
    required this.description,
    required this.avatarUrl,
    required this.memberCount, // Make sure to include memberCount in the constructor
  });
}


class Message {
  final String senderId;
  final String content;
  final DateTime timestamp;

  Message({
    required this.senderId,
    required this.content,
    required this.timestamp,
  });
}