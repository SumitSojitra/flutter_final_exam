class QuotesModel {
  int id;
  String mood;
  String quote;
  String author;

  QuotesModel(
      {required this.id,
      required this.author,
      required this.mood,
      required this.quote});

  factory QuotesModel.fromMap({required Map<String, dynamic> data}) {
    return QuotesModel(
        id: data['id'],
        author: data['author'],
        mood: data['mood'],
        quote: data['quote']);
  }
}
