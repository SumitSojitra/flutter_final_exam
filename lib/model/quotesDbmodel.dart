class QuotesDabModel {
  int quoteId;
  String quoteMood;
  String quote;
  String quoteAuthor;

  QuotesDabModel({
    required this.quoteId,
    required this.quoteMood,
    required this.quote,
    required this.quoteAuthor,
  });

  factory QuotesDabModel.formMap({required Map data}) {
    return QuotesDabModel(
      quoteId: data['quote_id'],
      quoteMood: data['quoteMood'],
      quote: data['quote'],
      quoteAuthor: data['author'],
    );
  }
}
