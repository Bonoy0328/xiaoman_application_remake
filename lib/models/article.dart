class Article {
  int id;
  String date;
  String title;
  String author;
  String image;
  String content;
  int likes;
  int shares;

  Article(
      {required this.id,
      required this.date,
      required this.title,
      required this.author,
      required this.image,
      required this.content,
      required this.likes,
      required this.shares});
}
