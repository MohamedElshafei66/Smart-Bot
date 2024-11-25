class ChatModels {
  final String id;
  final int created;

  ChatModels({
    required this.id,
    required this.created
});

  factory ChatModels.fromJson(Map<String,dynamic> json) => ChatModels(
      id:json['id'],
      created:json['created']
  );

  static List<ChatModels> modelsFromSnapShot(List modelsSnapshot){
    return modelsSnapshot.map((data)=>ChatModels.fromJson(data)).toList();
  }
}