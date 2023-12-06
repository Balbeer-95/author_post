class HomeModel{
  HomeModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
    required this.authorsName,
  });
  late final int userId;
  late final int id;
  late final String title;
  late final String body;
  late final String authorsName;
}