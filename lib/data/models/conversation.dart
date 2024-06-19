class Conversation{
  String? senderName;
  String? messageContent;
  DateTime? lastMessageDate;
  int unReadCount;
  bool isConnected;

  Conversation({
    this.senderName,
    this.messageContent,
    this.lastMessageDate,
    this.unReadCount = 0,
    this.isConnected = false
  });
}