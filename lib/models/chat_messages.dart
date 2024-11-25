class ChatMessages{
  final String msg;
  final int msgIndex;

  ChatMessages({
    required this.msg,
    required this.msgIndex
});

  factory ChatMessages.fromJson(Map<String,dynamic>json) => ChatMessages(
      msg:json["msg"],
      msgIndex:json["chatIndex"]
  );
}