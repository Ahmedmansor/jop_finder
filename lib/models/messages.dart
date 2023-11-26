class Messages {
  String? compId;
  String? name;
  String? body;
  String? image;
  String? time;
  bool? isUnread;

  Messages(
      {required this.image,
      required this.name,
      required this.body,
      required this.time,
      required this.isUnread,
      required this.compId});
}
