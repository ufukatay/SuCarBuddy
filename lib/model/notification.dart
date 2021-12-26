class Notif {
  String text;
  String date;

  Notif({
    required this.text,
    required this.date,
  });

  @override
  String toString() => 'Post: $text\nDate: $date';
}