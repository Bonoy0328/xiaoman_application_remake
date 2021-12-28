class Music {
  int id;
  String image;
  String file;
  String name;
  String author;
  String date;
  int likes;
  int shares;

  Music(
      {required this.id,
      required this.date,
      required this.image,
      required this.name,
      required this.author,
      required this.file,
      required this.likes,
      required this.shares});
}
