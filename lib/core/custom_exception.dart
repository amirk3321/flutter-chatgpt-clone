

class ChatGPTServerException implements Exception {
  final String message;

  const ChatGPTServerException({required this.message});
}
